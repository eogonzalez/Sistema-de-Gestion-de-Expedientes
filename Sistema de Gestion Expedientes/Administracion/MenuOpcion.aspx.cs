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
    public partial class MenuOpcion : System.Web.UI.Page
    {
        CNMenu objCNMenu = new CNMenu();
        CEMenu objCEMenu = new CEMenu();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id_menu = 0;
                id_menu = Convert.ToInt32(Request.QueryString["id_om"].ToString());
                Session.Add("id_menu", id_menu);

                Llenar_gvMenu(id_menu);
            }
        }

        protected void Llenar_gvMenu(int id_menu)
        {
            var tbl = new DataTable();

            tbl = objCNMenu.SelectMenu(id_menu);

            gvMenu.DataSource = tbl;
            gvMenu.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (GuardarMenu())
            {
                Llenar_gvMenu(Convert.ToInt32(Session["id_menu"].ToString()));
            }
            else
            {
                ErrorMessage.Text = "Ha Ocurrido un Error al guardar Opcion";
            }
        }

        protected Boolean GuardarMenu()
        {
            objCEMenu.Nombre = txtNombreOpcion.Text;
            objCEMenu.Descripcion = getNombre();
            objCEMenu.URL = getURL();
            objCEMenu.Orden = getOrden();
            objCEMenu.Obligatorio = getObligatorio();
            objCEMenu.Visible = getVisible();
            objCEMenu.Login = getConLogin();
            objCEMenu.Id_Padre = Convert.ToInt32(Session["id_menu"].ToString());
            objCEMenu.ID_UsuarioAutoriza = Convert.ToInt32(Session["UsuarioID"].ToString());

            return objCNMenu.SaveMenu(objCEMenu);
        }

        protected string getNombre()
        {
            return txtNombreOpcion.Text;
        }

        protected string getDescripcion()
        {
            return txtDescripcionOpcion.Text;
        }

        protected string getURL()
        {
            return txtURL.Text;
        }

        protected int getOrden()
        {
            return Convert.ToInt32(txtOrden.Text);
        }

        protected Boolean getObligatorio()
        {
            return cb_obligatorio.Checked;
        }

        protected Boolean getVisible()
        {
            return cb_visible.Checked;
        }

        protected Boolean getConLogin()
        {
            return cb_login.Checked;
        }
    }
}