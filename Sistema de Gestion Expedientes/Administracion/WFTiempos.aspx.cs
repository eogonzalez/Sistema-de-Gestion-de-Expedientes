using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Negocio.Administracion;
using Capa_Entidad.Administracion;
using System.Data;

namespace Sistema_de_Gestion_Expedientes.Administracion
{
    public partial class WFTiempos : System.Web.UI.Page
    {
        CNWFTiempos objCNWFTiempos = new CNWFTiempos();
        CEWFTiempos objCEWFTiempos = new CEWFTiempos();

        #region Eventos del formulario
                
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_gvTiempos();
                btnGuardar.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardar, ""));
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int id_estado = 0;
            if (Session["IDEstado"] != null)
            {
                id_estado = (Int32)Session["IDEstado"];
            }

            switch (btnGuardar.CommandName)
            {
                case "Editar":
                    if (ActualizarEstado(id_estado))
                    {
                        Llenar_gvTiempos();
                        LimpiarPanel();
                        btnGuardar.Text = "Guardar";
                        btnGuardar.CommandName = "Guardar";
                    }
                    else
                    {
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        ErrorMessage.Text = "Ha ocurrido un error al actualizar estado.";
                    }

                    break;
                case "Guardar":
                    if (GuardarEstado())
                    {
                        LimpiarPanel();
                        Llenar_gvTiempos();
                    }
                    else
                    {
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        ErrorMessage.Text = "Ha ocurrido un error al guardar Estado.";
                    }

                    break;
            }

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            LimpiarPanel();
            btnGuardar.Text = "Guardar";
            btnGuardar.CommandName = "Guardar";
        }

        protected void gvTiempos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = gvTiempos.Rows[index];
                int id_estado = Convert.ToInt32(row.Cells[0].Text);

                Session.Add("IdEstado", id_estado);

                switch (e.CommandName)
                {
                    case "modificar":
                        MostrarDatos(id_estado);
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        break;
                    case "eliminar":
                        EliminaEstado(id_estado);
                        Llenar_gvTiempos();
                        break;
                }
            }
        }

        protected void gvTiempos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTiempos.PageIndex = e.NewPageIndex;
            Llenar_gvTiempos();
        }

        #endregion

        #region Funciones

        protected void Llenar_gvTiempos()
        {
            var tbl = new DataTable();
            tbl = objCNWFTiempos.SelectEstadosTiempos();
            gvTiempos.DataSource = tbl;
            gvTiempos.DataBind();
        }

        protected void MostrarDatos(int id_estado)
        {
            btnGuardar.Text = "Editar";
            btnGuardar.CommandName = "Editar";

            var tbl = new DataTable();
            tbl = objCNWFTiempos.SelectEstado(id_estado);
            var row = tbl.Rows[0];

            cbo_tipoSolicitud.SelectedValue = row["tipoSolicitud"].ToString();
            txtCodigo.Text = row["codigo_estado"].ToString();
            txtNombre.Text = row["descripcion"].ToString();
            txtDiasMax.Text = row["dias_max"].ToString();
            txtDiasMin.Text = row["dias_min"].ToString();

        }

        protected Boolean EliminaEstado(int id_estado)
        {
            var respuesta = false;

            respuesta = objCNWFTiempos.DeleleEstado(id_estado);

            return respuesta;
        }

        protected bool ActualizarEstado(int id_estado)
        {
            var respuesta = false;

            objCEWFTiempos.ID_WF_Tiempos = id_estado;
            objCEWFTiempos.TipoSolicitud = getTipoSolicitud();
            objCEWFTiempos.Codigo_Estado = getCodigoEstado();
            objCEWFTiempos.Descripcion = getNombreEstado();
            objCEWFTiempos.Dias_Max = getDiasMaximos();
            objCEWFTiempos.Dias_Min = getDiasMinimos();

            respuesta = objCNWFTiempos.UpdateEstado(objCEWFTiempos);
            

            return respuesta;
        }

        protected void LimpiarPanel()
        {
            txtCodigo.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtDiasMax.Text = string.Empty;
            txtDiasMin.Text = string.Empty;
        }

        protected bool GuardarEstado()
        {
            var respuesta = false;

            objCEWFTiempos.TipoSolicitud = getTipoSolicitud();
            objCEWFTiempos.Codigo_Estado = getCodigoEstado();
            objCEWFTiempos.Descripcion = getNombreEstado();
            objCEWFTiempos.Dias_Max = getDiasMaximos();
            objCEWFTiempos.Dias_Min = getDiasMinimos();

            respuesta = objCNWFTiempos.InsertEstado(objCEWFTiempos);

            return respuesta;
        }

        #endregion

        #region Obtener datos del formulario

        protected int getCodigoEstado()
        {
            return Convert.ToInt32(txtCodigo.Text);
        }

        protected string getNombreEstado()
        {
            return txtNombre.Text;
        }

        protected string getTipoSolicitud()
        {
            return cbo_tipoSolicitud.SelectedValue.ToString();
        }

        protected int getDiasMaximos()
        {
            return Convert.ToInt32(txtDiasMax.Text);
        }

        protected int getDiasMinimos()
        {
            return Convert.ToInt32(txtDiasMin.Text);
        }

        #endregion

    }
}