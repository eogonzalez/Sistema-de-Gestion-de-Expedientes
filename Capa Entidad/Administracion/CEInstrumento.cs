using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Entidad.Administracion
{
    public class CEInstrumento
    {
        public int ID_Instrumento { get; set; }
        public string Nombre_Instrumento { get; set; }
        public string Sigla { get; set; }
        public string Observaciones { get; set; }

        public DateTime Fecha_Vigencia { get; set; }
        public int ID_UsuarioAutoriza { get; set; }
    }
}
