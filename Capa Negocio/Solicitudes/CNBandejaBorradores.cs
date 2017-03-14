using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos.Solicitudes;
using System.Data;

namespace Capa_Negocio.Solicitudes
{
    public class CNBandejaBorradores
    {
        BandejaBorradores objCDBandeja = new BandejaBorradores();

        public DataTable SelectBorradorSolicitudes(int idUsuario)
        {
            return objCDBandeja.SelectBorradorSolicitudes(idUsuario);
        }

        public int SelectCantidadBorradores(int id_usuario)
        {
            return objCDBandeja.SelectCantidadBorradores(id_usuario);
        }

        public Boolean DeleteBorrador(int id_solicitud)
        {
            return objCDBandeja.DeleteBorrador(id_solicitud);
        }
    }
}
