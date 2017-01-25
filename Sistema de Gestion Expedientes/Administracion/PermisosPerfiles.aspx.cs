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
    public partial class PermisosPerfiles : System.Web.UI.Page
    {
        CNPermisosPerfiles objCNPermisosPerfiles = new CNPermisosPerfiles();
        CEPermisosPerfiles objCEPermisosPerfiles = new CEPermisosPerfiles();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id_usuarioPermiso = 0;

                if (Request.QueryString["id"] != null)
                {
                    id_usuarioPermiso = Convert.ToInt32(Request.QueryString["id"].ToString());
                    Llenar_gvPermisosPerfiles(id_usuarioPermiso);                    
                }
                else
                {
                    Llenar_gvPermisosPerfiles();                    
                }

                Llenar_combos();
            }
        }

        protected void Llenar_gvPermisosPerfiles(int id_usuarioPermiso = 0)
        {
            var tbl = new DataSet();

            tbl = objCNPermisosPerfiles.SelectPermisosPerfiles(id_usuarioPermiso);

            gvPermisosPerfiles.DataSource = tbl;
            gvPermisosPerfiles.DataBind();
        }

        protected void Llenar_combos()
        {
            var dt = objCNPermisosPerfiles.SelectCombosPermisosPerfiles();
            DataTable dtPerfil = dt.Tables[0];
            DataTable dtMenu = dt.Tables[1];

            if (dtPerfil.Rows.Count > 0)
            {
                cboPerfil.DataTextField = dtPerfil.Columns["nombre"].ToString();
                cboPerfil.DataValueField = dtPerfil.Columns["id_tipousuario"].ToString();
                cboPerfil.DataSource = dtPerfil;
                cboPerfil.DataBind();
            }

            if (dtMenu.Rows.Count > 0)
            {
                cboMenu.DataTextField = dtMenu.Columns["nombre"].ToString();
                cboMenu.DataValueField = dtMenu.Columns["id_opcion"].ToString();
                cboMenu.DataSource = dtMenu;
                cboMenu.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (GuardarPermisoPerfil())
            {
                Llenar_gvPermisosPerfiles();
            }
            else
            {
                ErrorMessage.Text = "Ha Ocurrido un error al guardar permiso.";
            }
        }

        protected Boolean GuardarPermisoPerfil()
        {
            objCEPermisosPerfiles.ID_TipoUsuario = getIdTipoUsuario();
            objCEPermisosPerfiles.ID_Opcion = getIdOpcion();
            objCEPermisosPerfiles.ID_UsuarioAutoriza = getUsuarioAutoriza();
            objCEPermisosPerfiles.Acceder = getAcceder();
            objCEPermisosPerfiles.Insertar = getInsertar();
            objCEPermisosPerfiles.Editar = getEditar();
            objCEPermisosPerfiles.Borrar = getBorrar();
            objCEPermisosPerfiles.Aprobar = getAprobar();
            objCEPermisosPerfiles.Rechazar = getRechazar();

            return objCNPermisosPerfiles.InsertPermisosPerfiles(objCEPermisosPerfiles);
        }

        protected int getUsuarioAutoriza()
        {
            return Convert.ToInt32(Session["UsuarioID"].ToString());
        }

        protected int getIdTipoUsuario()
        {
            return Convert.ToInt32(cboPerfil.SelectedValue.ToString());
        }

        protected int getIdOpcion()
        {
            return Convert.ToInt32(cboMenu.SelectedValue.ToString());
        }

        protected Boolean getAcceder()
        {
            return cb_acceder.Checked;
        }

        protected Boolean getInsertar()
        {
            return cb_acceder.Checked;
        }

        protected Boolean getEditar()
        {
            return cb_editar.Checked;
        }

        protected Boolean getBorrar()
        {
            return cb_borrar.Checked;
        }

        protected Boolean getAprobar()
        {
            return cb_aprobar.Checked;
        }

        protected Boolean getRechazar()
        {
            return cb_rechazar.Checked;
        }
        
    }
}