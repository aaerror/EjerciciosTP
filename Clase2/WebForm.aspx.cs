using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Clase2
{
    public partial class WebForm : System.Web.UI.Page
    {
        private StreamReader _streamReader;

        private FileManagement _fileManagement;
        private CuentaBancaria _cuentaBancaria = new CuentaBancaria();
        private Movimiento _movimientoBancario;


        protected void Page_Load(object sender, EventArgs e)
        {
            var path = this.Server.MapPath(".") + "/cuentaBancaria.txt";
            _fileManagement = new FileManagement(path);

            if (_fileManagement.ExistRecordsFile())
            {
                ReadHistoricalData();
            }
        }

        private void ReadHistoricalData()
        {
            _cuentaBancaria.LimpiarMovimientos();
            foreach (string[] item in _fileManagement.ReadFile())
            {
                string concepto = item[1];
                DateTime fecha = DateTime.Parse(item[0]);
                float importe = float.Parse(item[2]);
                int tipoMovimiento = item[3] == "Debe" ? 0 : 1;

                _cuentaBancaria.AgregarMovimiento(concepto, fecha, importe, tipoMovimiento);
            };
        }

        #region ButtonEvents
        protected void GuardarButton_Click(object sender, EventArgs e)
        {
            StringBuilder errors = new StringBuilder(150, 200);

            var concepto = Concepto.Text;
            if (string.IsNullOrWhiteSpace(concepto))
            {
                errors.AppendLine("* Debe especificar datos del concepto.\n");
            }

            var fecha = Fecha.Text;
            if (string.IsNullOrWhiteSpace(fecha))
            {
                errors.AppendLine("* Debe especificar la fecha de la transacción.\n");
            }

            var importe = Importe.Text;
            if (string.IsNullOrWhiteSpace(importe))
            {
                errors.AppendLine("* Debe especificar el importe de la transacción.");
            }

            if (errors.Length > 0)
            {
                Mensaje.Text = errors.ToString();
                Mensaje.Visible = true;
                Mensaje.ForeColor = Color.DarkRed;
            }
            else
            {
                var tipoMovimiento = DebeHaber.Text;
                var movimientoBancario = new Movimiento(concepto, DateTime.Parse(fecha), float.Parse(importe), int.Parse(tipoMovimiento));
                _cuentaBancaria.AgregarMovimiento(concepto, DateTime.Parse(fecha), float.Parse(importe), int.Parse(tipoMovimiento));

                _fileManagement.WriteFile(movimientoBancario.ToString());
                errors.Clear();

                Mensaje.Text = "Datos registrados correctamente!";
                Mensaje.ForeColor = Color.RoyalBlue;
                Mensaje.Visible = true;
            }
        }

        protected void Mostrar_Click(object sender, EventArgs e)
        {
            var mes = int.Parse(Mes.Text);
            var movimientosPorMes = _cuentaBancaria.Movimientos.Where(x => x.Fecha.Month == mes).ToList();

            if (movimientosPorMes.Count > 0)
            {
                double balance = _cuentaBancaria.CalcularBalance(mes);
                StringBuilder historialMovimientos = new StringBuilder();
                foreach (var movimientoBancario in _cuentaBancaria.Movimientos)
                {
                    historialMovimientos.Append(movimientoBancario.ToString()).AppendLine("\n");
                }

                Registros.Text = historialMovimientos.ToString();

                Balance.Text = balance.ToString("C2");
                Balance.Visible = true;
            }
            else
            {
                Registros.Text = $"No existen movimientos registrados para el mes seleccionado.";
            }
        }
        #endregion
    }
}