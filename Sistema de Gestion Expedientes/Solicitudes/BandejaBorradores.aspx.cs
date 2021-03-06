﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Negocio.Solicitudes;

namespace Sistema_de_Gestion_Expedientes.Solicitudes
{
    public partial class BandejaBorradores : System.Web.UI.Page
    {
        CNBandejaBorradores objCNBandeja = new CNBandejaBorradores();

        #region Eventos del formulario
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divAlertError.Visible = false;

                if (Session["UsuarioID"] != null)
                {
                    Llenar_gvBorradores(Convert.ToInt32(Session["UsuarioID"].ToString()));
                    Llenar_CantidadBorradores(Convert.ToInt32(Session["UsuarioID"].ToString()));

                }
            }
        }

        protected void gvBorradores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Page")
            {

                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvBorradores.Rows[index];
                int id_solicitud = Convert.ToInt32(row.Cells[0].Text);
                var cmd = row.Cells[1].Text;
                string descripcion_estado = row.Cells[8].Text;
                string estado = row.Cells[9].Text;

                switch (e.CommandName)
                {
                    case "modificar":
                        Response.Redirect("~/Solicitudes/VerificacionOrigen.aspx?cmd=" + cmd + "&ids=" + id_solicitud + "&st=" + estado);
                        break;
                    case "eliminar":
                        if (descripcion_estado == "Borrador")
                        {
                            EliminarBorrador(id_solicitud);
                            Llenar_gvBorradores(Convert.ToInt32(Session["UsuarioID"].ToString()));
                            Llenar_CantidadBorradores(Convert.ToInt32(Session["UsuarioID"].ToString()));
                        }
                        else
                        {
                            ErrorMessagePrincipal.Text = "No es posible eliminar un expediente en estado de Aclaracion.";
                            divAlertError.Visible = true;
                        }

                        break;
                    default:
                        break;
                }
            }
        }

        protected void gvBorradores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBorradores.PageIndex = e.NewPageIndex;
            Llenar_gvBorradores((int)Session["UsuarioID"]);
        }

        #endregion

        #region Funciones

        protected void Llenar_gvBorradores(int id_usuario)
        {
            var dt = new DataTable();
            dt = objCNBandeja.SelectBorradorSolicitudes(id_usuario);
            gvBorradores.DataSource = dt;
            gvBorradores.DataBind();
        }

        protected void Llenar_CantidadBorradores(int id_usuario)
        {
            lblCantidadBandeja.Text = objCNBandeja.SelectCantidadBorradores(id_usuario).ToString();
        }

        protected Boolean EliminarBorrador(int id_solicitud)
        {
            var respuesta = false;

            respuesta = objCNBandeja.DeleteBorrador(id_solicitud);

            return respuesta;
        }

        #endregion

    }
}