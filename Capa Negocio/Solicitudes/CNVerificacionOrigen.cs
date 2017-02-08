using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos.Solicitudes;
using System.Data;

namespace Capa_Negocio.Solicitudes
{
    public class CNVerificacionOrigen
    {
        VerificacionOrigen objCDVerificacionOrigen = new VerificacionOrigen();

        public DataTable SelectDatosSolicitante(int idUsuario)
        {
            return objCDVerificacionOrigen.SelectDatosSolicitante(idUsuario);
        }

    }
}
