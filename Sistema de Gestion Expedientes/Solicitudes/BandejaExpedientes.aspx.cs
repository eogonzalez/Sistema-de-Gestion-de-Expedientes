using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Negocio.Solicitudes;

namespace Sistema_de_Gestion_Expedientes.Solicitudes
{
    public partial class BandejaExpedientes : System.Web.UI.Page
    {
        CNBandejaExpedientes objCNBandeja = new CNBandejaExpedientes();

        #region Eventos del formulario
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UsuarioID"] != null)
                {
                    Llenar_gvBandeja();
                    Llenar_CantidadExpedientes();
                }
            }
        }

        protected void gvBandeja_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvBandeja.Rows[index];
            //int id_solicitud = Convert.ToInt32(row.Cells[0].Text);
            int id_solicitud = Convert.ToInt32(row.Cells[2].Text);
            var cmd = row.Cells[1].Text;

            switch (e.CommandName)
            {
                case "revisar":
                    Response.Redirect("~/Solicitudes/VerificacionOrigen.aspx?cmd=" + cmd + "&idex=" + id_solicitud);
                    break;
                default:
                    break;
            }
        }
        #endregion

        #region Funciones

        protected void Llenar_gvBandeja()
        {
            var dt = new DataTable();
            dt = objCNBandeja.SelectExpedientes();
            gvBandeja.DataSource = dt;
            gvBandeja.DataBind();
        }

        protected void Llenar_CantidadExpedientes()
        {
            lblCantidadBandeja.Text = objCNBandeja.SelectCantidadExpedientes().ToString();
        }

        #endregion

    }
}