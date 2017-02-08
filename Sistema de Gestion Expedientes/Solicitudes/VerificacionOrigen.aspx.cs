using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Negocio.General;
using Capa_Negocio.Solicitudes;

namespace Sistema_de_Gestion_Expedientes.Solicitudes
{
    public partial class VerificacionOrigen : System.Web.UI.Page
    {
        CNLogin objCNLogin = new CNLogin();
        CNVerificacionOrigen objCNVerificacion = new CNVerificacionOrigen();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_cbDepartamento();


                if (Session["UsuarioID"].ToString() != null)
                {
                    LlenoDatosSolicitante(Convert.ToInt32(Session["UsuarioID"].ToString()));    
                }

                
            }
        }

        protected void Llenar_cbDepartamento()
        {
            var dt = new DataTable();

            dt = objCNLogin.SelectComboDepartamentos();

            if (dt.Rows.Count > 0)
            {
                cboDepartamento.DataTextField = dt.Columns["nombre"].ToString();
                cboDepartamento.DataValueField = dt.Columns["idDepartamento"].ToString();
                cboDepartamento.DataSource = dt;
                cboDepartamento.DataBind();

                cboDeptoImpo.DataTextField = dt.Columns["nombre"].ToString();
                cboDeptoImpo.DataValueField = dt.Columns["idDepartamento"].ToString();
                cboDeptoImpo.DataSource = dt;
                cboDeptoImpo.DataBind();

            }
        }

        protected void LlenoDatosSolicitante(int idUsuario)
        {
            var tbl = new DataTable();
             
            tbl = objCNVerificacion.SelectDatosSolicitante(idUsuario);

            DataRow row = tbl.Rows[0];

            txtNombre.Text = row["nombres"].ToString();
            txtApellido.Text = row["apellidos"].ToString();
            txtDireccion.Text = row["direccion"].ToString();
            txtTelefono.Text = row["telefono"].ToString();
            txtCorreo.Text = row["correo"].ToString();
            cboDepartamento.SelectedValue = row["idDepartamento"].ToString();

            txtNombre.Enabled = false;
            txtApellido.Enabled = false;
            txtDireccion.Enabled = false;
            txtTelefono.Enabled = false;
            txtCorreo.Enabled = false;
            cboDepartamento.Enabled = false;
        }
    }
}