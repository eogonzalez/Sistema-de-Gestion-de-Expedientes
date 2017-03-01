using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos.Requisitos;
using System.Data;
using Capa_Entidad.Requisitos;

namespace Capa_Negocio.Requisitos
{
    public class CNOpinionTecnica
    {
        OpinionTecnica objCDOpinion = new OpinionTecnica();

        public DataTable SelectRequisitos()
        {
            return objCDOpinion.SelectRequisitos();
        }

        public Boolean SaveRequisito(CEOpinionTecnica objCEOpinion)
        {
            return objCDOpinion.SaveRequisito(objCEOpinion);
        }

        public DataTable SelectRequisito(int id_requisito)
        {
            return objCDOpinion.SelectRequisito(id_requisito);
        }

        public Boolean DeleteRequisito(int id_requisito)
        {
            return objCDOpinion.DeleteRequisito(id_requisito);
        }

        public Boolean UpdateRequisito(CEOpinionTecnica objCEOpinion)
        {
            return objCDOpinion.UpdateRequisito(objCEOpinion);
        }
    }
}
