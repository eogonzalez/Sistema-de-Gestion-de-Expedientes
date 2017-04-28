using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Entidad.Administracion
{
    public class CEWFTiempos
    {
        public int ID_WF_Tiempos { get; set; }
        public string TipoSolicitud { get; set; }
        public int Codigo_Estado { get; set; }
        public string Descripcion { get; set; }
        public int Dias_Max { get; set; }
        public int Dias_Min { get; set; }

    }
}
