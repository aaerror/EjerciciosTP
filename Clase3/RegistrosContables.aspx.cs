using System;
using System.Drawing;

namespace Clase3
{
    public partial class RegistrosContables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void Registrar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBxMonto.Text))
            {
                Mensaje.Visible = true;
                Mensaje.Text = "* Se debe ingresar el monto de la transacción.";
                Mensaje.ForeColor = Color.IndianRed;

                return;
            }

            try
            {
                SqlDataSource_RegistrosContables.InsertParameters["tipo"].DefaultValue = RadioButtonList_Tipo.SelectedValue;
                var result = SqlDataSource_RegistrosContables.Insert();
                
                txtBxMonto.Text = string.Empty;
                DropDownList_Cuentas.SelectedIndex = 0;
                RadioButtonList_Tipo.SelectedIndex = 0;

                if (result > 0)
                {
                    Mensaje.Visible = true;
                    Mensaje.Text = "Nueva transacción registrada exitosamente.";
                    Mensaje.ForeColor = Color.RoyalBlue;
                }
                else
                {
                    Mensaje.Visible = true;
                    Mensaje.Text = "Error al registrar una nueva transacción.";
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