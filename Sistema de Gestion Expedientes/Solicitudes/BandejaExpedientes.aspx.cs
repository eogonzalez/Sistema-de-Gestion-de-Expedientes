using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Negocio.Solicitudes;
using Capa_Entidad.Expedientes;

namespace Sistema_de_Gestion_Expedientes.Solicitudes
{
    public partial class BandejaExpedientes : System.Web.UI.Page
    {
        CNBandejaExpedientes objCNBandeja = new CNBandejaExpedientes();
        CEExpedientes objCEExpedientes = new CEExpedientes();

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
            int id_expediente = Convert.ToInt32(row.Cells[0].Text);
            int id_solicitud = Convert.ToInt32(row.Cells[2].Text);
            var cmd = row.Cells[1].Text;

            switch (e.CommandName)
            {
                case "Asignar":
                    objCEExpedientes.ID_Expediente = id_expediente;
                    objCEExpedientes.ID_Usuario_DACE = (int)Session["UsuarioID"];

                    /*Obtener primer estado*/
                    var dt = new DataTable();

                    dt = objCNBandeja.SelectEstadoMinimo("VO");
                    var row_ex = dt.Rows[0];

                    objCEExpedientes.Sigla_Estado = row_ex["descripcion"].ToString();
                    objCEExpedientes.Estado_Principal = (int)row_ex["codigo_estado"];
                    //objCEExpedientes.Estado_Alterno 
                    objCEExpedientes.Dias_Maximos = (int)row_ex["dias_max"];
                    objCEExpedientes.Dias_Minimos = (int)row_ex["dias_min"];

                    AutoAsignarExpedientes(objCEExpedientes);
                    Llenar_gvBandeja();

                    break;
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

        protected bool AutoAsignarExpedientes(CEExpedientes objCEExpedientes)
        {
            return objCNBandeja.AutoAsignarExpediente(objCEExpedientes);
        }

        #endregion

    }
}