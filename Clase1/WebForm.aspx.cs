using System;
using System.Drawing;

namespace Clase1
{
    public partial class WebForm : System.Web.UI.Page
    {
        private float _numero1 = 0F;
        private float _numero2 = 0F;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Resultado.Visible = false;
            }
        }

        private bool ValidarNumero(string unNumero)
        {
            bool esValido = false;
            if (!string.IsNullOrWhiteSpace(unNumero))
            {
                if (!float.TryParse(unNumero, out _))
                {
                    Resultado.Visible = true;
                    Resultado.ForeColor = Color.IndianRed;
                    Resultado.Text = "Se deben ingresar números para realizar la operación matemática.";

                    return false;
                }

                esValido = true;
            }
            else
            {
                Resultado.Visible = true;
                Resultado.ForeColor = Color.Red;
                Resultado.Text = "Hay campos vacíos para realizar la operación solicitada.";
            }

            return esValido;
        }

        private void Calcular(float numero1, float numero2, string operacion)
        {
            double resultado = 0;
            switch (operacion.ToLower())
            {
                case "suma":
                    Resultado.ForeColor = Color.RoyalBlue;
                    Resultado.Text = (numero1 + numero2).ToString();
                    Resultado.Visible = true;
                    break;
                case "resta":
                    Resultado.ForeColor = Color.RoyalBlue;
                    Resultado.Text = (numero1 - numero2).ToString();
                    Resultado.Visible = true;
                    break;
                case "multiplicacion":
                    Resultado.ForeColor = Color.RoyalBlue;
                    Resultado.Text = (numero1 * numero2).ToString();
                    Resultado.Visible = true;
                    break;
                case "division":
                    if (numero2 != 0)
                    {
                        Resultado.ForeColor = Color.RoyalBlue;
                        Resultado.Text = (numero1 / numero2).ToString();
                        Resultado.Visible = true;
                    }
                    else
                    {
                        Resultado.ForeColor = Color.Red;
                        Resultado.Text = "Operación inválida. No se puede realizar la división por cero.";
                        Resultado.Visible = true;
                    }
                    break;
            }
        }

        protected void CalcularButton_Click(object sender, EventArgs e)
        {
            var numeroA = NumeroA.Text;
            if (ValidarNumero(numeroA))
            {
                _numero1 = float.Parse(numeroA);

                var numeroB = NumeroB.Text;
                if (ValidarNumero(numeroB))
                {
                    _numero2 = float.Parse(numeroB);

                    var operacion = Operacion.SelectedItem.Value;
                    Calcular(_numero1, _numero2, operacion);
                }
            }
        }
    }
}