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

                if (Session["UsuarioID"].ToString() != null)
                {
                    LlenoDatosSolicitante(Convert.ToInt32(Session["UsuarioID"].ToString()));
                    BloqueoControlesIniciales();

                    Llenar_cbDepartamento();
                    Llenar_cbPais();

                    

                    txtAnioOficioSAT.Text = DateTime.Now.Year.ToString();


                    var cmd = string.Empty;
                    cmd = Request.QueryString["cmd"].ToString();
                    /*Session.Add("id_menu", id_menu);*/
                    Llenar_cboTipoRequisito(cmd);

                    Llenar_gvAnexos(cmd);
                    
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

        protected void Llenar_cbPais()
        {
            var dt = new DataTable();

            dt = objCNVerificacion.SelectComboPaises();

            if (dt.Rows.Count > 0)
            {
                cboPaisExpo.DataTextField = dt.Columns["nombre"].ToString();
                cboPaisExpo.DataValueField = dt.Columns["idPais"].ToString();
                cboPaisExpo.DataSource = dt;
                cboPaisExpo.DataBind();                
            }
        }

        protected void Llenar_cboTipoRequisito(string cmd)
        {
            var dt = new DataTable();

            switch (cmd)
            {   case "VO":
                    dt = objCNVerificacion.SelectRequisitosVerificacion();

                    if (dt.Rows.Count > 0)
                    {
                        cboTipoRequisito.DataTextField = dt.Columns["nombre"].ToString();
                        cboTipoRequisito.DataValueField = dt.Columns["idRequisito"].ToString();
                        cboTipoRequisito.DataSource = dt;
                        cboTipoRequisito.DataBind();
                    }
                    break;
                case "OT":
                    dt = objCNVerificacion.SelectRequisitosOpinion();

                    if (dt.Rows.Count > 0)
                    {
                        cboTipoRequisito.DataTextField = dt.Columns["nombre"].ToString();
                        cboTipoRequisito.DataValueField = dt.Columns["idRequisito"].ToString();
                        cboTipoRequisito.DataSource = dt;
                        cboTipoRequisito.DataBind();
                    }
                    break;
                default:
                    break;
            }

        }

        protected void Llenar_gvAnexos(string cmd)
        {
            switch (cmd)
            {
                case "VO":
                    break;
                case "OP":
                    break;
                default:
                    break;
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

        protected void BloqueoControlesIniciales()
        {
            //Pestania de motivos
            txtObsMotivo.Enabled = false;
            txtOtrosMotivos.Enabled = false;

            //Panel de anexos
            cb_CorrelativoSAT.Enabled = false;
            txtNumeroOficioSAT.Enabled = false;
            txtAnioOficioSAT.Enabled = false;
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            //tbAnexos.Attributes.Remove("class");
            //tbAnexos.Attributes.Add("class","tab-pane active");

            //tbMotivo.Attributes.Remove("class");
            //tbMotivo.Attributes.Add("class", "tab-pane");

            //tbProductos.Attributes.Remove("class");
            //tbProductos.Attributes.Add("class", "tab-pane");
        }

        protected void cb_ObsMotivo_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_ObsMotivo.Checked)
            {                
                txtObsMotivo.Enabled = true;
            }
            else
            {
                //cb_ObsMotivo.Checked = true;
                txtObsMotivo.Enabled = false;
            }
        }

        protected void cb_ocho_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_ocho.Checked)
            {
                txtOtrosMotivos.Enabled = true;
            }
            else
            {
                txtOtrosMotivos.Enabled = false;
            }
        }

        protected void cbOficioSAT_CheckedChanged(object sender, EventArgs e)
        {
            if (cbOficioSAT.Checked)
            {
                cb_CorrelativoSAT.Enabled = true;
                txtNumeroOficioSAT.Enabled = true;
                txtAnioOficioSAT.Enabled = true;                
            }
            else
            {
                cb_CorrelativoSAT.Enabled = false;
                txtNumeroOficioSAT.Enabled = false;
                txtAnioOficioSAT.Enabled = false;
                
            }
        }

        protected void gvAnexos_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //Guarda datos primarios
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            //Envia solicitud
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            //Cancela solicitud y regresa a menu principal
        }
    }
}