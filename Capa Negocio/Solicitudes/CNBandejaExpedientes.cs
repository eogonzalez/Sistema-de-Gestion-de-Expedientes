using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Capa_Datos.Solicitudes;

namespace Capa_Negocio.Solicitudes
{
    public class CNBandejaExpedientes
    {
        BandejaExpedientes objCDBandeja = new BandejaExpedientes();
        public DataTable SelectExpedientes()
        {
            return objCDBandeja.SelectExpedientes();
        }

        public int SelectCantidadExpedientes()
        {
            return objCDBandeja.SelectCantidadExpedientes();
        }
    }
}
