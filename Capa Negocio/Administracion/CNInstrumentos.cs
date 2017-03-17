using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos.Administracion;
using System.Data;

namespace Capa_Negocio.Administracion
{
    public class CNInstrumentos
    {
        Instrumentos objCDInstrumentos = new Instrumentos();
        public DataTable SelectInstrumentos()
        {
            return objCDInstrumentos.SelectInstrumentos();
        }
    }
}
