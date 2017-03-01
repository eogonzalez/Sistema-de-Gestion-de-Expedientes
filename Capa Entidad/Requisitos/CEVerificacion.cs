using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Entidad.Requisitos
{
    public class CEVerificacion
    {
        public int ID_Requisito { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public Boolean Obligatorio { get; set; }
    }
}
