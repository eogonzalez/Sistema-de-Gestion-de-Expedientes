using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos.Expedientes;
using System.Data;
using Capa_Entidad.Expedientes;

namespace Capa_Negocio.Expedientes
{
    public class CNBandejaPersonal
    {
        BandejaPersonal objCDBandeja = new BandejaPersonal();
        public DataTable SelectExpedientes(int id_usuario_dace)
        {
            return objCDBandeja.SelectExpedientes(id_usuario_dace);
        }

        public bool Update_WF_Estado(CEExpedientes objCEExpedientes)
        {
            return objCDBandeja.Update_WF_Estado(objCEExpedientes);
        }

        public DataTable SelectEstado(string tipo_solicitud, int codigo_estado)
        {
            return objCDBandeja.SelectEstado(tipo_solicitud, codigo_estado);
        }

        public bool RechazoExpediente(CEExpedientes objCEExpedientes)
        {
            return objCDBandeja.RechazoExpediente(objCEExpedientes);
        }

        public bool SolicitoAclaracionExpediente(CEExpedientes objCEExpedientes)
        {
            return objCDBandeja.SolicitoAclaracionExpediente(objCEExpedientes);
        }

        public int Ultimo_ID_Estado_WF_Expediente(int id_expediente)
        {
            return objCDBandeja.Ultimo_ID_Estado_WF_Expediente(id_expediente);
        }

        public bool RegresoExpediente(CEExpedientes objCEExpedientes)
        {
            return objCDBandeja.RegresoExpediente(objCEExpedientes);
        }

    }
}
