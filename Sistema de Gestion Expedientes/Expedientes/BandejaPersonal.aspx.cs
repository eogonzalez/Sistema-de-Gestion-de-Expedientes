using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Negocio.Expedientes;
using System.Data;

namespace Sistema_de_Gestion_Expedientes.Expedientes
{
    public partial class BandejaPersonal : System.Web.UI.Page
    {
        CNBandejaPersonal objCNBandeja = new CNBandejaPersonal();

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
                var cmd = string.Empty;
                if (Session["CMD"] != null)
                {
                    cmd = Session["CMD"].ToString();    
                }
                
                //Cambio de Estado

                Response.Redirect("~/Solicitudes/VerificacionOrigen.aspx?cmd=" + cmd + "&idex=" + id_solicitud+"&st=R");
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
            var id_expediente = 0;
            var cmd = string.Empty;

            for (int i = 0; i < gvBandeja.Rows.Count; i++)
            {
                RadioButton rbuttom = (RadioButton)gvBandeja.Rows[i].FindControl("rb_expediente");
                if (rbuttom.Checked)
                {
                    id_expediente = Convert.ToInt32(gvBandeja.Rows[i].Cells[4].Text);
                    cmd = gvBandeja.Rows[i].Cells[3].Text;
                    Session.Add("CMD", cmd);
                }
            }

            return id_expediente;
        }
        #endregion



    }
}