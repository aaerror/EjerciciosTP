using ParcialTP.Domain;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace ParcialTP.DataAccess
{
    public class AccesoLibros
    {
        private string _connection = string.Empty;


        public AccesoLibros(string connection)
        {
            if (string.IsNullOrWhiteSpace(connection))
            {
                throw new ArgumentException("Se debe proporcionar una cadena de conexión.");
            }

            _connection = connection;
        }

        public int AgregarLibro(Libro toAdd)
        {
            try
            {
                using (var connection = new SqlConnection(_connection))
                {
                    connection.Open();
                    string insert = "INSERT INTO libros(titulo, genero_id) " +
                                    "VALUES(@title, @genero)";

                    var command = new SqlCommand(insert, connection);
                    command.Parameters.AddWithValue("@title", toAdd.Titulo);
                    command.Parameters.AddWithValue("@genero", toAdd.Genero.GeneroID);
                    
                    return command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int EditarLibro(Libro toEdit)
        {
            try
            {
                using (var connection = new SqlConnection(_connection))
                {
                    string insert = "UPDATE libros" +
                                    "SET titulo = @titulo, genero_id = @genero_id" +
                                    "WHERE libro_id = @libro_id";

                    var command = new SqlCommand(insert, connection);
                    command.Parameters.AddWithValue("@libro_id", toEdit.LibroID);
                    command.Parameters.AddWithValue("@title", toEdit.Titulo);
                    command.Parameters.AddWithValue("@genero", toEdit.Genero.GeneroID);
                    return command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int BorrarLibro(int toDelete)
        {
            try
            {
                using (var connection = new SqlConnection(_connection))
                {
                    connection.Open();
                    string insert = "DELETE libros " +
                                    "WHERE libros_id = @libro_id";

                    var command = new SqlCommand(insert, connection);
                    command.Parameters.AddWithValue("@libro_id", toDelete);
                    return command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IReadOnlyCollection<Libro> BuscarLibros()
        {
            List<Libro> libros = new List<Libro>();
            try
            {
                using (var connection = new SqlConnection(_connection))
                {
                    connection.Open();
                    string query = "SELECT l.libros_id, l.titulo, l.genero_id, g.descripcion " +
                                   "FROM libros AS l INNER JOIN generos AS g " +
                                   "ON l.genero_id = g.genero_id";
                    var command = new SqlCommand(query, connection);
                    var reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            var unGenero = new Genero(reader.GetInt32(2), reader.GetString(3));
                            var unLibro = new Libro(reader.GetInt32(0), reader.GetString(1), unGenero);
                            libros.Add(unLibro);
                        }
                    }

                    reader.Close();

                    return libros.AsReadOnly();
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
        }
    }
}