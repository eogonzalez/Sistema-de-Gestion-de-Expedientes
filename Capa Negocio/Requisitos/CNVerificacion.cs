using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Capa_Datos.Requisitos;
using Capa_Entidad.Requisitos;

namespace Capa_Negocio.Requisitos
{
    public class CNVerificacion
    {
        Verificacion objCDVerificacion = new Verificacion();

        public DataTable SelectRequisitos()
        {
            return objCDVerificacion.SelectRequisitos();
        }

        public Boolean SaveRequisito(CEVerificacion objCEVerificacion)
        {
            return objCDVerificacion.SaveRequisito(objCEVerificacion);
        }
    }
}
