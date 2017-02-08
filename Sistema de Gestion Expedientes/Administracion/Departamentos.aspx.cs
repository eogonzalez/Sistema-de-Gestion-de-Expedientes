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
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (GuardarDepartamento())
            {
                Llenar_gvDepartamento();
            }
            else
            {
                ErrorMessage.Text = "Ha ocurrido un error al guardar Departamento";
            }
        }

        protected void gvDepartamento_RowCommand(object sender, GridViewCommandEventArgs e)
        {

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

        
    }
}