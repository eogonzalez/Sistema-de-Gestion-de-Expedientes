using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Entidad.Administracion
{
    public class CEMenu
    {
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string URL { get; set; }
        public int Orden { get; set; }
        public Boolean Obligatorio { get; set; }
        public Boolean Visible { get; set; }

        public Boolean Login { get; set; }

        public int Id_Padre { get; set; }
    }
}
