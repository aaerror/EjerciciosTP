using System;

namespace ParcialTP.Domain
{
    public class Libro
    {
        public int LibroID { get; private set; }

        public string Titulo { get; private set; }

        public Genero Genero { get; private set; } = null;



        public Libro(int libroID, string titulo, Genero genero)
            : this(titulo, genero)
        {
            LibroID = libroID;
        }

        public Libro(string titulo, Genero unGenero)
        {
            if (string.IsNullOrWhiteSpace(titulo))
            {
                throw new ArgumentException("Título del libro sin especificar.", nameof(titulo));
            }

            if (unGenero is null)
            {
                throw new ArgumentException("Género del libro sin especificar", nameof(Genero));
            }

            Titulo = titulo;
            Genero = unGenero;
        }

        public void CambiarNombreDelLibro(string nuevoTitulo)
        {
            if (string.IsNullOrWhiteSpace(nuevoTitulo))
            {
                return;
            }

            Titulo = nuevoTitulo;
        }

        public override string ToString()
        {
            return $"Libro: { Titulo }/n{ Genero }";
        }
    }
}