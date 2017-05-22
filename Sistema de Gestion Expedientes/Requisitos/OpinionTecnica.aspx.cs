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

        #region Eventos del Formulario

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_gvRequisitosOpinion();
                btnGuardar.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardar, ""));
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int id_requisito = 0;
            if (Session["IDRequisitoOT"] != null)
            {
                id_requisito = (Int32)Session["IDRequisitoOT"];
            }

            switch (btnGuardar.CommandName)
            {
                case "Editar":
                    if (ActualizarRequisito(id_requisito))
                    {
                        Llenar_gvRequisitosOpinion();
                        LimpiarPanel();
                        btnGuardar.Text = "Guardar";
                        btnGuardar.CommandName = "Guardar";
                    }
                    else
                    {
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        ErrorMessage.Text = "Ha ocurrido un error al actualizar requisito.";
                    }
                    break;
                case "Guardar":

                    if (GuardarRequisito())
                    {
                        Llenar_gvRequisitosOpinion();
                        LimpiarPanel();
                    }
                    else
                    {
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        ErrorMessage.Text = "Ha ocurrido un error al guardar requisito.";
                    }

                    break;
                default:
                    break;
            }


        }

        protected void gvRequisitosOpinion_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {

                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = gvRequisitosOpinion.Rows[index];
                int id_requisito = Convert.ToInt32(row.Cells[0].Text);

                Session.Add("IDRequisitoOT", id_requisito);

                switch (e.CommandName)
                {
                    case "modificar":
                        MostrarDatos(id_requisito);
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        break;
                    case "eliminar":
                        EliminarRequisito(id_requisito);
                        Llenar_gvRequisitosOpinion();
                        break;
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            LimpiarPanel();
            btnGuardar.Text = "Guardar";
            btnGuardar.CommandName = "Guardar";
        }

        protected void gvRequisitosOpinion_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvRequisitosOpinion.PageIndex = e.NewPageIndex;
            Llenar_gvRequisitosOpinion();
        }

        #endregion

        #region Funciones

        protected void Llenar_gvRequisitosOpinion()
        {
            var tbl = new DataTable();

            tbl = objCNOpinion.SelectRequisitos();

            gvRequisitosOpinion.DataSource = tbl;
            gvRequisitosOpinion.DataBind();
        }

        protected Boolean ActualizarRequisito(int id_requisito)
        {
            var respuesta = false;

            objCEOpinion.ID_Requisito = id_requisito;
            objCEOpinion.Nombre = txtNombre.Text;
            objCEOpinion.Descripcion = txtDescripcionOpcion.Text;
            objCEOpinion.Obligatorio = cb_obligatorio.Checked;

            respuesta = objCNOpinion.UpdateRequisito(objCEOpinion);

            return respuesta;
        }

        protected Boolean GuardarRequisito()
        {
            objCEOpinion.Nombre = txtNombre.Text;
            objCEOpinion.Descripcion = txtDescripcionOpcion.Text;
            objCEOpinion.Obligatorio = cb_obligatorio.Checked;

            return objCNOpinion.SaveRequisito(objCEOpinion);
        }

        protected void MostrarDatos(int id_requisito)
        {
            btnGuardar.Text = "Editar";
            btnGuardar.CommandName = "Editar";

            var tbl = new DataTable();
            tbl = objCNOpinion.SelectRequisito(id_requisito);
            var row = tbl.Rows[0];

            txtNombre.Text = row["nombre"].ToString();
            txtDescripcionOpcion.Text = row["descripcion"].ToString();
            cb_obligatorio.Checked = (Boolean)row["obligatorio"];
        }

        protected void EliminarRequisito(int id_requisito)
        {
            objCNOpinion.DeleteRequisito(id_requisito);
        }

        protected void LimpiarPanel()
        {
            txtNombre.Text = string.Empty;
            txtDescripcionOpcion.Text = string.Empty;
            cb_obligatorio.Checked = false;
        }

        #endregion
        
    }
}