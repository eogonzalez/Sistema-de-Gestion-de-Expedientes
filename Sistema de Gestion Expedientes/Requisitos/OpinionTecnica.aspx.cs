using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Negocio.Requisitos;
using Capa_Entidad.Requisitos;

namespace Sistema_de_Gestion_Expedientes.Requisitos
{
    public partial class OpinionTecnica : System.Web.UI.Page
    {
        CNOpinionTecnica objCNOpinion = new CNOpinionTecnica();
        CEOpinionTecnica objCEOpinion = new CEOpinionTecnica();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_gvRequisitosOpinion();
            }
        }

        protected void Llenar_gvRequisitosOpinion()
        {
            var tbl = new DataTable();

            tbl = objCNOpinion.SelectRequisitos();

            gvRequisitosOpinion.DataSource = tbl;
            gvRequisitosOpinion.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (GuardarRequisito())
            {
                Llenar_gvRequisitosOpinion();
            }
            else
            {
                ErrorMessage.Text = "Ha ocurrido un error al guardar requisito.";
            }
        }

        protected Boolean GuardarRequisito()
        {
            objCEOpinion.Nombre = txtNombre.Text;
            objCEOpinion.Descripcion = txtDescripcionOpcion.Text;
            objCEOpinion.Obligatorio = cb_obligatorio.Checked;

            return objCNOpinion.SaveRequisito(objCEOpinion);
        }
    }
}