using ParcialTP.DataAccess;
using ParcialTP.Domain;
using System;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Runtime.InteropServices;

namespace ParcialTP
{
    public partial class LibrosManagement : System.Web.UI.Page
    {
        private AccesoLibros _librosData = new AccesoLibros(ConfigurationManager.ConnectionStrings["connection"].ToString());
        private FileManagement _fileManagement;


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //CargarLibros();
                //Creamos un archivo de log
                var path = this.Server.MapPath(".") + "/libro_management.log";
                _fileManagement = new FileManagement(path);
            }
            catch (Exception ex)
            {
                Message.Text = ex.Message;
            }
        }

        /*private void CargarLibros()
        {
            var lista = _librosData.BuscarLibros();
            GridLibros.DataSource = lista;
            GridLibros.DataBind();

            if (lista.Count == 0)
            {
                MessageList.Text = "No hay libros en la base de datos.";
            }
        }*/

        #region Events
        protected void NewBook_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Title.Text))
            {
                Message.Visible = true;
                Message.Text="* Se debe ingresar un título.";
                Message.ForeColor = Color.IndianRed;
            }
            else
            {
                try
                {
                    int generoID = int.Parse(GenreList.SelectedItem.Value);
                    string descripcion = GenreList.SelectedItem.Text;
                    var genero = new Genero(generoID, descripcion);

                    var libro = new Libro(Title.Text, genero);

                    var result = _librosData.AgregarLibro(libro);

                    if (result != 0)
                    {
                        Title.Text = string.Empty;
                        //CargarLibros();
                        GridLibros.DataBind();

                        Message.Visible = true;
                        Message.Text = "¡Operación exitosa al agregar un libro!";
                        Message.ForeColor = Color.RoyalBlue;

                        // Registramos operación 
                        var logData = $"[{DateTime.Now.ToString("F")}]: Se ha registrado un nuevo libro.";
                        _fileManagement.WriteFile(logData);
                    }
                    else
                    {
                        Message.Visible = true;
                        Message.Text = "* Error al agregar un libro.";
                        Message.ForeColor = Color.IndianRed;
                    }

                }
                catch (Exception ex)
                {
                    Message.Visible = true;
                    Message.Text = ex.Message;
                    Message.ForeColor = Color.IndianRed;

                    // Registramos error al registrar un nuevo libro
                    var logData = $"[{DateTime.Now.ToString("F")}]: Error al agregar un nuevo libro. Error: { ex.Message }";
                    _fileManagement.WriteFile(logData);
                }
            }
        }

        protected void EditBook_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Title.Text))
            {
                Message.Visible = true;
                Message.Text = "* Se debe ingresar un título.";
                Message.ForeColor = Color.IndianRed;
            }
            else
            {
                try
                {
                    var result = SqlDataSource_Libros.Update();
                    if (result > 0)
                    {
                        Title.Text = string.Empty;
                        GenreList.SelectedIndex = 0;
                        GridLibros.DataBind();

                        Message.Visible = true;
                        Message.Text = "¡Operación exitosa al actualizar los datos del libro!";
                        Message.ForeColor = Color.RoyalBlue;

                        // Registramos operación
                        var logData = $"[{DateTime.Now.ToString("F")}]: Se han actualizado los datos de libro.";
                        _fileManagement.WriteFile(logData);
                    }
                    else
                    {
                        Message.Visible = true;
                        Message.Text = "* Error al actualizar los datos del libro.";
                        Message.ForeColor = Color.IndianRed;
                    }
                }
                catch (Exception ex)
                {
                    Message.Visible = true;
                    Message.Text = ex.Message;
                    Message.ForeColor = Color.IndianRed;

                    // Registramos operación 
                    var logData = $"[{DateTime.Now.ToString("F")}]: Error al actualizar los datos de un libro. Error: {ex.Message}";
                    _fileManagement.WriteFile(logData);
                }
            }
        }
        
        protected void NewGenre_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Genre.Text))
            {
                Message.Visible = true;
                Message.Text = "* Se debe ingresar un género.";
                Message.ForeColor = Color.IndianRed;
            }
            else
            {
                try
                {
                    var result = SQLDataSource_Generos.Insert();
                    Genre.Text = string.Empty;

                    if (result > 0)
                    {
                        Message.Visible = true;
                        Message.Text = "Nuevo género agregado exitosamente.";
                        Message.ForeColor = Color.RoyalBlue;

                        // Registramos operación 
                        var logData = $"[{DateTime.Now.ToString("F")}]: Se ha registrado un género.";
                        _fileManagement.WriteFile(logData);
                    }
                    else
                    {
                        Message.Visible = true;
                        Message.Text = "Error al agregar un género.";
                        Message.ForeColor = Color.IndianRed;
                    }
                }
                catch (Exception ex)
                {
                    Message.Visible = true;
                    Message.Text = ex.Message;
                    Message.ForeColor = Color.IndianRed;

                    // Registramos operación 
                    var logData = $"[{DateTime.Now.ToString("F")}]: Error al agregar un nuevo género. Error: { ex.Message }";
                    _fileManagement.WriteFile(logData);
                }
            }
        }

        protected void DeleteGenre_Click(object sender, EventArgs e)
        {
            try
            {
                var result = SQLDataSource_Generos.Delete();
                if (result > 0)
                {
                    Message.Visible = true;
                    Message.Text = "Género eliminado exitosamente.";
                    Message.ForeColor = Color.RoyalBlue;

                    // REGISTRAMOS OPERACIÓN
                    var logData = $"[{DateTime.Now.ToString("F")}]: Se ha eliminado un género.";
                    _fileManagement.WriteFile(logData);
                }
                else
                {
                    Message.Visible = true;
                    Message.Text = "Error al eliminar un género.";
                    Message.ForeColor = Color.IndianRed;
                }
            }
            catch (Exception ex)
            {
                Message.Visible = true;
                Message.Text = ex.Message;
                Message.ForeColor = Color.IndianRed;

                // REGISTRAMOS OPERACIÓN
                var logData = $"[{DateTime.Now.ToString("F")}]: Error al eliminar un género libro. Error: {ex.Message}";
                _fileManagement.WriteFile(logData);
            }
        }

        protected void GridLibros_SelectedIndexChanged(object sender, EventArgs e)
        {
            Title.Text = GridLibros.SelectedRow.Cells[1].Text;
            GenreList.Text = GridLibros.SelectedRow.Cells[2].Text;
        }

        protected void Filtrar_Click(object sender, EventArgs e)
        {
            SqlDataSource_Libros.FilterExpression = "genero_id = " + FILTER_GenreList.SelectedValue;
        }

        protected void QuitarFiltro_Click(object sender, EventArgs e)
        {
            SqlDataSource_Libros.FilterExpression = string.Empty;
            SqlDataSource_Libros.FilterParameters.Clear();
        }

        /*protected void Libros_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            try
            {
                var libroID = int.Parse(e.Values[0].ToString());
                var result = _librosData.BorrarLibro(libroID);

                if (result != 0)
                {
                    MessageList.Visible = true;
                    MessageList.Text = "¡Operación exitosa!";
                    MessageList.ForeColor = Color.RoyalBlue;
                    CargarLibros();
                }
            }
            catch (Exception ex)
            {
                MessageList.Visible = true;
                MessageList.Text = ex.Message;
                MessageList.ForeColor = Color.IndianRed;
            }
        }*/

        #endregion
    }
}