using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Negocio.Administracion;
using Capa_Entidad.Administracion;
using System.Data;

namespace Sistema_de_Gestion_Expedientes.Administracion
{
    public partial class Aduanas : System.Web.UI.Page
    {
        CNAduanas objCNAduana = new CNAduanas();
        CEAduanas objCEAduana = new CEAduanas();

        #region Eventos del formulario
                
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_gvAduanas();
                btnGuardar.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardar, ""));
            }
        }

        protected void gvAduanas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = gvAduanas.Rows[index];
            int id_aduana = Convert.ToInt32(row.Cells[0].Text);

            Session.Add("IDAduana", id_aduana);

            switch (e.CommandName)
            {
                case "modificar":
                    MostrarDatos(id_aduana);
                    lkBtn_viewPanel_ModalPopupExtender.Show();
                    break;

                case "eliminar":
                    EliminarAduana(id_aduana);
                    Llenar_gvAduanas();
                    break;

                default:
                    break;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int id_aduana = 0;
            if (Session["IDAduana"] != null)
            {
                id_aduana = (Int32)Session["IDAduana"];
            }

            switch (btnGuardar.CommandName)
            {
                case "Editar":
                    if (ActualizarAduana(id_aduana))
                    {
                        Llenar_gvAduanas();
                        LimpiarPanel();
                        btnGuardar.Text = "Guardar";
                        btnGuardar.CommandName = "Guardar";
                    }
                    else
                    {
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        ErrorMessage.Text = "Ha ocurrido un error al actualizar Aduana.";
                    }
                    break;
                case "Guardar":
                    if (GuardarAduana())
                    {
                        LimpiarPanel();
                        Llenar_gvAduanas();
                    }
                    else
                    {
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        ErrorMessage.Text = "Ha ocurrido un error al guardar Aduana.";
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

        protected void Llenar_gvAduanas()
        {
            var tbl = new DataTable();

            tbl = objCNAduana.SelectAduanas();

            gvAduanas.DataSource = tbl;
            gvAduanas.DataBind();
        }

        protected void EliminarAduana(int id_aduana)
        {
            objCNAduana.DeleteAduana(id_aduana);
        }

        protected void MostrarDatos(int id_aduana)
        {
            btnGuardar.Text = "Editar";
            btnGuardar.CommandName = "Editar";

            var tbl = new DataTable();
            tbl = objCNAduana.SelectAduana(id_aduana);
            var row = tbl.Rows[0];

            txtISO.Text = row["codigo"].ToString();
            txtNombre.Text = row["nombre"].ToString();

        }

        protected Boolean ActualizarAduana(int id_aduana)
        {
            var respuesta = false;

            objCEAduana.ID_Aduana = id_aduana;
            objCEAduana.Nombre = txtNombre.Text;
            objCEAduana.Codigo = txtISO.Text;

            respuesta = objCNAduana.UpdateAduana(objCEAduana);

            return respuesta;
        }

        protected Boolean GuardarAduana()
        {
            objCEAduana.Nombre = txtNombre.Text;
            objCEAduana.Codigo = txtISO.Text;

            return objCNAduana.SaveAduanas(objCEAduana);
        }

        protected void LimpiarPanel()
        {
            txtISO.Text = string.Empty;
            txtNombre.Text = string.Empty;
        }

        #endregion
    }
}