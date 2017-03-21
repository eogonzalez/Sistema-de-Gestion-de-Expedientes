﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Negocio.Administracion;
using System.Data;
using Capa_Entidad.Administracion;

namespace Sistema_de_Gestion_Expedientes.Administracion
{
    public partial class Instrumentos : System.Web.UI.Page
    {
        CNInstrumentos objCNInstrumentos = new CNInstrumentos();
        CEInstrumento objCEInstrumentos = new CEInstrumento();

        #region Eventos del Formulario

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Llenar_gvInstrumentos();
                btnGuardar.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardar, ""));
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            switch (btnGuardar.CommandName)
            {
                case "Guardar":

                    if (GuardarInstrumento())
                    {
                        Llenar_gvInstrumentos();
                    }
                    else
                    {
                        lkBtn_viewPanel_ModalPopupExtender.Show();
                        ErrorMessage.Text = "Ha ocurrido un error al guardar Instrumento.";
                    }

                    break;
                case "Editar":

                    if (true)
                    {
                        
                    }

                    break;                
                default:
                    break;
            }

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {

        }

        protected void gvInstrumentos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = gvInstrumentos.Rows[index];
            int id_instrumento = Convert.ToInt32(row.Cells[0].Text);

            Session.Add("IDInstrumento", id_instrumento);

            switch (e.CommandName)
            {
                case "modificar":
                    MostrarDatos(id_instrumento);
                    lkBtn_viewPanel_ModalPopupExtender.Show();
                    break;
                case "eliminar":

                    break;
                default:
                    break;
            }
        }
        

        #endregion

        #region Funciones
        
        protected void Llenar_gvInstrumentos()
        {
            var tbl = new DataTable();

            tbl = objCNInstrumentos.SelectInstrumentos();

            gvInstrumentos.DataSource = tbl;
            gvInstrumentos.DataBind();
        }

        protected Boolean GuardarInstrumento()
        {
            objCEInstrumentos.Nombre_Instrumento = txtNombre.Text;
            objCEInstrumentos.Sigla = txtSigla.Text;
            objCEInstrumentos.Observaciones = txtObservaciones.Text;
            objCEInstrumentos.Fecha_Vigencia = Convert.ToDateTime(txtFechaVigencia.Text);
            objCEInstrumentos.ID_UsuarioAutoriza = (Int32)Session["UsuarioID"];

            return objCNInstrumentos.InsertInstrumentos(objCEInstrumentos);
        }

        protected void MostrarDatos(int id_instrumento)
        {
            btnGuardar.Text = "Editar";
            btnGuardar.CommandName = "Editar";

            var tbl = new DataTable();
            tbl = objCNInstrumentos.SelectInstrumento(id_instrumento);
            var row = tbl.Rows[0];

            txtNombre.Text = row["nombre_instrumento"].ToString();
            txtSigla.Text = row["sigla"].ToString();
            txtObservaciones.Text = row["observaciones"].ToString();
            txtFechaVigencia.Text = row["fecha_vigencia"].ToString();


        }

        #endregion





    }
}