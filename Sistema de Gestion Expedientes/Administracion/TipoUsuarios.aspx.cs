using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Negocio.Administracion;
using Capa_Entidad.Administracion;

namespace Sistema_de_Gestion_Expedientes.Administracion
{
    public partial class TipoUsuarios : System.Web.UI.Page
    {
        CNTipoUsuarios objCapaNegocio;
        CETipoUsuarios objetoEntidad;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnGuardar.Enabled = false;
                //gvTipoUsuario.Columns[1].Visible = false ;
                LLenar_gvTipoUsuario();
            }
        }

        protected void LLenar_gvTipoUsuario()
        {
            DataTable tbl = new DataTable();
            objCapaNegocio = new CNTipoUsuarios();

            tbl = objCapaNegocio.SelectTipoUsuarios().Tables[0];

            gvTipoUsuario.DataSource = tbl;
            gvTipoUsuario.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (GuardarTipoUsuario())
            {
                //Mensaje Se Guardo con exito
                LLenar_gvTipoUsuario();
                LimpiarTipoUsuario();
            }
            else
            {
                //Mensaje Error al Guardar
                lkBtn_nuevo_ModalPopupExtender.Show();
            }
        }

        protected Boolean GuardarTipoUsuario()
        {
            bool respuesta = false;
            objCapaNegocio = new CNTipoUsuarios();
            objetoEntidad = new CETipoUsuarios();

            objetoEntidad.Nombre = txtNombre.Text;
            objetoEntidad.Descripcion = txtDescripcion.Text;
            objetoEntidad.TipoPermiso = ddlTipoPermiso.SelectedValue;

            respuesta = objCapaNegocio.InsertTipoUsuarios(objetoEntidad);
            
            return respuesta;
        }

        protected void LimpiarTipoUsuario()
        {
            txtNombre.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
        }

    }
}