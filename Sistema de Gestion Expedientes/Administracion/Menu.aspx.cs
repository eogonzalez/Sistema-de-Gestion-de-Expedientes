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
    public partial class Menu : System.Web.UI.Page
    {
        CNMenu objCNMenu = new CNMenu();
        CEMenu objCEMenu = new CEMenu();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_gvMenu();

                //Valores por defecto si es nuevo
                txtOrden.Text = "0";
                cb_obligatorio.Checked = false;
                cb_obligatorio.Visible = true;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (GuardarMenu())
            {
                Llenar_gvMenu();
            }
            else
            {
                ErrorMessage.Text = "Ha Ocurrido un Error al guardar Opcion";
            }
        }

        protected void gvMenu_RowCommand(Object sender, GridViewCommandEventArgs e) 
        {
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = gvMenu.Rows[index];
            int id_menu = Convert.ToInt32(row.Cells[0].Text);
                
            
            switch (e.CommandName)
	        {
                case "modificar":
                    ErrorMessage.Text = "Entra modificar";
                        break;
                case "eliminar":
                    ErrorMessage.Text = "Entra eliminar";
                    break;
                case "submenu":
                    Response.Redirect("~/Administracion/MenuOpcion.aspx?id_om="+id_menu.ToString());
                    break;        
                default:
                    break;
	        }
            
        }

        protected void Llenar_gvMenu()
        {
            var tbl = new DataTable();

            tbl = objCNMenu.SelectMenu();

            gvMenu.DataSource = tbl;
            gvMenu.DataBind();
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
            objCEMenu.Id_Padre = 0;
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