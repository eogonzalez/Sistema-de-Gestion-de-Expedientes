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

        public DataTable SelectRequisito(int id_requisito)
        {
            return objCDVerificacion.SelectRequisito(id_requisito);
        }

        public Boolean DeleteRequisito(int id_requisito)
        {
            return objCDVerificacion.DeleteRequisito(id_requisito);
        }

        public Boolean UpdateRequisito(CEVerificacion objCEVerificacion)
        {
            return objCDVerificacion.UpdateRequisito(objCEVerificacion);
        }
    }
}
