using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Negocio.General;
using Capa_Negocio.Solicitudes;
using Capa_Entidad.Solicitudes;
using System.IO;

namespace Sistema_de_Gestion_Expedientes.Solicitudes
{
    public partial class VerificacionOrigen : System.Web.UI.Page
    {
        CNLogin objCNLogin = new CNLogin();
        CNVerificacionOrigen objCNVerificacion = new CNVerificacionOrigen();
        CEVerificacionOrigen objCEVerificacion = new CEVerificacionOrigen();
        //string carpeta;

        #region Eventos del formulario

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["UsuarioID"] != null)
                {
                    //Page.Form.Attributes.Add("enctype", "multipart/form-data");
                    BloqueoControlesIniciales();
                    Llenar_cbDepartamento();
                    Llenar_cbPais();

                    if (Session["UsuarioID"] != null)
                    {
                        LlenoDatosSolicitante(Convert.ToInt32(Session["UsuarioID"].ToString()));    
                    }

                    /*Elimino lo que tenga la variable de idSolicitud*/
                    Session["IDSolicitud"] = null;

                    var cmd = string.Empty;
                    if (Request.QueryString["cmd"] != null)
                    {
                        cmd = Request.QueryString["cmd"].ToString();
                    }

                    /*Session.Add("id_menu", id_menu);*/
                    Llenar_cboTipoRequisito(cmd);

                    var idSolicitud = 0;
                    if (Request.QueryString["ids"] != null)
                    {
                        idSolicitud = Convert.ToInt32(Request.QueryString["ids"].ToString());
                        Session["IDSolicitud"] = idSolicitud;
                        Llenar_DatosPrimarios(idSolicitud);
                        Llenar_Motivos(idSolicitud);
                        Llenar_gvAnexos(idSolicitud);
                        //Llenar_Productos(idSolicitud);
                    }

                    /*Envento de guardar informacion primaria*/
                    btnGuardar.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardar, ""));
                    btnGuardarMotivo.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardarMotivo, ""));
                    btnGuardarAnexo.Attributes.Add("onclick", "this.value='Cargado documento Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardarAnexo, ""));

                    txtAnioOficioSAT.Text = DateTime.Now.Year.ToString();
                    //carpeta = Path.Combine(Request.PhysicalApplicationPath, "doctos");

                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            //tbAnexos.Attributes.Remove("class");
            //tbAnexos.Attributes.Add("class","tab-pane active");

            //tbMotivo.Attributes.Remove("class");
            //tbMotivo.Attributes.Add("class", "tab-pane");

            //tbProductos.Attributes.Remove("class");
            //tbProductos.Attributes.Add("class", "tab-pane");
        }

        protected void cb_ObsMotivo_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_ObsMotivo.Checked)
            {
                txtObsMotivo.Enabled = true;
            }
            else
            {
                //cb_ObsMotivo.Checked = true;
                txtObsMotivo.Enabled = false;
            }
        }

        protected void cb_ocho_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_ocho.Checked)
            {
                txtOtrosMotivos.Enabled = true;
            }
            else
            {
                txtOtrosMotivos.Enabled = false;
            }
        }

        protected void cbOficioSAT_CheckedChanged(object sender, EventArgs e)
        {
            if (cbOficioSAT.Checked)
            {
                cb_CorrelativoSAT.Enabled = true;
                txtNumeroOficioSAT.Enabled = true;
                txtAnioOficioSAT.Enabled = true;
            }
            else
            {
                cb_CorrelativoSAT.Enabled = false;
                txtNumeroOficioSAT.Enabled = false;
                txtAnioOficioSAT.Enabled = false;

            }
        }

        protected void gvAnexos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvAnexos.Rows[index];
            int id_anexo = Convert.ToInt32(row.Cells[0].Text);
            string pathAnexo = row.Cells[1].Text;

            switch (e.CommandName)
            {
                case "mostrar":
                    //Response.Write(String.Format("window.open('{0}','_blank')", ResolveUrl(pathAnexo)));
                    //Page.ClientScript.RegisterStartupScript(Page.GetType(), null, "window.open('pathAnexo', '_newtab')", true);
                    //Response.Redirect(pathAnexo, false);
                    return;
                default:
                    break;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //Guarda datos primarios

             if (Session["IDSolicitud"] != null)
            {
                int id_solicitud = (int)Session["IDSolicitud"];

                if (ActualizarDatosPrimarios(id_solicitud))
                {
                    MensajeCorrectoPrincipal.Text = "Datos Primarios han sido Actualizados.";
                }
                else
                {
                    ErrorMessagePrincipal.Text = "Ha ocurrido un error al Actualizar Datos Primarios";
                }
            }
            else
            {
                if (GuardarDatosPrimarios())
                {
                    MensajeCorrectoPrincipal.Text = "Datos Primarios han sido Guardados, su solicitud esta ahora en bandeja de borradores.";

                    //Envia mensaje a usuario de nuevo borrador de solictud
                }
                else
                {
                    ErrorMessagePrincipal.Text = "Ha ocurrido un error al Guardar Datos Primarios";
                }
            }

            
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            //Envia solicitud
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            //Cancela solicitud y regresa a menu principal
        }

        protected void btnGuardarMotivo_Click(object sender, EventArgs e)
        {
            //Guardar motivos de solicitud
            if (Session["IDSolicitud"] != null)
            {
                int id_solicitud = 0;
                id_solicitud = (int)Session["IDSolicitud"];
                //Verifico si existe motivo de solicitud
                if (!ExistenMotivos(id_solicitud))
                {
                    //GuardoMotivos o actualizo Motivos
                    if (GuardarMotivos(id_solicitud))
                    {
                        MensajeMotivo.Text = "Se han Guardado los motivos seleccionados.";
                    }
                    else
                    {
                        ErrorMotivo.Text = "Ha ocurrido un error al guardar los motivos de la solictud actual.";
                    }
                }
                else
                {
                    if (ActulizarMotivos(id_solicitud))
                    {
                        MensajeMotivo.Text = "Se han Actualizado los motivos seleccionados.";
                    }
                    else
                    {
                        ErrorMotivo.Text = "Ha ocurrido un error al actualizar los motivos de la solictud actual.";
                    }
                }

            }
            else
            {
                ErrorMotivo.Text = "Debe de Guardar los datos del encabezado antes de guardar los Motivos de la solicitud.";
            }
        }

        protected void btnGuardarAnexo_Click(object sender, EventArgs e)
        {
            
            if (Session["IDSolicitud"] != null)
            {
                int id_solicitud = 0;
                id_solicitud = (int)Session["IDSolicitud"];

                var cmd = string.Empty;
                if (Request.QueryString["cmd"] != null)
                {
                    cmd = Request.QueryString["cmd"].ToString();
                }

                if (GuardarDocumento(id_solicitud, cmd))
                {
                    Llenar_gvAnexos(id_solicitud);
                }
                else
                {
                    ErrorMessage.Text = "Ha ocurrido un error al cargar archivo al servidor.";
                    lkBtn_viewPanel_ModalPopupExtender.Show();
                }

            }
            else
            {
                ErrorMessage.Text = "Debe de Guardar los datos del encabezado antes de guardar los Motivos de la solicitud.";
                lkBtn_viewPanel_ModalPopupExtender.Show();
            }
              
        }

        #endregion

        #region Funciones

        protected void Llenar_cbDepartamento()
        {
            var dt = new DataTable();

            dt = objCNLogin.SelectComboDepartamentos();

            if (dt.Rows.Count > 0)
            {
                cboDepartamento.DataTextField = dt.Columns["nombre"].ToString();
                cboDepartamento.DataValueField = dt.Columns["idDepartamento"].ToString();
                cboDepartamento.DataSource = dt;
                cboDepartamento.DataBind();

                cboDeptoImpo.DataTextField = dt.Columns["nombre"].ToString();
                cboDeptoImpo.DataValueField = dt.Columns["idDepartamento"].ToString();
                cboDeptoImpo.DataSource = dt;
                cboDeptoImpo.DataBind();



            }
        }

        protected void Llenar_cbPais()
        {
            var dt = new DataTable();

            dt = objCNVerificacion.SelectComboPaises();

            if (dt.Rows.Count > 0)
            {
                cboPaisExpo.DataTextField = dt.Columns["nombre"].ToString();
                cboPaisExpo.DataValueField = dt.Columns["idPais"].ToString();
                cboPaisExpo.DataSource = dt;
                cboPaisExpo.DataBind();
            }
        }

        protected void Llenar_cboTipoRequisito(string cmd)
        {
            var dt = new DataTable();

            switch (cmd)
            {
                case "VO":
                    dt = objCNVerificacion.SelectRequisitosVerificacion();

                    if (dt.Rows.Count > 0)
                    {
                        cboTipoRequisito.DataTextField = dt.Columns["nombre"].ToString();
                        cboTipoRequisito.DataValueField = dt.Columns["idRequisito"].ToString();
                        cboTipoRequisito.DataSource = dt;
                        cboTipoRequisito.DataBind();
                    }
                    break;
                case "OT":
                    dt = objCNVerificacion.SelectRequisitosOpinion();

                    if (dt.Rows.Count > 0)
                    {
                        cboTipoRequisito.DataTextField = dt.Columns["nombre"].ToString();
                        cboTipoRequisito.DataValueField = dt.Columns["idRequisito"].ToString();
                        cboTipoRequisito.DataSource = dt;
                        cboTipoRequisito.DataBind();
                    }
                    break;
                default:
                    break;
            }

        }

        protected void Llenar_gvAnexos(int id_solicitud)
        {

            var tbl = new DataTable();

            tbl = objCNVerificacion.SelectDocumentosAnexos(id_solicitud);

            gvAnexos.DataSource = tbl;
            gvAnexos.DataBind();

            //switch (cmd)
            //{
            //    case "VO":
            //        break;
            //    case "OP":
            //        break;
            //    default:
            //        break;
            //}
        }

        protected void LlenoDatosSolicitante(int idUsuario)
        {
            var tbl = new DataTable();

            tbl = objCNVerificacion.SelectDatosSolicitante(idUsuario);

            DataRow row = tbl.Rows[0];

            txtNombre.Text = row["nombres"].ToString();
            txtApellido.Text = row["apellidos"].ToString();
            txtDireccion.Text = row["direccion"].ToString();
            txtTelefono.Text = row["telefono"].ToString();
            txtCorreo.Text = row["correo"].ToString();
            cboDepartamento.SelectedValue = row["idDepartamento"].ToString();

            txtNombre.Enabled = false;
            txtApellido.Enabled = false;
            txtDireccion.Enabled = false;
            txtTelefono.Enabled = false;
            txtCorreo.Enabled = false;
            cboDepartamento.Enabled = false;
        }

        protected void BloqueoControlesIniciales()
        {
            //Pestania de motivos
            txtObsMotivo.Enabled = false;
            txtOtrosMotivos.Enabled = false;

            //Panel de anexos
            cb_CorrelativoSAT.Enabled = false;
            txtNumeroOficioSAT.Enabled = false;
            txtAnioOficioSAT.Enabled = false;
        }

        protected Boolean GuardarDatosPrimarios()
        {
            var respuesta = false;
            var cmd = string.Empty;
            if (Request.QueryString["cmd"] != null)
            {
                cmd = Request.QueryString["cmd"].ToString();
            }

            objCEVerificacion.ID_UsuarioSolicita = Convert.ToInt32(Session["UsuarioID"].ToString());
            objCEVerificacion.TipoSolicitud = cmd;
            objCEVerificacion.NombresSolicitante = getNombresSolicitante();
            objCEVerificacion.ApellidosSolicitante = getApellidosSolicitante();
            objCEVerificacion.DireccionSolicitante = getDireccionSolicitante();
            objCEVerificacion.ID_DepartamentoSolicitante = getIdDepartamentoSolicitante();
            objCEVerificacion.CorreoSolicitante = getCorreoSolicitante();
            objCEVerificacion.TelefonoSolicitante = getTelefonoSolicitante();

            objCEVerificacion.NombreRazonSocialImportador = getNombreRazonImportador();
            objCEVerificacion.DireccionImportador = getDireccionImportador();
            objCEVerificacion.CorreoImportador = getCorreoImportador();
            objCEVerificacion.ID_DepartamentoImportador = getIdDepartamentoImportador();
            objCEVerificacion.NITImportador = getNitImportador();
            objCEVerificacion.TelefonoImportador = getTelefonoImportador();

            objCEVerificacion.NombreRazonSocialExportador = getNombreRazonExportador();
            objCEVerificacion.DireccionExportador = getDireccionExportador();
            objCEVerificacion.CorreoExportador = getCorreoExportador();
            objCEVerificacion.ID_PaisExportador = getIdPaisExportador();
            objCEVerificacion.NITExportador = getNITExportador();
            objCEVerificacion.TelefonoExportador = getTelefonoExportador();

            int id_solicitud = objCNVerificacion.InsertBorradorSolicitud(objCEVerificacion);

            if ( id_solicitud  > 0)
            {
                //Obtengo ID de borrador
                Session.Add("IDSolicitud", id_solicitud);
                respuesta = true;
            } 

            return respuesta;
        }

        protected Boolean GuardarMotivos(int id_solicitud)
        {
            var respuesta = false;

            objCEVerificacion.ID_Solicitud = id_solicitud;
            objCEVerificacion.Motivo_1 = getMotivo_1();
            objCEVerificacion.Motivo_2 = getMotivo_2();
            objCEVerificacion.Motivo_3 = getMotivo_3();
            objCEVerificacion.Motivo_4 = getMotivo_4();
            objCEVerificacion.Motivo_5 = getMotivo_5();
            objCEVerificacion.Motivo_6 = getMotivo_6();
            objCEVerificacion.Motivo_7 = getMotivo_7();
            objCEVerificacion.Motivo_8 = getMotivo_8();
            objCEVerificacion.Observacion_Check = getObservacion_Check();
            objCEVerificacion.Observaciones = getObservaciones();
            objCEVerificacion.OtrosMotivos = getOtrosMotivos();

            respuesta = objCNVerificacion.InsertBorradorMotivos(objCEVerificacion);

            return respuesta;
        }

        protected Boolean ActulizarMotivos(int id_solicitud)
        {
            var respuesta = false;

            objCEVerificacion.ID_Solicitud = id_solicitud;
            objCEVerificacion.Motivo_1 = getMotivo_1();
            objCEVerificacion.Motivo_2 = getMotivo_2();
            objCEVerificacion.Motivo_3 = getMotivo_3();
            objCEVerificacion.Motivo_4 = getMotivo_4();
            objCEVerificacion.Motivo_5 = getMotivo_5();
            objCEVerificacion.Motivo_6 = getMotivo_6();
            objCEVerificacion.Motivo_7 = getMotivo_7();
            objCEVerificacion.Motivo_8 = getMotivo_8();
            objCEVerificacion.Observacion_Check = getObservacion_Check();
            objCEVerificacion.Observaciones = getObservaciones();
            objCEVerificacion.OtrosMotivos = getOtrosMotivos();

            respuesta = objCNVerificacion.UpdateBorradorMotivos(objCEVerificacion);

            return respuesta;
        }

        protected Boolean ExistenMotivos(int id_solicitud)
        {
            var respuesta = false;
            respuesta = objCNVerificacion.ExisteMotivo(id_solicitud);
            return respuesta;
        }

        protected Boolean ActualizarDatosPrimarios(int id_solicitud)
        {
            var respuesta = false;
            
            var cmd = string.Empty;
            if (Request.QueryString["cmd"] != null)
            {
                cmd = Request.QueryString["cmd"].ToString();
            }

            objCEVerificacion.ID_Solicitud = id_solicitud;
            objCEVerificacion.ID_UsuarioSolicita = Convert.ToInt32(Session["UsuarioID"].ToString());
            objCEVerificacion.TipoSolicitud = cmd;
            objCEVerificacion.NombresSolicitante = getNombresSolicitante();
            objCEVerificacion.ApellidosSolicitante = getApellidosSolicitante();
            objCEVerificacion.DireccionSolicitante = getDireccionSolicitante();
            objCEVerificacion.ID_DepartamentoSolicitante = getIdDepartamentoSolicitante();
            objCEVerificacion.CorreoSolicitante = getCorreoSolicitante();
            objCEVerificacion.TelefonoSolicitante = getTelefonoSolicitante();

            objCEVerificacion.NombreRazonSocialImportador = getNombreRazonImportador();
            objCEVerificacion.DireccionImportador = getDireccionImportador();
            objCEVerificacion.CorreoImportador = getCorreoImportador();
            objCEVerificacion.ID_DepartamentoImportador = getIdDepartamentoImportador();
            objCEVerificacion.NITImportador = getNitImportador();
            objCEVerificacion.TelefonoImportador = getTelefonoImportador();

            objCEVerificacion.NombreRazonSocialExportador = getNombreRazonExportador();
            objCEVerificacion.DireccionExportador = getDireccionExportador();
            objCEVerificacion.CorreoExportador = getCorreoExportador();
            objCEVerificacion.ID_PaisExportador = getIdPaisExportador();
            objCEVerificacion.NITExportador = getNITExportador();
            objCEVerificacion.TelefonoExportador = getTelefonoExportador();
            
            respuesta = objCNVerificacion.UpdateBorradorSolicitud(objCEVerificacion);
           
            return respuesta;
        }

        protected Boolean GuardarDocumento(int id_solicitud, string cmd)
        {
            var respuesta = false;

            string carpeta = Path.Combine(Request.PhysicalApplicationPath, "doctos");
            string prefijo = id_solicitud.ToString() + "_" + cmd + "_" + cboTipoRequisito.SelectedValue.ToString() + "_";

            if (FileUpload_Anexo.PostedFile.FileName == "")
            {
                ErrorMessage.Text = "No ha seleccionado ningun archivo.";
                //lkBtn_viewPanel_ModalPopupExtender.Show();
            }
            else
            {
                string extension = Path.GetExtension(FileUpload_Anexo.PostedFile.FileName);

                switch (extension.ToLower())
                {
                    case ".pdf":
                        break;
                    default:
                        ErrorMessage.Text = "Extension no valida.";
                        return false;
                }

                try
                {
                    string archivo = Path.GetFileName(FileUpload_Anexo.PostedFile.FileName);
                    string carpeta_final = Path.Combine(carpeta, prefijo + archivo);
                    FileUpload_Anexo.PostedFile.SaveAs(carpeta_final);
                    //Archivo copiado correctamente
                    respuesta = true;
                    
                    //Guardarficha de documento
                    respuesta = GuardarFichaDocumentoAnexo(id_solicitud, cmd, archivo, prefijo + archivo, carpeta_final);
                    
                    
                }
                catch (Exception ex)
                {

                    ErrorMessage.Text = "Error: " + ex.Message;
                    lkBtn_viewPanel_ModalPopupExtender.Show();
                }
            }

            return respuesta;
        }

        protected Boolean GuardarFichaDocumentoAnexo(int id_solicitud, string cmd, string DocumentoOriginal, string DocumentoSistema, string Path)
        {
            var respuesta = false;

            objCEVerificacion.ID_Solicitud = id_solicitud;
            objCEVerificacion.TipoSolicitud = cmd;
            objCEVerificacion.IdRequisito = getTipoRequisito();

            objCEVerificacion.OficioSAT_Check = getOficioSATCheck();
            objCEVerificacion.IDPrefijoSAT = getIdPrefijoSAT();

            objCEVerificacion.PrefijoSAT = getPrefijoSAT();
            objCEVerificacion.numeroOficioSAT = getNumeroOficioSAT();
            objCEVerificacion.anioOficioSAT = getAnioOficioSAT();
            objCEVerificacion.numeroReferencia = getNumeroReferencia();
            
            objCEVerificacion.ObservacionesAnexo = getObservacionesAnexo();

            objCEVerificacion.NombreDocumentoOriginal = DocumentoOriginal;
            objCEVerificacion.NombreDocumentoSistema = DocumentoSistema;
            objCEVerificacion.Path = Path;

            respuesta = objCNVerificacion.InsertDocumentoAnexo(objCEVerificacion);
           
            return respuesta;
        }

        protected void Llenar_DatosPrimarios(int id_solicitud)
        {
            var tbl = new DataTable();

            tbl = objCNVerificacion.SelectDatosSolicitudEnc(id_solicitud);

            if (tbl.Rows.Count > 0)
            {
                DataRow row = tbl.Rows[0];

                txtNombre.Text = row["nombres"].ToString();
                txtApellido.Text = row["apellidos"].ToString();
                txtDireccion.Text = row["direccion"].ToString();
                txtTelefono.Text = row["telefono"].ToString();
                txtCorreo.Text = row["correo"].ToString();
                cboDepartamento.SelectedValue = row["idDepartamentoSolicita"].ToString();

                txtRazonSocialImpo.Text = row["razonSocialImportador"].ToString();
                txtDireccionImpo.Text = row["direccionImportador"].ToString();
                txtCorreoImpo.Text = row["correoImportador"].ToString();
                cboDeptoImpo.SelectedValue = row["idDepartamentoImportador"].ToString();
                txtNITImpo.Text = row["nitImportador"].ToString();
                txtTelImpo.Text = row["telefonoImportador"].ToString();

                txtRazonSocialExpo.Text = row["razonSocialExportador"].ToString();
                txtDireccionExpo.Text = row["direccionExportador"].ToString();
                txtCorreoExpo.Text = row["correoExportador"].ToString();
                cboPaisExpo.SelectedValue = row["idPaisExportador"].ToString();
                txtNITExpo.Text = row["nitExportador"].ToString();
                txtTelExpo.Text = row["telefonoExportador"].ToString();
            }
            
        }

        protected void Llenar_Motivos(int id_solicitud)
        {
            var tbl = new DataTable();

            tbl = objCNVerificacion.SelectMotivos(id_solicitud);

            if (tbl.Rows.Count > 0)
            {
                DataRow row = tbl.Rows[0];

                cb_Uno.Checked = (Boolean)row["motivo_1"];
                cb_Dos.Checked = (Boolean)row["motivo_2"];
                cb_tres.Checked = (Boolean)row["motivo_3"];
                cb_cuatro.Checked = (Boolean)row["motivo_4"];
                cb_cinco.Checked = (Boolean)row["motivo_5"];
                cb_seis.Checked = (Boolean)row["motivo_6"];
                cb_siete.Checked = (Boolean)row["motivo_7"];
                cb_ocho.Checked = (Boolean)row["motivo_8"];
                cb_ObsMotivo.Checked = (Boolean)row["observacion_si_no"];
                txtObsMotivo.Text = row["observaciones"].ToString();
                txtOtrosMotivos.Text = row["otros_motivos"].ToString();
            }

            

        }


        #endregion

        #region Obtener valores primarios

        /* Datos de Identificaion del Solicitante */
        protected string getNombresSolicitante()
        {
            return txtNombre.Text;
        }

        protected string getApellidosSolicitante()
        {
            return txtApellido.Text;
        }

        protected string getDireccionSolicitante()
        {
            return txtDireccion.Text;
        }

        protected int getIdDepartamentoSolicitante()
        {
            var respuesta = 0;

            respuesta = Convert.ToInt32(cboDepartamento.SelectedValue.ToString());

            return respuesta;
        }

        protected string getCorreoSolicitante()
        {
            return txtCorreo.Text;
        }

        protected string getTelefonoSolicitante()
        {
            return txtTelefono.Text;
        }

        /* Datos de Identificacion del Importador */
        protected string getNombreRazonImportador()
        {
            return txtRazonSocialImpo.Text;
        }

        protected string getCorreoImportador()
        {
            return txtCorreoImpo.Text;
        }

        protected string getDireccionImportador()
        {
            return txtDireccionImpo.Text;
        }

        protected int getIdDepartamentoImportador()
        {
            var respuesta = 0;

            respuesta = Convert.ToInt32(cboDeptoImpo.SelectedValue.ToString());

            return respuesta;
        }

        protected string getNitImportador()
        {
            return txtNITImpo.Text;
        }

        protected string getTelefonoImportador()
        {
            return txtTelImpo.Text;
        }

        /* Datos de Identificacion del Exportador */
        protected string getNombreRazonExportador()
        {
            return txtRazonSocialExpo.Text;
        }

        protected string getCorreoExportador()
        {
            return txtCorreoExpo.Text;
        }

        protected string getDireccionExportador()
        {
            return txtDireccionExpo.Text;
        }

        protected int getIdPaisExportador()
        {
            var respuesta = 0;

            respuesta = Convert.ToInt32(cboPaisExpo.SelectedValue.ToString());

            return respuesta;
        }

        protected string getNITExportador()
        {
            return txtNITExpo.Text;
        }

        protected string getTelefonoExportador()
        {
            return txtTelExpo.Text;
        }

        #endregion 

        #region Obtener valores de Motivos

        protected Boolean getMotivo_1()
        {
            return cb_Uno.Checked;
        }

        protected Boolean getMotivo_2()
        {
            return cb_Dos.Checked;
        }

        protected Boolean getMotivo_3()
        {
            return cb_tres.Checked;
        }

        protected Boolean getMotivo_4()
        {
            return cb_cuatro.Checked;
        }

        protected Boolean getMotivo_5()
        {
            return cb_cinco.Checked;
        }

        protected Boolean getMotivo_6()
        {
            return cb_seis.Checked;
        }

        protected Boolean getMotivo_7()
        {
            return cb_siete.Checked;
        }

        protected Boolean getMotivo_8()
        {
            return cb_ocho.Checked;
        }

        protected Boolean getObservacion_Check()
        {
            return cb_ObsMotivo.Checked;
        }

        protected string getObservaciones()
        {
            return txtObsMotivo.Text;
        }

        protected string getOtrosMotivos()
        {
            return txtOtrosMotivos.Text;
        }

        #endregion

        #region valores de archivos adjuntos
        
        protected Boolean getOficioSATCheck()
        {
            return cbOficioSAT.Checked;
        }

        protected int getIdPrefijoSAT()
        {
            return Convert.ToInt32(cb_CorrelativoSAT.SelectedValue.ToString());
        }

        protected string getPrefijoSAT()
        {
            var respuesta = string.Empty;
            if (cb_CorrelativoSAT.SelectedItem != null)
            {
                respuesta = cb_CorrelativoSAT.SelectedItem.ToString();
            }

            return respuesta;
        }

        protected int getNumeroOficioSAT()
        {
            var respuesta = 0;

            if (txtNumeroOficioSAT.Text.ToString().Length > 0)
            {
                respuesta = Convert.ToInt32(txtNumeroOficioSAT.Text);
            }
            return respuesta;
        }

        protected int getAnioOficioSAT()
        {
            return Convert.ToInt32(txtAnioOficioSAT.Text);
        }

        protected int getNumeroReferencia()
        {
            var respuesta = 0;

            if (txtNoReferencia.Text.ToString().Length > 0)
            {
                respuesta = Convert.ToInt32(txtNoReferencia.Text);
            }
            return respuesta;
        }

        protected string getObservacionesAnexo()
        {
            return txtObservaciones.Text;
        }

        protected int getTipoRequisito()
        {
            return Convert.ToInt32(cboTipoRequisito.SelectedValue.ToString());
        }

        #endregion

    }

}