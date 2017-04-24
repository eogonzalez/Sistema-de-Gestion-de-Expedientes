using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos.Expedientes;
using System.Data;

namespace Capa_Negocio.Expedientes
{
    public class CNBandejaPersonal
    {
        BandejaPersonal objCDBandeja = new BandejaPersonal();
        public DataTable SelectExpedientes(int id_usuario_dace)
        {
            return objCDBandeja.SelectExpedientes(id_usuario_dace);
        }
    }
}
