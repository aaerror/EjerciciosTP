using System;
using System.Drawing;
using System.Web;

namespace Clase3
{
    public partial class RegistrarCuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void NuevaCuenta_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Descripcion.Text))
            {
                Mensaje.Visible = true;
                Mensaje.Text = "* Se debe ingresar un nombre para la cuenta.";
                Mensaje.ForeColor = Color.IndianRed;
            }
            else
            {
                try
                {
                    var result = SqlDataSource_Cuentas.Insert();
                    Descripcion.Text = string.Empty;

                    if (result > 0)
                    {
                        Mensaje.Visible = true;
                        Mensaje.Text = "Nueva cuenta bancaria agregada exitosamente.";
                        Mensaje.ForeColor = Color.RoyalBlue;
                    }
                    else
                    {
                        Mensaje.Visible = true;
                        Mensaje.Text = "Error al agregar una cuenta bancaria.";
                        Mensaje.ForeColor = Color.IndianRed;
                    }
                }
                catch (Exception ex)
                {
                    Mensaje.Visible = true;
                    Mensaje.Text = ex.Message;
                    Mensaje.ForeColor = Color.IndianRed;
                }
            }
        }
    }
}