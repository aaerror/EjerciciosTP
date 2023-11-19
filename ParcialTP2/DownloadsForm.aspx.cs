using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace ParcialTP2
{
    public partial class DownloadsForm : System.Web.UI.Page
    {
        private string path = string.Empty;
        private List<Archivo> files = new List<Archivo>();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["path"] != null)
            {
                path = $"{ Session["path"] }\\files";
                Directory.CreateDirectory(path);
            }

            GetFiles();
            GridView_Files.DataSource = files;
            GridView_Files.DataBind();
        }

        private void GetFiles()
        {
            files.Clear();

            if (Directory.Exists(path))
            {
                foreach (string file in Directory.GetFiles(path))
                {
                    string filename = Path.GetFileName(file);
                    string type = Path.GetExtension(file);

                    var archivo = new Archivo(filename, path, type);
                    files.Add(archivo);
                }
            }
        }

        protected void Button_FileUpload_Click(object sender, EventArgs e)
        {
            foreach (HttpPostedFile file in FileUpload_Files.PostedFiles)
            {
                if (file.ContentLength > 1048576)
                {
                    lblMessage.Text = $"El archivo {file.FileName} supera el kilobyte.";
                    lblMessage.ForeColor = Color.IndianRed;
                    lblMessage.Visible = true;

                    return;
                }

                if (File.Exists($"{path}/{file.FileName}"))
                {
                    lblMessage.Text = $"El archivo {file.FileName} ya existe.";
                    lblMessage.ForeColor = Color.IndianRed;
                    lblMessage.Visible = true;

                    return;
                }

                if (!FileUpload_Files.HasFiles)
                {
                    lblMessage.Text = $"No se seleccionó ningún archivo.";
                    lblMessage.ForeColor = Color.IndianRed;
                    lblMessage.Visible = true;

                    return;
                }

                FileUpload_Files.SaveAs($"{ path }/{ file.FileName }");
                lblMessage.Text = $"El archivo { file.FileName } se guardo correctamente.";
                lblMessage.ForeColor = Color.RoyalBlue;
                lblMessage.Visible = true;
            }

            GetFiles();
            GridView_Files.DataSource = files;
            GridView_Files.DataBind();
        }

        protected void GridView_Files_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName is "Descargar")
            {
                GridViewRow row = GridView_Files.Rows[Convert.ToInt32(e.CommandArgument)];
                string file = row.Cells[1].Text;
                string path = row.Cells[2].Text;

                string filePath = $"{ path }\\{ file }";

                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.End();
            }
        }
    }
}