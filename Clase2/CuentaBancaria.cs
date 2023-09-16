using System;
using System.Collections.Generic;
using System.Linq;

namespace Clase2
{
    public class CuentaBancaria
    {
        private List<Movimiento> _movimientos;
        public IReadOnlyCollection<Movimiento> Movimientos { get => _movimientos.AsReadOnly(); }


        public CuentaBancaria()
        {
            _movimientos = new List<Movimiento>();
        }

        public void AgregarMovimiento(string concepto, DateTime fecha, float importe, int tipoMovimiento)
        {
            var movimiento = new Movimiento(concepto, fecha, importe, tipoMovimiento);
            _movimientos.Add(movimiento);
        }

        public double CalcularBalance(int mes)
        {
            double debitos = _movimientos.Where(x => x.Fecha.Month == mes && x.TipoMovimiento.Equals(TipoMovimiento.Debe))
                                         .Select(x => x.Importe).Sum();

            double haberes = _movimientos.Where(x => x.Fecha.Month == mes && x.TipoMovimiento.Equals(TipoMovimiento.Haber))
                                         .Select(x => x.Importe).Sum();

            return (debitos - haberes);
        }

        public void LimpiarMovimientos()
        {
            _movimientos.Clear();
        }
    }
}