using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Negocio.General;

namespace Sistema_de_Gestion_Expedientes.Account
{
    public partial class SolicitudRegistro : System.Web.UI.Page
    {

        CNLogin objCapaNegocio = new CNLogin();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_gvSuscripcionUsuarios();
            }
        }

        protected void Llenar_gvSuscripcionUsuarios()
        {
            DataTable tbl = new DataTable();

            tbl = objCapaNegocio.SelectSolicitudRegistroUsuarios().Tables[0];

            gvSolicitudRegistro.DataSource = tbl;
            gvSolicitudRegistro.DataBind();

        }


    }
}