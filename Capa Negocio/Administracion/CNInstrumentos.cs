using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos.Administracion;
using System.Data;
using Capa_Entidad.Administracion;

namespace Capa_Negocio.Administracion
{
    public class CNInstrumentos
    {
        Instrumentos objCDInstrumentos = new Instrumentos();
        public DataTable SelectInstrumentos()
        {
            return objCDInstrumentos.SelectInstrumentos();
        }

        public Boolean InsertInstrumentos(CEInstrumento objCEInstrumento)
        {
            return objCDInstrumentos.InsertInstrumentos(objCEInstrumento);
        }

        public DataTable SelectInstrumento(int id_instrumento)
        {
            return objCDInstrumentos.SelectInstrumento(id_instrumento);
        }

        public Boolean UpdateInstrumento(CEInstrumento objCEInstrumento)
        {
            return objCDInstrumentos.UpdateInstrumento(objCEInstrumento);
        }

        public Boolean DeleteInstrumento(CEInstrumento objCEInstrumento)
        {
            return objCDInstrumentos.DeleteInstrumento(objCEInstrumento);
        }
    }
}
