using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Entidad.Requisitos;
using Capa_Negocio.Requisitos;

namespace Sistema_de_Gestion_Expedientes.Requisitos
{
    public partial class Verificacion : System.Web.UI.Page
    {
        CNVerificacion objCNVerificacion = new CNVerificacion();
        CEVerificacion objCEVerificacion = new CEVerificacion();

        #region Eventos del Formulario

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_gvRequisitosVerificacion();
                btnGuardar.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardar, ""));
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int id_requisito = 0;
            if (Session["IDRequisitoVO"] != null)
            {
                id_requisito = (int)Session["IDRequisitoVO"];
            }

            switch (btnGuardar.CommandName)
            {
                case "Editar":
                    if (ActualizarRequisito(id_requisito))
                    {
                        Llenar_gvRequisitosVerificacion();
                        LimpiarPanel();
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
                        Llenar_gvRequisitosVerificacion();
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

        protected void gvRequisitosVerificacion_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = gvRequisitosVerificacion.Rows[index];
            int id_requisito = Convert.ToInt32(row.Cells[0].Text);

            Session.Add("IDRequisitoVO", id_requisito);

            switch (e.CommandName)
            {
                case "modificar":
                    MostrarDatos(id_requisito);
                    lkBtn_viewPanel_ModalPopupExtender.Show();
                    break;
                case "eliminar":
                    EliminarRequisito(id_requisito);
                    Llenar_gvRequisitosVerificacion();
                    break;
                default:
                    break;
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            LimpiarPanel();
            btnGuardar.Text = "Guardar";
            btnGuardar.CommandName = "Guardar";
        }

        #endregion

        #region Funciones

        protected void Llenar_gvRequisitosVerificacion()
        {
            var tbl = new DataTable();

            tbl = objCNVerificacion.SelectRequisitos();

            gvRequisitosVerificacion.DataSource = tbl;
            gvRequisitosVerificacion.DataBind();
        }

        protected Boolean ActualizarRequisito(int id_requisito)
        {
            var respuesta = false;

            objCEVerificacion.ID_Requisito = id_requisito;
            objCEVerificacion.Nombre = txtNombre.Text;
            objCEVerificacion.Descripcion = txtDescripcionOpcion.Text;
            objCEVerificacion.Obligatorio = cb_obligatorio.Checked;

            respuesta = objCNVerificacion.UpdateRequisito(objCEVerificacion);

            return respuesta;
        }

        protected Boolean GuardarRequisito()
        {
            objCEVerificacion.Nombre = txtNombre.Text;
            objCEVerificacion.Descripcion = txtDescripcionOpcion.Text;
            objCEVerificacion.Obligatorio = cb_obligatorio.Checked;

            return objCNVerificacion.SaveRequisito(objCEVerificacion);
        }

        protected void MostrarDatos(int id_requisito)
        {
            btnGuardar.Text = "Editar";
            btnGuardar.CommandName = "Editar";

            var tbl = new DataTable();
            tbl = objCNVerificacion.SelectRequisito(id_requisito);
            var row = tbl.Rows[0];

            txtNombre.Text = row["nombre"].ToString();
            txtDescripcionOpcion.Text = row["descripcion"].ToString();
            cb_obligatorio.Checked = (Boolean)row["obligatorio"];
        }

        protected void EliminarRequisito(int id_requisito)
        {
            objCNVerificacion.DeleteRequisito(id_requisito);
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