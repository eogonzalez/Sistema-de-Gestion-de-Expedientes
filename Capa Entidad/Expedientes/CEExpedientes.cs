using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Entidad.Expedientes
{
    public class CEExpedientes
    {
        public int ID_WF_Expediente { get; set; }
        public int ID_Expediente { get; set; }
        public int ID_Usuario_DACE { get; set; }
        public string Sigla_Estado { get; set; }
        public int Estado_Principal { get; set; }
        public int Estado_Alterno { get; set; }
        public int Dias_Maximos { get; set; }
        public int Dias_Minimos { get; set; }
        public string Observaciones { get; set; }
    }
}
