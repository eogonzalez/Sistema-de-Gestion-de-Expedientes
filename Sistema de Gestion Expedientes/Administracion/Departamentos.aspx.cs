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
    public partial class Departamentos : System.Web.UI.Page
    {
        CNDepartamentos objCNDepartamentos = new CNDepartamentos();
        CEDepartamentos objCEDEpartamentos = new CEDepartamentos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_gvDepartamento();

                btnGuardar.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardar, ""));
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int id_departamento = 0;
            if (Session["IDDepartamento"] != null)
            {
                id_departamento = (Int32)Session["IDDepartamento"];
            }

            switch (btnGuardar.CommandName)
            {
                case "Editar":
                    if (ActualizarDepartamento(id_departamento))
                    {
                        Llenar_gvDepartamento();
                        LimpiarPanel();
                    }
                    else
                    {
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        ErrorMessage.Text = "Ha ocurrido un error al actualizar Departamento";
                    }
                    break;
                case "Guardar":
                    if (GuardarDepartamento())
                    {
                        Llenar_gvDepartamento();
                    }
                    else
                    {
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        ErrorMessage.Text = "Ha ocurrido un error al guardar Departamento";
                    }
                    break;
                default:
                    break;
            }


        }

        protected void gvDepartamento_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = gvDepartamento.Rows[index];
            int id_departamento = Convert.ToInt32(row.Cells[0].Text);

            Session.Add("IDDepartamento", id_departamento);

            switch (e.CommandName)
            {
                case "modificar":
                    MostrarDatos(id_departamento);
                    this.lkBtn_viewPanel_ModalPopupExtender.Show();
                    break;

                case "eliminar":
                    EliminarDepartamento(id_departamento);
                    Llenar_gvDepartamento();
                    break;
                default:
                    break;
            }
        }

        protected Boolean ActualizarDepartamento(int id_departamento)
        {
            var respuesta = false;

            objCEDEpartamentos.ID_Departamento = id_departamento;
            objCEDEpartamentos.CodigoDepto = Convert.ToInt32(txtCodigo.Text);
            objCEDEpartamentos.Nombre = txtNombre.Text;
            objCEDEpartamentos.Descripcion = txtDescripcionOpcion.Text;

            respuesta = objCNDepartamentos.UpdateDepartamento(objCEDEpartamentos);

            return respuesta;
        }

        protected void MostrarDatos(int id_Departamento)
        {
            btnGuardar.Text = "Editar";
            btnGuardar.CommandName = "Editar";

            var tbl = new DataTable();
            tbl = objCNDepartamentos.SelectDepartamento(id_Departamento);
            var row = tbl.Rows[0];

            txtCodigo.Text = row["codigoDepto"].ToString();
            txtNombre.Text = row["nombre"].ToString();
            txtDescripcionOpcion.Text = row["descripcion"].ToString();

        }

        protected void EliminarDepartamento(int id_Departamento)
        {
            objCNDepartamentos.DeleteDepartamento(id_Departamento);
        }

        protected Boolean GuardarDepartamento()
        {
            objCEDEpartamentos.CodigoDepto = Convert.ToInt32(txtCodigo.Text);
            objCEDEpartamentos.Nombre = txtNombre.Text;
            objCEDEpartamentos.Descripcion = txtDescripcionOpcion.Text;

            return objCNDepartamentos.SaveDepartamento(objCEDEpartamentos);
        }

        protected void Llenar_gvDepartamento()
        {
            var tbl = new DataTable();

            tbl = objCNDepartamentos.SelectDepartamentos();

            gvDepartamento.DataSource = tbl;
            gvDepartamento.DataBind();
        }

        protected void LimpiarPanel()
        {
            txtCodigo.Text = string.Empty;
            txtDescripcionOpcion.Text = string.Empty;
            txtNombre.Text = string.Empty;
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            LimpiarPanel();
            btnGuardar.Text = "Guardar";
            btnGuardar.CommandName = "Guardar";
        }

        
    }
}