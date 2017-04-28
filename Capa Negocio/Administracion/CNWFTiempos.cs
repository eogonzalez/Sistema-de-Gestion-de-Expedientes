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
    public class CNWFTiempos
    {
        WFTiempos objCDWFTiempos = new WFTiempos();
        public DataTable SelectEstadosTiempos()
        {
            return objCDWFTiempos.SelectEstadosTiempos();
        }

        public bool InsertEstado(CEWFTiempos objCEEstado)
        {
            return objCDWFTiempos.InsertEstado(objCEEstado);
        }

        public DataTable SelectEstado(int id_estado)
        {
            return objCDWFTiempos.SelectEstado(id_estado);
        }

        public Boolean UpdateEstado(CEWFTiempos objCEEstado)
        {
            return objCDWFTiempos.UpdateEstado(objCEEstado);
        }

        public Boolean DeleleEstado(int id_estado)
        {
            return objCDWFTiempos.DeleleEstado(id_estado);
        }
    }
}
