using System;

namespace ParcialTP.Domain
{
    public class Genero
    {
        public int GeneroID { get; private set; }
        public string Descripcion { get; private set; }


        public Genero(int id, string descripcion)
            : this(descripcion)
        {
            GeneroID = id;
        }

        public Genero(string descripcion)
        {
            if (string.IsNullOrWhiteSpace(descripcion))
            {
                throw new ArgumentException("Descripción del género sin especificar", nameof(descripcion));
            }

            Descripcion = descripcion;
        }

        public override string ToString()
        {
            return $"Género: { Descripcion }";
        }
    }
}