using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Negocio.Expedientes;
using System.Data;
using Capa_Entidad.Expedientes;

namespace Sistema_de_Gestion_Expedientes.Expedientes
{
    public partial class BandejaPersonal : System.Web.UI.Page
    {
        CNBandejaPersonal objCNBandeja = new CNBandejaPersonal();
        CEExpedientes objCEExpediente = new CEExpedientes();
        
        #region Eventos del formulario

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UsuarioID"] != null)
                {
                    Llenar_gvBandeja((int)Session["UsuarioID"]);
                    //Llenar_CantidadExpedientes();
                }
            }
        }

        protected void lkBtn_revisar_Click(object sender, EventArgs e)
        {
            var id_solicitud = 0;
            
            id_solicitud = getExpedienteGridView();

            if (id_solicitud == 0)
            {
                ErrorMensaje.Text = "Debe de Seleccionar un expediente primero.";
            }
            else
            {
                var estadoPrincipal = 0;
                if (Session["EstadoPrincipal"] != null)
                {

                    estadoPrincipal = (int)Session["EstadoPrincipal"];
                    var cmd = string.Empty;
                    if (Session["CMD"] != null)
                    {
                        cmd = Session["CMD"].ToString();
                    }

                    if (estadoPrincipal == 100)
                    {/*Si estado principal es Asignacion*/

                        CambioEstadoARevision(cmd, id_solicitud);
                    }
                    else if (estadoPrincipal == 200 || estadoPrincipal == 300 || estadoPrincipal == 1000 || estadoPrincipal == 220)
                    {/*Esta en revision/aprobado/rechazado/aclarado*/
                        RedireccionAFormulario(cmd, id_solicitud, (int)Session["IDWF_Expediente"], (int)Session["IDExpediente"], (int)Session["EstadoPrincipal"]);
                    }
                    
                    
                }
                else
                {
                    ErrorMensaje.Text = "Ha ocurrido un error al consultar estado principal.";
                }   
            }
        }

        protected void lkBtn_res_inicial_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/doctos/Inicia_Resol_1.pdf");  
        }

        protected void lkBtn_notificar_Click(object sender, EventArgs e)
        {

        }

        protected void lkBtn_complemento_Click(object sender, EventArgs e)
        {

        }

        protected void lkBtn_salir_bandeja_Click(object sender, EventArgs e)
        {

        }

        #endregion

        #region Funciones

        protected void Llenar_gvBandeja(int id_usuario_dace)
        {
            var dt = new DataTable();
            dt = objCNBandeja.SelectExpedientes(id_usuario_dace);
            gvBandeja.DataSource = dt;
            gvBandeja.DataBind();
        }

        protected int getExpedienteGridView()
        {
            var id_solicitud = 0;
            var id_expediente = 0;
            var cmd = string.Empty;
            var idWF_Expediente = 0;
            var estado_principal = 0;

            for (int i = 0; i < gvBandeja.Rows.Count; i++)
            {
                RadioButton rbuttom = (RadioButton)gvBandeja.Rows[i].FindControl("rb_expediente");
                if (rbuttom.Checked)
                {
                    id_solicitud = Convert.ToInt32(gvBandeja.Rows[i].Cells[4].Text);
                    cmd = gvBandeja.Rows[i].Cells[3].Text;
                    idWF_Expediente = Convert.ToInt32(gvBandeja.Rows[i].Cells[5].Text);
                    id_expediente = Convert.ToInt32(gvBandeja.Rows[i].Cells[2].Text);
                    estado_principal = Convert.ToInt32(gvBandeja.Rows[i].Cells[6].Text);

                    Session.Add("CMD", cmd);
                    Session.Add("IDWF_Expediente", idWF_Expediente);
                    Session.Add("IDExpediente", id_expediente);
                    Session.Add("EstadoPrincipal", estado_principal);
                }
            }

            return id_solicitud;
        }

        protected void CambioEstadoARevision(string cmd, int id_solicitud)
        {
            int idWF_Expediente = 0;
            if (Session["IDWF_Expediente"] != null)
            {
                idWF_Expediente = Convert.ToInt32(Session["IDWF_Expediente"].ToString());
            }

            int id_expediente = 0;
            if (Session["IDExpediente"] != null)
            {
                id_expediente = Convert.ToInt32(Session["IDExpediente"].ToString());
            }

            //Cambio de Estado
            objCEExpediente.ID_WF_Expediente = idWF_Expediente;
            objCEExpediente.ID_Expediente = id_expediente;
            objCEExpediente.ID_Usuario_DACE = (int)Session["UsuarioID"];

            //Obtengo datos del siguiente estado
            var dt = new DataTable();
            dt = objCNBandeja.SelectEstado(cmd, 200);
            var row = dt.Rows[0];

            objCEExpediente.Sigla_Estado = row["descripcion"].ToString();
            //objCEExpediente.Estado_Principal = (int)row["codigo_estado"];
            objCEExpediente.Estado_Principal = 200;
            //objCEExpediente.Estado_Alterno
            objCEExpediente.Dias_Maximos = (int)row["dias_max"];
            objCEExpediente.Dias_Minimos = (int)row["dias_min"];

            if (objCNBandeja.Update_WF_Estado(objCEExpediente))
            {
                RedireccionAFormulario(cmd, id_solicitud, idWF_Expediente, id_expediente, 200);
            }
            else
            {
                ErrorMensaje.Text = "Ha ocurrido un error al cambiar de estado.";
            }
        }

        protected void RedireccionAFormulario(string cmd, int id_solicitud, int id_wf_expediente, int id_expediente, int estadoPrincipal)
        {
            Response.Redirect("~/Solicitudes/VerificacionOrigen.aspx?cmd=" + cmd + "&idex=" + id_expediente + "&st=R&wf_ids="+id_solicitud+"&idwf="+id_wf_expediente+"&estp="+estadoPrincipal);
        }

        #endregion



    }
}