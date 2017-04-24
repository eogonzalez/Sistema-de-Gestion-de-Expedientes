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

        #endregion

        #region Funciones

        protected void Llenar_gvBandeja(int id_usuario_dace)
        {
            var dt = new DataTable();
            dt = objCNBandeja.SelectExpedientes(id_usuario_dace);
            gvBandeja.DataSource = dt;
            gvBandeja.DataBind();
        }
        
        #endregion

    }
}