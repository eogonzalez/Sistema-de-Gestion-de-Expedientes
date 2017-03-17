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
    public partial class Paises : System.Web.UI.Page
    {
        CNPaises objCNPaises = new CNPaises();
        CEPaises objCEPaises = new CEPaises();

        #region Eventos del formulario

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_gvPaises();
                btnGuardar.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardar, ""));
            }
        }
     
        protected void gvPaises_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = gvPaises.Rows[index];
            int id_pais = Convert.ToInt32(row.Cells[0].Text);

            Session.Add("IDPais", id_pais);

            switch (e.CommandName)
            {
                case "modificar":
                    MostrarDatos(id_pais);
                    lkBtn_viewPanel_ModalPopupExtender.Show();
                    break;

                case "eliminar":
                    EliminarPais(id_pais);
                    Llenar_gvPaises();
                    break;

                default:
                    break;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int id_pais = 0;
            if (Session["IDPais"] != null)
            {
                id_pais = (Int32)Session["IDPais"];
            }

            switch (btnGuardar.CommandName)
            {
                case "Editar":
                    if (ActualizarPais(id_pais))
                    {
                        Llenar_gvPaises();
                        LimpiarPanel();
                        btnGuardar.Text = "Guardar";
                        btnGuardar.CommandName = "Guardar";
                    }
                    else
                    {
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        ErrorMessage.Text = "Ha ocurrido un error al actualizar Pais.";
                    }
                    break;
                case "Guardar":
                    if (GuardarPais())
                    {
                        Llenar_gvPaises();
                    }
                    else
                    {
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        ErrorMessage.Text = "Ha ocurrido un error al guardar Pais.";
                    }
                    break;
                default:
                    break;
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            LimpiarPanel();
            btnGuardar.Text = "Guardar";
            btnGuardar.CommandName = "Guardar";
        }

        #endregion

        #region Funciones

        protected void Llenar_gvPaises()
        {
            var tbl = new DataTable();

            tbl = objCNPaises.SelectPaises();

            gvPaises.DataSource = tbl;
            gvPaises.DataBind();
        }

        protected void EliminarPais(int id_pais)
        {
            objCNPaises.DeletePais(id_pais);
        }

        protected void MostrarDatos(int id_pais)
        {
            btnGuardar.Text = "Editar";
            btnGuardar.CommandName = "Editar";

            var tbl = new DataTable();
            tbl = objCNPaises.SelectPais(id_pais);
            var row = tbl.Rows[0];

            txtISO.Text = row["ISO2"].ToString();
            txtNombre.Text = row["nombre"].ToString();

        }

        protected Boolean ActualizarPais(int id_pais)
        {
            var respuesta = false;

            objCEPaises.ID_Pais = id_pais;
            objCEPaises.Nombre = txtNombre.Text;
            objCEPaises.ISO2 = txtISO.Text;

            respuesta = objCNPaises.UpdatePais(objCEPaises);

            return respuesta;
        }

        protected Boolean GuardarPais()
        {
            objCEPaises.Nombre = txtNombre.Text;
            objCEPaises.ISO2 = txtISO.Text;

            return objCNPaises.SavePaises(objCEPaises);
        }

        protected void LimpiarPanel()
        {
            txtISO.Text = string.Empty;
            txtNombre.Text = string.Empty;
        }

        #endregion

    }
}