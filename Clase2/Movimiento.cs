using System;

namespace Clase2
{
    public enum TipoMovimiento
    {
        Debe,
        Haber
    }

    public class Movimiento
    {
        public string Concepto { get; private set; }
        public DateTime Fecha { get; private set; }
        public float Importe { get; private set; }
        public TipoMovimiento TipoMovimiento { get; private set; }


        public Movimiento(string concepto, DateTime fecha, float importe, int tipoMovimiento)
        {
            Concepto = concepto;
            Fecha = fecha;
            Importe = importe;
            TipoMovimiento = (TipoMovimiento)tipoMovimiento;
        }

        public override string ToString()
        {
            return $"{Fecha.ToString("d")}\n" +
                   $"{Concepto}\n" +
                   $"{Importe}\n" +
                   $"{TipoMovimiento}";
        }
    }
}