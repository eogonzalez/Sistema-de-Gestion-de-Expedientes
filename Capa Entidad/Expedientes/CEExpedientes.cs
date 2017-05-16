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

        /*propiedades para motivos de rechazo de expediente*/
        public bool Motivo_1 { get; set; }
        public bool Motivo_2 { get; set; }
        public bool Motivo_3 { get; set; }
        public bool Motivo_4 { get; set; }
        public bool Check_Observaciones { get; set; }
        public string Observaciones_Motivo { get; set; }
        public bool Check_Otros_Motivos { get; set; }
        public string Otros_Motivos { get; set; }

        /*propiedades para solicitar aclaracion*/
        public int ID_Solicitud { get; set; }
    }

}
