using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Entidad.Requisitos;
using Capa_Negocio.Requisitos;

namespace Sistema_de_Gestion_Expedientes.Requisitos
{
    public partial class Verificacion : System.Web.UI.Page
    {
        CNVerificacion objCNVerificacion = new CNVerificacion();
        CEVerificacion objCEVerificacion = new CEVerificacion();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Llenar_gvRequisitosVerificacion();
            }
        }

        protected void Llenar_gvRequisitosVerificacion()
        {
            var tbl = new DataTable();

            tbl = objCNVerificacion.SelectRequisitos();

            gvRequisitosVerificacion.DataSource = tbl;
            gvRequisitosVerificacion.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (GuardarRequisito())
            {
                Llenar_gvRequisitosVerificacion();
            }
            else
            {
                ErrorMessage.Text = "Ha ocurrido un error al guardar requisito.";
            }
        }

        protected Boolean GuardarRequisito()
        {
            objCEVerificacion.Nombre = txtNombre.Text;
            objCEVerificacion.Descripcion = txtDescripcionOpcion.Text;
            objCEVerificacion.Obligatorio = cb_obligatorio.Checked;

            return objCNVerificacion.SaveRequisito(objCEVerificacion);
        }
    }
}