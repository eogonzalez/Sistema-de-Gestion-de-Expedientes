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
using System.Net.Mail;

namespace Sistema_de_Gestion_Expedientes.Solicitudes
{
    public partial class VerificacionOrigen : System.Web.UI.Page
    {
        CNLogin objCNLogin = new CNLogin();
        CNVerificacionOrigen objCNVerificacion = new CNVerificacionOrigen();
        CEVerificacionOrigen objCEVerificacion = new CEVerificacionOrigen();

        #region Eventos del formulario

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                if (Session["UsuarioID"] != null)
                {
                    //Page.Form.Attributes.Add("enctype", "multipart/form-data");
                    int anio = DateTime.Now.Year;
                    int mes = DateTime.Now.Month;
                    int dia = DateTime.Now.Day;
                    DateTime fecha = new DateTime(anio, mes, dia);

                    txtFechaInicial.Text = fecha.ToString("dd/MM/yyyy");
                    txtFechaFinal.Text = fecha.ToString("dd/MM/yyyy");
                    lkBtn_PanelImpo_ModalPopupExtender.Hide();

                    divAlertCorrecto.Visible = false;
                    divAlertError.Visible = false;

                    BloqueoControlesIniciales();
                    Llenar_cboInstrumento();
                    Llenar_cbDepartamento();
                    Llenar_cbPais();
                    Llenar_cboAduana();

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
                        if (cmd == "VO")
                        {
                            Page.Title = "Solicitud de Verificacion de Origen";
                        }
                        else
                        {
                            Page.Title = "Solicitud de Opinion Tecnica";
                        }
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
                        Llenar_gvAnexos(idSolicitud, cmd);
                        Llenar_Productos(idSolicitud);
                        Llenar_gvImportadores(idSolicitud, cmd);
                    }

                    
                    if (Request.QueryString["idex"] != null)
                    {
                        idSolicitud = Convert.ToInt32(Request.QueryString["idex"].ToString());
                        Session["IDSolicitud"] = idSolicitud;
                        Llenar_DatosPrimarios(idSolicitud);
                        Llenar_Motivos(idSolicitud);
                        Llenar_gvAnexos(idSolicitud, cmd);
                        Llenar_Productos(idSolicitud);
                        Llenar_gvImportadores(idSolicitud, cmd);
                        BloqueoGeneral();
                    }

                    /*Envento de guardar informacion primaria*/
                    btnGuardar.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardar, ""));
                    btnGuardarMotivo.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardarMotivo, ""));
                    //btnGuardarAnexo.Attributes.Add("onclick", "this.value='Cargado documento Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardarAnexo, ""));
                    btnGuardarProducto.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnGuardarProducto, ""));
                    btnEnviar.Attributes.Add("onclick", "this.value='Procesando Espere...';this.disabled=true;" + ClientScript.GetPostBackEventReference(btnEnviar, ""));

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
            btnGuardarAnexo.Text = "Guardar Documento";
            btnGuardarAnexo.CommandName = "GuardarAnexo";
            LimpiarPanelAnexos();
        }

        protected void cb_ObsMotivo_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_ObsMotivo.Checked)
            {
                txtObsMotivo.Enabled = true;
            }
            else
            {                
                txtObsMotivo.Enabled = false;
            }
        }

        protected void cb_cinco_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_cinco.Checked)
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
            string filename = row.Cells[2].Text;

            Session.Add("IDANEXO", id_anexo);

            switch (e.CommandName)
            {
                case "mostrar":
                    Response.Redirect("~/doctos/"+filename);           
                    return;
                case "modificar":
                    LlenarDatosAnexos(id_anexo);
                    lkBtn_viewPanel_ModalPopupExtender.Show();
                    break;
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
                    divAlertCorrecto.Visible = true;
                }
                else
                {
                    ErrorMessagePrincipal.Text = "Ha ocurrido un error al Actualizar Datos Primarios";
                    divAlertError.Visible = true;
                }
            }
            else
            {
                if (GuardarDatosPrimarios())
                {
                    MensajeCorrectoPrincipal.Text = "Datos Primarios han sido Guardados, su solicitud esta ahora en bandeja de borradores.";
                    divAlertCorrecto.Visible = true;
                    //Envia mensaje a usuario de nuevo borrador de solictud
                }
                else
                {
                    ErrorMessagePrincipal.Text = "Ha ocurrido un error al Guardar Datos Primarios";
                    divAlertError.Visible = true;
                }
            }

            
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            divAlertCorrecto.Visible = false;
            divAlertCorrecto.Visible = false;

            //Envia Solicitud
            var cmd = string.Empty;
            if (Request.QueryString["cmd"] != null)
            {
                cmd = Request.QueryString["cmd"].ToString();
            }

            if (Session["IDSolicitud"] != null)
            {
                int id_solicitud = (int)Session["IDSolicitud"];
                
                if (CumpleRequisitos(id_solicitud, cmd))
                {
                    MensajeCorrectoPrincipal.Text = Session["SIVALIDA"].ToString();
                    divAlertCorrecto.Visible = true;

                    //Genero expediente
                    var idExpediente = GeneroExpediente(id_solicitud);
                    if ( idExpediente > 0)
                    {
                        
                        MensajeCorrectoPrincipal.Text = "Se ha generado correctamente el expediente.";
                        divAlertCorrecto.Visible = true;

                        /*Envio mensaje a Usuario*/
                        
                        var correoUsuario = string.Empty;
                        var nombreUsuario = string.Empty;
                        var apellidoUsuario = string.Empty;

                        if (Session["CorreoUsuarioLogin"] != null)
                        {
                            correoUsuario = Session["CorreoUsuarioLogin"].ToString();
                        }
                        if (Session["NombresUsuarioLogin"] != null)
                        {
                            nombreUsuario = Session["NombresUsuarioLogin"].ToString();
                        }
                        if (Session["ApellidosUsuarioLogin"] != null)
                        {
                            apellidoUsuario = Session["ApellidosUsuarioLogin"].ToString();
                        }

                        var mensaje = new MailMessage();
                        mensaje.Subject = "Expediente Enviado -Unidad Origen DACE-";
                        mensaje.Body = "Apreciable usuario "+nombreUsuario+" "+apellidoUsuario+", \n"+
                            "se ha generado expediente y enviado a la unidad de origen, para verificar el estado puede consultar con el numero "+idExpediente.ToString()+". \n"+
                            "NOTA: Favor no responder este correo. ";

                        if (EnvioMensajeUsuario(nombreUsuario, apellidoUsuario, correoUsuario, mensaje))
                        {
                            MensajeCorrectoPrincipal.Text += " Se ha enviado correo de notificacion al usuario.";
                            divAlertCorrecto.Visible = true;
                        }
                        else
                        {
                            ErrorMessagePrincipal.Text += " Ha ocurrido un error al enviar mensaje de notificacion al usuario.";
                            divAlertError.Visible = true;
                        }

                        mensaje.Subject = "Nuevo Expediente";
                        mensaje.Body = "Ha ingresado nuevo expediente numero "+idExpediente.ToString()+", favor revisar bandeja de expedientes. \n" +
                            "NOTA: Favor no responder este correo.";

                        /*envio Mensaje usuarios DACE */
                        if (EnvioMensajeFuncionariosDACE(mensaje))
                        {
                            MensajeCorrectoPrincipal.Text += " Se ha enviado correo de notificacion a los funcionarios DACE.";
                            divAlertCorrecto.Visible = true;
                        }
                        else
                        {
                            ErrorMessagePrincipal.Text += " Ha ocurrido un error al enviar mensaje de notificacion a los funcionarios DACE.";
                            divAlertError.Visible = true;
                        }
                    }
                    else
                    {
                        //Error al generar expediente
                        ErrorMessagePrincipal.Text += " Ha ocurrido un error al generar expediente.";
                        divAlertError.Visible = true;
                    }
                }
                else
                {
                    //Muestro mensaje correcto si valido algo correctamente
                    MensajeCorrectoPrincipal.Text = Session["SIVALIDA"].ToString();
                    divAlertCorrecto.Visible = true;

                    ErrorMessagePrincipal.Text = "ERROR: "+Session["NOVALIDA"].ToString();
                    divAlertError.Visible = true;
                }
            }
            else
            {
                ErrorMessagePrincipal.Text = "ERROR: Debe de Guardar los datos del encabezado y llenar los requerimientos minimos antes de enviar Solicitud.";
                divAlertError.Visible = true;
            }
            

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            //Cancela solicitud y regresa a menu principal
            Response.Redirect("~/Default.aspx");
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
                        
                        btnGuardarAnexo.Text = "Guardar Documento";
                        btnGuardarAnexo.CommandName = "GuardarAnexo";
                        LimpiarPanelAnexos();
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

                switch (btnGuardarAnexo.CommandName)
                {
                    case "GuardarAnexo":
                        if (GuardarDocumento(id_solicitud, cmd))
                        {
                            LimpiarPanelAnexos();
                            Llenar_gvAnexos(id_solicitud, cmd);
                        }
                        else
                        {
                            ErrorMessage.Text = "Ha ocurrido un error al cargar archivo al servidor.";
                            lkBtn_viewPanel_ModalPopupExtender.Show();
                        }
                        break;
                    case "ModificarAnexo":
                        if (Session["IDANEXO"] != null)
                        {
                            int id_anexo = 0;
                            id_anexo = (int)Session["IDANEXO"];
                            if (ActualizarDocumento(id_solicitud, cmd, id_anexo))
                            {
                                LimpiarPanelAnexos();
                                Llenar_gvAnexos(id_solicitud, cmd);
                            }
                            else
                            {
                                ErrorMessage.Text = "Ha ocurrido un error al cargar archivo al servidor.";
                                lkBtn_viewPanel_ModalPopupExtender.Show();
                            }
                        }

                        
                        break;
                    default:
                        break;
                }



            }
            else
            {
                ErrorMessage.Text = "Debe de Guardar los datos del encabezado antes de guardar los Anexos de la solicitud.";
                lkBtn_viewPanel_ModalPopupExtender.Show();
            }
              
        }

        protected void btnGuardarProducto_Click(object sender, EventArgs e)
        {
            //Guardar producto de importacion de solicitud
            if (Session["IDSolicitud"] != null)
            {
                int id_solicitud = 0;
                id_solicitud = (int)Session["IDSolicitud"];

                //Verifico si existe producto de solicitud
                if (!ExistenProductos(id_solicitud))
                {
                    //Guardo Producto
                    if (GuardarProducto(id_solicitud))
                    {
                        MensajeProducto.Text = "Se han Guardado los datos del producto de importacion.";
                    }
                    else
                    {
                        ErrorProducto.Text = "Ha ocurrido un error al guardar los datos del producto de importacion.";
                    }
                }
                else
                {
                    //Actualizo Producto
                    if (ActualizarProducto(id_solicitud))
                    {
                        MensajeProducto.Text = "Se han Actualizado los datos del producto.";
                    }
                    else
                    {
                        ErrorProducto.Text = "Ha ocurrido un error al actualizar los datos del producto.";
                    }
                }

            }
            else
            {
                ErrorMotivo.Text = "Debe de Guardar los datos del encabezado antes de guardar los datos del producto de importacion de la solicitud.";
            }
        }

        protected void gvImportadores_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnGuardarImportador_Click(object sender, EventArgs e)
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

                switch (btnGuardarImportador.CommandName)
                {
                    case "GuardarImportador":
                        if (GuardarImportador(id_solicitud, cmd))
                        {
                            LimpiarPanelImportador();
                            Llenar_gvImportadores(id_solicitud, cmd);                        
                        }
                        else
                        {
                            ErrorMessageImportaroTab.Text = "Ha ocurrido un error al almacenar datos del importador.";
                            lkBtn_AgregarImportador_ModalPopupExtender.Show();                        
                        }
                        break;
                    case "ModificarImportador":
                        //if (Session["IDANEXO"] != null)
                        //{
                        //    int id_anexo = 0;
                        //    id_anexo = (int)Session["IDANEXO"];
                        //    if (ActualizarDocumento(id_solicitud, cmd, id_anexo))
                        //    {
                        //        LimpiarPanelAnexos();
                        //        Llenar_gvAnexos(id_solicitud, cmd);
                        //    }
                        //    else
                        //    {
                        //        ErrorMessage.Text = "Ha ocurrido un error al cargar archivo al servidor.";
                        //        lkBtn_viewPanel_ModalPopupExtender.Show();
                        //    }
                        //}


                        break;
                    default:
                        break;
                }



            }
            else
            {
                ErrorMessage.Text = "Debe de Guardar los datos del encabezado antes de guardar los Anexos de la solicitud.";
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

        protected void Llenar_cboInstrumento()
        {
            var dt = new DataTable();

            dt = objCNVerificacion.SelectComboInstrumentos();

            if (dt.Rows.Count > 0)
            {
                cbo_instrumento.DataTextField = dt.Columns["nombre_instrumento"].ToString();
                cbo_instrumento.DataValueField = dt.Columns["id_instrumento"].ToString();
                cbo_instrumento.DataSource = dt;
                cbo_instrumento.DataBind();
            }
        }

        protected void Llenar_cboAduana()
        {
            var dt = new DataTable();

            dt = objCNVerificacion.SelectComboAduanas();

            if (dt.Rows.Count > 0)
            {
                cboAduana_Producto.DataTextField = dt.Columns["nombre"].ToString();
                cboAduana_Producto.DataValueField = dt.Columns["idAduana"].ToString();
                cboAduana_Producto.DataSource = dt;
                cboAduana_Producto.DataBind();
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

        protected void Llenar_gvAnexos(int id_solicitud, string cmd)
        {

            var tbl = new DataTable();

            tbl = objCNVerificacion.SelectDocumentosAnexos(id_solicitud, cmd);

            gvAnexos.DataSource = tbl;
            gvAnexos.DataBind();

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

            objCEVerificacion.ID_Tratado = getTratado();
            objCEVerificacion.fecha_periodo_inicial = getPeriodoInicial();
            objCEVerificacion.fecha_periodo_final = getPeriodoFinal();

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
            //objCEVerificacion.Motivo_6 = getMotivo_6();
            //objCEVerificacion.Motivo_7 = getMotivo_7();
            //objCEVerificacion.Motivo_8 = getMotivo_8();
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
            //objCEVerificacion.Motivo_6 = getMotivo_6();
            //objCEVerificacion.Motivo_7 = getMotivo_7();
            //objCEVerificacion.Motivo_8 = getMotivo_8();
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

            objCEVerificacion.ID_Tratado = getTratado();
            objCEVerificacion.fecha_periodo_inicial = getPeriodoInicial();
            objCEVerificacion.fecha_periodo_final = getPeriodoFinal();

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

        protected Boolean ActualizarDocumento(int id_solicitud, string cmd, int id_anexo)
        {
            var respuesta = false;

            string carpeta = Path.Combine(Request.PhysicalApplicationPath, "doctos");
            string prefijo = id_solicitud.ToString() + "_" + cmd + "_" + cboTipoRequisito.SelectedValue.ToString() + "_";

            string documentoOriginal = string.Empty;
            string carpeta_final = string.Empty;
            string documentoSistema = string.Empty;

            //var subeArchivo = false;


            if (!FileUpload_Anexo.HasFile)
            {
                documentoOriginal = null;
                carpeta_final = null;
                documentoSistema = null;
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
                    
                    documentoOriginal = Path.GetFileName(FileUpload_Anexo.PostedFile.FileName);
                    carpeta_final = Path.Combine(carpeta, prefijo + documentoOriginal);
                    FileUpload_Anexo.PostedFile.SaveAs(carpeta_final);
                    //Archivo copiado correctamente
                    respuesta = true;
                    
                    documentoSistema = prefijo+documentoOriginal;
                }
                catch (Exception ex)
                {

                    ErrorMessage.Text = "Error: " + ex.Message;
                    lkBtn_viewPanel_ModalPopupExtender.Show();
                }
            }


            //Actualizo de documento    
            respuesta = ActualizarDatosAnexo(id_anexo, documentoOriginal, documentoSistema, carpeta_final);

                                
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

                txtFechaInicial.Text = row["fecha_inicio_periodo"].ToString();
                txtFechaFinal.Text = row["fecha_fin_periodo"].ToString();
                cbo_instrumento.SelectedValue = row["id_instrumento"].ToString();

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
                //cb_seis.Checked = (Boolean)row["motivo_6"];
                //cb_siete.Checked = (Boolean)row["motivo_7"];
                //cb_ocho.Checked = (Boolean)row["motivo_8"];
                cb_ObsMotivo.Checked = (Boolean)row["observacion_si_no"];
                txtObsMotivo.Text = row["observaciones"].ToString();
                txtOtrosMotivos.Text = row["otros_motivos"].ToString();
            }

            

        }

        protected Boolean CumpleRequisitos(int id_solicitud, string cmd)
        {
            var respuesta = false;
            var mensajeValidacionNo = string.Empty;
            var mensajeValidacionSi = string.Empty;

            //Validacion de periodo de tratado

            //Exite motivo
            if (ExistenMotivos(id_solicitud))
            {
                //Verifica que almenos exista un motivo seleccionado
                if (VerificaMotivo(id_solicitud))
                {
                    mensajeValidacionSi = "Motivos Validados Correctamente. \n";
                    respuesta = true;
                }
                else
                {
                    mensajeValidacionNo = "Debe de existir almenos un motivo.\n";
                    respuesta = false;
                }
            }
            else
            {
                mensajeValidacionNo = "Agrege un motivo a su solicitud antes de enviarla.\n";
                respuesta = false;
            }
                        
            //existe Anexo
            if (ExistenAnexos(id_solicitud))
            {
                if (CumpleAnexosObligatorios(id_solicitud, cmd))
                {
                    mensajeValidacionSi += "Anexos Validados Correctamento. \n";
                    respuesta = true;
                }
                else
                {
                    mensajeValidacionNo += "Hace falta algun documento anexo que es obligatorio, favor verifique.";
                    respuesta = false;
                }
            }
            else
            {
                mensajeValidacionNo += " Debe de exitir almenos un documento Anexo.\n ";
                respuesta = false;
            }
            

            //Valido productos
            if (ExistenProductos(id_solicitud))
            {
                mensajeValidacionSi += " Productos Validados Correctamente";
            }
            else
            {
                mensajeValidacionNo += " Debe de existir un producto de importacion.\n";
                respuesta = false;
            }

            Session.Add("SIVALIDA", mensajeValidacionSi);
            Session.Add("NOVALIDA", mensajeValidacionNo);
            return respuesta;
        }

        protected int GeneroExpediente(int id_solicitud)
        {
            var respuesta = 0;
            respuesta = objCNVerificacion.GeneroExpediente(id_solicitud);
            return respuesta;
        }

        protected Boolean VerificaMotivo(int id_solicitud)
        {
            var respuesta = false;
            respuesta = objCNVerificacion.VerificaMotivo(id_solicitud);
            return respuesta;
        }

        protected Boolean ExistenAnexos(int id_solicitud)
        {
            return objCNVerificacion.ExisteAnexo(id_solicitud);
        }

        protected Boolean CumpleAnexosObligatorios(int id_solicitud, string cmd)
        {
            return objCNVerificacion.CumpleAnexoObligatorio(id_solicitud, cmd);
        }

        protected Boolean EnvioMensajeUsuario(string nombre, string apellido, string correo, MailMessage mensaje)
        {
            var respuesta = false;

            try
            {
                Correo cr = new Correo();
                MailMessage mnsj = new MailMessage();

                mnsj.Subject = mensaje.Subject;
                mnsj.To.Add(new MailAddress(correo));
                
                mnsj.From = new MailAddress("alertas.dace@gmail.com", "Alertas DACE");

                /* Si deseamos Adjuntar algún archivo*/
                //mnsj.Attachments.Add(new Attachment("C:\\archivo.pdf"));

                mnsj.Body = mensaje.Body;

                /*Enviar*/
                cr.EnviarCorreo(mnsj);
                respuesta = true;
            }
            catch (Exception)
            {
                //Capturo mensaje de error
                respuesta = false;
            }

            return respuesta;
        }

        protected Boolean EnvioMensajeFuncionariosDACE(MailMessage mensaje)
        {
            var respuesta = false;

            try
            {
                Correo cr = new Correo();
                MailMessage msg = new MailMessage();
                string listaCorreos = string.Empty;

                listaCorreos = ListaCorreosFuncionariosDACE();

                msg.Subject = mensaje.Subject;
                msg.To.Add(listaCorreos);
                msg.From = new MailAddress("alertas.dace@gmail.com", "Alertas DACE");

                /* Si deseamos Adjuntar algún archivo*/
                //mnsj.Attachments.Add(new Attachment("C:\\archivo.pdf"));

                msg.Body = mensaje.Body;

                /*Enviar*/
                cr.EnviarCorreo(msg);
                respuesta = true;
            }
            catch (Exception)
            {
                
                //capturo mensaje de error
                respuesta = false;
            }

            return respuesta;
        }
        
        protected string ListaCorreosFuncionariosDACE()
        {
            var respuesta = string.Empty;

            //Verifico si DT trae datos
            var tbl = new DataTable();

            tbl = objCNVerificacion.SelectFuncionariosDACE();

            if (tbl.Rows.Count > 0)
            {
                //DataRow row = tbl.Rows[0];
                long cont = 0;
                foreach (DataRow row in tbl.Rows)
                {
                    /*foreach (DataColumn item in tbl.Columns)
                    {
                        var field = row[2].ToString();
                    }*/
                    if (cont == 0)
                    {
                        respuesta += row[2].ToString();
                    }
                    else
                    {
                        respuesta += "," + row[2].ToString();
                    }
                    cont++;
                }
            }


            //Si trae recorro y adjunto corres en el string

            return respuesta;
        }

        protected void LlenarDatosAnexos(int id_anexo)
        {
            btnGuardarAnexo.Text = "Editar Documento";
            btnGuardarAnexo.CommandName = "ModificarAnexo";

            var tbl = new DataTable();

            tbl = objCNVerificacion.SelectDatosAnexo(id_anexo);

            if (tbl.Rows.Count > 0)
            {
                DataRow row = tbl.Rows[0];

                cboTipoRequisito.SelectedValue = row["idRequisito"].ToString();
                cbOficioSAT.Checked = (Boolean)row["oficioSAT"];
                cb_CorrelativoSAT.SelectedValue = row["idPrefijoSAT"].ToString();
                txtNumeroOficioSAT.Text = row["numeroOficioSAT"].ToString();
                txtAnioOficioSAT.Text = row["anioOficioSAT"].ToString();
                txtNoReferencia.Text = row["numeroReferencia"].ToString();
                txtObservaciones.Text = row["observaciones"].ToString();
                            
            }
        }

        protected void LimpiarPanelAnexos()
        {
            cbOficioSAT.Checked = false;
            txtNumeroOficioSAT.Text = string.Empty;
            txtNoReferencia.Text = string.Empty;
            txtObservaciones.Text = string.Empty;
        }

        protected Boolean ActualizarDatosAnexo(int id_anexo, string DocumentoOriginal, string DocumentoSistema, string RutaArchivo)
        {
            objCEVerificacion.ID_Anexo = id_anexo;
            objCEVerificacion.OficioSAT_Check = getOficioSATCheck();
            objCEVerificacion.IDPrefijoSAT = getIdPrefijoSAT();
            objCEVerificacion.PrefijoSAT = getPrefijoSAT();
            objCEVerificacion.numeroOficioSAT = getNumeroOficioSAT();
            objCEVerificacion.anioOficioSAT = getAnioOficioSAT();
            objCEVerificacion.numeroReferencia = getNumeroReferencia();
            objCEVerificacion.IdRequisito = getTipoRequisito();
            objCEVerificacion.ObservacionesAnexo = getObservacionesAnexo();

            objCEVerificacion.NombreDocumentoOriginal = DocumentoOriginal;
            objCEVerificacion.NombreDocumentoSistema = DocumentoSistema;

            objCEVerificacion.Path = RutaArchivo;

            return objCNVerificacion.UpdateDatosAnexo(objCEVerificacion);
        }

        protected void BloqueoGeneral()
        {
            //Bloqueo datos primarios
            txtFechaInicial.Enabled = false;
            txtFechaFinal.Enabled = false;
            cbo_instrumento.Enabled = false;

            txtRazonSocialImpo.Enabled = false;
            txtDireccionImpo.Enabled = false;
            txtNITImpo.Enabled = false;
            txtCorreoImpo.Enabled = false;            
            cboDeptoImpo.Enabled = false;
            txtTelImpo.Enabled = false;

            txtRazonSocialExpo.Enabled = false;
            txtDireccionExpo.Enabled = false;
            txtNITExpo.Enabled = false;
            txtCorreoExpo.Enabled = false;
            cboPaisExpo.Enabled = false;
            txtTelExpo.Enabled = false;

            btnGuardar.Enabled = false;
            btnEnviar.Enabled = false;

            //Bloqueo Motivos
            cb_Uno.Enabled = false;
            cb_Dos.Enabled = false;
            cb_tres.Enabled = false;
            cb_cuatro.Enabled = false;
            cb_cinco.Enabled = false;
            //cb_seis.Enabled = false;
            //cb_siete.Enabled = false;
            //cb_ocho.Enabled = false;
            cb_ObsMotivo.Enabled = false;
            txtObsMotivo.Enabled = false;
            txtOtrosMotivos.Enabled = false;
                        
            btnGuardarMotivo.Enabled = false;

            //Bloqueo Anexos
            btnGuardarAnexo.Enabled = false;            
            lkBtn_AgregarAdjunto.Visible = false;
            //lkBtn_AgregarAdjunto.Enabled = false;
            gvAnexos.Columns[6].Visible = false;

            //Bloqueo datos producto
            cboRegimen_Producto.Enabled = false;
            cboAduana_Producto.Enabled = false;
            txtClasificacion_Producto.Enabled = false;
            txtDescripcionComercial_Producto.Enabled = false;
            txtDescripcionFactura_Producto.Enabled = false;
            txtObservaciones_Producto.Enabled = false;

            btnGuardarProducto.Enabled = false;
        }

        protected Boolean ExistenProductos(int id_solicitud)
        {
            return objCNVerificacion.ExistenProductos(id_solicitud);
        }

        protected Boolean GuardarProducto(int id_solicitud)
        {
            var respuesta = false;

            objCEVerificacion.ID_Solicitud = id_solicitud;
            objCEVerificacion.ID_Regimem_Importacion = getRegimenImportacion();
            objCEVerificacion.Nombre_Regimen_Importacion = getNombreRegimenImportacion();
            objCEVerificacion.IDAduana = getAduana();
            objCEVerificacion.Clasificacion_Arancelaria = getClasificacionArancelaria();
            objCEVerificacion.Descripcion_Comercial = getDescripcionComercial();
            objCEVerificacion.Descripcion_Factura = getDescripcionFactura();
            objCEVerificacion.ObservacionesProducto = getObservacionesProducto();

            respuesta = objCNVerificacion.InsertBorradorProducto(objCEVerificacion);

            return respuesta;
        }

        protected Boolean ActualizarProducto(int id_solicitud)
        {
            var respuesta = false;

            objCEVerificacion.ID_Solicitud = id_solicitud;
            objCEVerificacion.ID_Regimem_Importacion = getRegimenImportacion();
            objCEVerificacion.ID_Regimem_Importacion = getRegimenImportacion();
            objCEVerificacion.Nombre_Regimen_Importacion = getNombreRegimenImportacion();
            objCEVerificacion.IDAduana = getAduana();
            objCEVerificacion.Clasificacion_Arancelaria = getClasificacionArancelaria();
            objCEVerificacion.Descripcion_Comercial = getDescripcionComercial();
            objCEVerificacion.Descripcion_Factura = getDescripcionFactura();
            objCEVerificacion.ObservacionesProducto = getObservacionesProducto();

            respuesta = objCNVerificacion.UpdateBorradorProducto(objCEVerificacion);

            return respuesta;
        }

        protected void Llenar_Productos(int id_solicitud)
        {
            var tbl = new DataTable();

            tbl = objCNVerificacion.SelectProductos(id_solicitud);

            if (tbl.Rows.Count > 0)
            {
                DataRow row = tbl.Rows[0];

                cboRegimen_Producto.SelectedValue = row["id_regimen_importacion"].ToString();
                cboAduana_Producto.SelectedValue = row["idAduana"].ToString();
                txtClasificacion_Producto.Text = row["clasificacion_arancelaria"].ToString();
                txtDescripcionComercial_Producto.Text = row["descripcion_comercial"].ToString();
                txtDescripcionFactura_Producto.Text = row["descripcion_factura"].ToString();
                txtObservaciones_Producto.Text = row["observaciones"].ToString();

            }

        }

        protected void Llenar_gvImportadores(int id_solicitud, string cmd)
        {
            var tbl = new DataTable();

            tbl = objCNVerificacion.SelectImportadores(id_solicitud);

            gvImportadores.DataSource = tbl;
            gvImportadores.DataBind();
        }

        protected Boolean GuardarImportador(int id_solicitud, string cmd)
        {
            var respuesta = false;
            objCEVerificacion.ID_Solicitud = id_solicitud;
            objCEVerificacion.TipoSolicitud = cmd;
            objCEVerificacion.RazonSocial_Ficha_Importador = getRazonFichaImportador();
            objCEVerificacion.Correo_Ficha_Importador = getCorreoFichaImportador();
            objCEVerificacion.Nit_Ficha_Importador = getNitFichaImportador();
            objCEVerificacion.Telefono_Ficha_Importador = getTelefonoFichaImportador();

            respuesta = objCNVerificacion.InsertImportador(objCEVerificacion);

            return respuesta;
        }

        protected void LimpiarPanelImportador()
        {
            txtRazonSocialImpoTab.Text = string.Empty;
            txtCorreoImpoTab.Text = string.Empty;
            txtNITImpoTab.Text = string.Empty;
            txtTelImpoTab.Text = string.Empty;
        }

        #endregion

        #region Obtener valores primarios

        /* Datos de Identificaion del Solicitante */
        protected DateTime getPeriodoInicial()
        {
            return Convert.ToDateTime(txtFechaInicial.Text);
        }

        protected DateTime getPeriodoFinal()
        {
            return Convert.ToDateTime(txtFechaFinal.Text);
        }

        protected int getTratado()
        {
            return Convert.ToInt32(cbo_instrumento.SelectedValue.ToString());
        }

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

        //protected Boolean getMotivo_6()
        //{
        //    return cb_seis.Checked;
        //}

        //protected Boolean getMotivo_7()
        //{
        //    return cb_siete.Checked;
        //}

        //protected Boolean getMotivo_8()
        //{
        //    return cb_ocho.Checked;
        //}

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

        #region Valores de archivos adjuntos
        
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

        #region Valores Productos de Importacion

        protected int getRegimenImportacion()
        {
            return Convert.ToInt32(cboRegimen_Producto.SelectedValue);
        }

        protected string getNombreRegimenImportacion()
        {
            return cboRegimen_Producto.SelectedItem.ToString();
        }

        protected int getAduana()
        {
            return Convert.ToInt32(cboAduana_Producto.SelectedValue);
        }

        protected string getClasificacionArancelaria()
        {
            return txtClasificacion_Producto.Text;
        }

        protected string getDescripcionComercial()
        {
            return txtDescripcionComercial_Producto.Text;
        }

        protected string getDescripcionFactura()
        {
            return txtDescripcionFactura_Producto.Text;
        }

        protected string getObservacionesProducto()
        {
            return txtObservaciones_Producto.Text;
        }

        #endregion

        #region Obtener valores Importadores

        protected string getRazonFichaImportador()
        {
            return txtRazonSocialImpoTab.Text;
        }

        protected string getCorreoFichaImportador()
        {
            return txtCorreoImpoTab.Text;
        }

        protected string getNitFichaImportador()
        {
            return txtNITImpoTab.Text;
        }

        protected string getTelefonoFichaImportador()
        {
            return txtTelImpoTab.Text;
        }


        #endregion

    }

}