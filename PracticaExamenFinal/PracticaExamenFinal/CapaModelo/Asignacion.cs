using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PracticaExamenFinal.CapaModelo
{
    public class Asignacion
    {

        public int Id { get; set; }
        public int EmpleadoId { get; set; }
        public int ProyectoId { get; set; }
        public DateTime FechaAsignacion { get; set; }

        public Proyecto Proyecto { get; set; }
    }
}