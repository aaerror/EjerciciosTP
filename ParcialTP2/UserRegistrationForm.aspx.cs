using System;
using System.Drawing;
using System.IO;
using System.Web;

namespace ParcialTP2
{
    public partial class UserRegistrationForm : System.Web.UI.Page
    {
        private string path = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
             path = MapPath("./Users");
        }

        private void CleanFields()
        {
            txtBxEmail.Text = string.Empty;
            txtBxUser.Text = string.Empty;
            txtBxAge.Text = string.Empty;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!IsValid)
            {
                Response.Redirect("UserRegistrationForm.aspx");
            }

            var userPath = path + $"\\{ txtBxUser.Text }";
            if (Directory.Exists(userPath))
            {
                lblMessage.Visible = true;
                lblMessage.Text = $"El nombre de usuario { txtBxUser.Text } ya se encuentra registrado en sistema.";
                lblMessage.ForeColor = Color.LimeGreen;
            }
            else
            {
                Directory.CreateDirectory(userPath);

                lblMessage.Visible = true;
                lblMessage.Text = "Usuario registrado correctamente";
                lblMessage.ForeColor = Color.RoyalBlue;
            }

            var cookie = new HttpCookie("password", txtBxPassword.Text);
            cookie.Expires = DateTime.Now.AddMinutes(15);
            Response.Cookies.Add(cookie);

            this.Session.Add("username", txtBxUser.Text);
            this.Session.Add("password", txtBxPassword.Text);
            this.Session.Add("path", userPath);
            this.Session.Timeout = 30;

            var id = this.Session.Keys;

            Response.Redirect(Request.RawUrl);
        }
    }
}