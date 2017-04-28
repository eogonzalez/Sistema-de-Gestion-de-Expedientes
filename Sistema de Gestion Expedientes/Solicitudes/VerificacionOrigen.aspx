<%@ Page Title="Verificacion de Origen" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerificacionOrigen.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Solicitudes.VerificacionOrigen" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="panel panel-primary">
        <div class="panel-heading">Formulario <%:Title %> </div>

        <div class="panel-body form-horizontal">

            <div class="form-group input-sm">
                <asp:Label ID="lblPeriodo" AssociatedControlID="txtFechaInicial" CssClass="control-label col-xs-2" runat="server" Text="Periodo: Fecha Inicial:"></asp:Label>
                <div class="col-xs-4">
                    <asp:TextBox ID="txtFechaInicial" CssClass="form-control" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtFechaInicial_CalendarExtender" runat="server" BehaviorID="txtFechaInicial_CalendarExtender" TargetControlID="txtFechaInicial" Format="dd/MM/yyyy" />
                </div>
                <asp:Label ID="lblFechaFin" AssociatedControlID="txtFechaFinal" CssClass="control-label col-xs-2" runat="server" Text=" Fecha Final:"></asp:Label>
                <div class="col-xs-4">
                    <asp:TextBox ID="txtFechaFinal" CssClass="form-control" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtFechaFinal_CalendarExtender" runat="server" BehaviorID="txtFechaFinal_CalendarExtender" TargetControlID="txtFechaFinal" Format="dd/MM/yyyy" />
                </div>
            </div>

            <div class="form-group input-sm">
                <asp:Label AssociatedControlID="cbo_instrumento" Text="Tratado Comercial: " runat="server" CssClass="control-label col-xs-2" />
                <div class="col-xs-10">
                    <asp:DropDownList runat="server" ID="cbo_instrumento" CssClass="form-control" />
                </div>
            </div>

            <h3><span class="label label-primary">Datos de Identificacion del Solicitante</span></h3>
            <div class="thumbnail">
                <div class="form-group input-sm">
                    <asp:Label CssClass="control-label col-xs-2" runat="server" Text="Nombres:" AssociatedControlID="txtNombre"></asp:Label>
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control input-sm"></asp:TextBox>
                    </div>

                    <asp:Label CssClass="control-label col-xs-2" runat="server" Text="Apellidos:" AssociatedControlID="txtApellido"></asp:Label>
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control input-sm"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group input-sm">
                    <asp:Label runat="server" CssClass="control-label col-xs-2" Text="Direccion:" AssociatedControlID="txtDireccion"></asp:Label>
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control input-sm"></asp:TextBox>
                    </div>

                    <asp:Label runat="server" CssClass="control-label col-xs-2" Text="Departamento:" AssociatedControlID="cboDepartamento"></asp:Label>
                    <div class="col-xs-4">
                        <asp:DropDownList runat="server" ID="cboDepartamento" CssClass="form-control input-sm"></asp:DropDownList>
                    </div>
                </div>

                <div class="form-group input-sm">


                    <asp:Label Text="E-Mail" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtCorreo" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtCorreo" CssClass="form-control input-sm" />
                    </div>

                    <asp:Label Text="Telefono:" runat="server" AssociatedControlID="txtTelefono" CssClass="control-label col-xs-2" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control input-sm" />
                    </div>
                </div>
            </div>

            <h3><span class="label label-primary">Datos de Identificacion del Importador</span></h3>
            <div class="thumbnail">
                <div class="form-group input-sm">

                    <asp:Label Text="Nombre o Razon Social" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtRazonSocialImpo" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtRazonSocialImpo" CssClass="form-control input-sm" />
                    </div>

                    <asp:Label Text="E-Mail" runat="server" AssociatedControlID="txtCorreoImpo" CssClass="control-label col-xs-2" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtCorreoImpo" CssClass="form-control input-sm" />
                    </div>
                </div>

                <div class="form-group input-sm">
                    <asp:Label Text="Direccion:" runat="server" AssociatedControlID="txtDireccionImpo" CssClass="control-label col-xs-2" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtDireccionImpo" CssClass="form-control input-sm" />
                    </div>

                    <asp:Label Text="Departamento" runat="server" AssociatedControlID="cboDeptoImpo" CssClass="control-label col-xs-2" />
                    <div class="col-xs-4">
                        <asp:DropDownList runat="server" ID="cboDeptoImpo" CssClass="form-control input-sm">
                        </asp:DropDownList>
                    </div>

                </div>

                <div class="form-group input-sm">


                    <asp:Label Text="NIT" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtNITImpo" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtNITImpo" CssClass="form-control input-sm" />
                    </div>

                    <asp:Label Text="Telefono" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtTelImpo" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtTelImpo" CssClass="form-control input-sm" />
                    </div>

                </div>

            </div>

            <h3><span class="label label-primary">Datos de Identificacion del Exportador</span></h3>
            <div class="thumbnail">

                <div class="form-group input-sm">
                    <asp:Label Text="Nombre o Razon Social" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtRazonSocialImpo" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtRazonSocialExpo" CssClass="form-control input-sm" />
                    </div>

                    <asp:Label Text="E-Mail" runat="server" AssociatedControlID="txtCorreoExpo" CssClass="control-label col-xs-2" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtCorreoExpo" CssClass="form-control input-sm" />
                    </div>

                </div>

                <div class="form-group input-sm">
                    <asp:Label Text="Direccion:" runat="server" AssociatedControlID="txtDireccionExpo" CssClass="control-label col-xs-2" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtDireccionExpo" CssClass="form-control input-sm" />
                    </div>

                    <asp:Label Text="Pais" runat="server" AssociatedControlID="cboPaisExpo" CssClass="control-label col-xs-2" />
                    <div class="col-xs-4">
                        <asp:DropDownList runat="server" ID="cboPaisExpo" CssClass="form-control input-sm">
                        </asp:DropDownList>
                    </div>
                </div>


                <div class="form-group input-sm">


                    <asp:Label Text="Numero de Identificación" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtNITExpo" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtNITExpo" CssClass="form-control input-sm" />
                    </div>

                    <asp:Label Text="Telefono" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtTelExpo" />
                    <div class="col-xs-4">
                        <asp:TextBox runat="server" ID="txtTelExpo" CssClass="form-control input-sm" />
                    </div>
                </div>
            </div>

            <div class="panel-footer">
                <div id="divAlertCorrecto" runat="server">
                    <p class="alert alert-success">
                        <asp:Literal runat="server" ID="MensajeCorrectoPrincipal" />
                    </p>
                </div>
                <div id="divAlertError" runat="server">
                    <p class="alert alert-danger" id="pAlertError" runat="server">
                        <asp:Literal runat="server" ID="ErrorMessagePrincipal" />
                    </p>
                </div>

                <div class="text-center">
                    <div class="btn-group">
                        <asp:Button Text="Guardar Datos de Identificacion " ID="btnGuardar" runat="server" CommandName="GuardarIdentificacion" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                        <asp:Button Text="Enviar Solicitud" ID="btnEnviar" runat="server" CommandName="EnviarSolicitud" CssClass="btn btn-success" OnClick="btnEnviar_Click" />
                        <asp:Button Text="Aclarar" ID="btnAclarar" runat="server" CommandName="Aclarar" CssClass="btn btn-warning" OnClick="btnAclarar_Click" />
                        <asp:Button Text="Salir" ID="btnCancelar" runat="server" CssClass="btn btn-info" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </div>

            <div class="thumbnail">

                <ul class="nav nav-tabs nav-justified">
                    <li role="presentation" class="active"><a href="#tbMotivo" aria-controls="tbMotivo" data-toggle="tab">Motivo de Solicitud</a></li>
                    <li role="presentation"><a href="#tbAnexos" aria-controls="tbAnexos" data-toggle="tab">Documentacion Anexa</a></li>
                    <li role="presentation"><a href="#tbProductos" aria-controls="tbProductos" data-toggle="tab">Datos del Producto Importado</a></li>
                    <li role="presentation"><a href="#tbImportadores" aria-controls="tbImportadores" data-toggle="tab">Importadores</a></li>
                </ul>

                <%--Contenido de los paneles--%>

                <div class="tab-content">
                    <%--Tab de Motivo--%>
                    <div role="tabpanel" class="tab-pane active" id="tbMotivo">
                        <div class="panel-body form-horizontal">
                            <div class="form-group input-sm">
                                <asp:Label runat="server" CssClass="control-label col-xs-5 " Text="1. Inclumplimiento de la Regla de Origen:" AssociatedControlID="cb_Uno"></asp:Label>
                                <div class="col-xs-1">
                                    <asp:CheckBox runat="server" ID="cb_Uno" />
                                </div>

                                <asp:Label CssClass="control-label col-xs-5" Text="3. Incumplimiento de Normas de Traslado y Transbordo:" runat="server" AssociatedControlID="cb_tres" />
                                <div class="col-xs-1">
                                    <asp:CheckBox ID="cb_tres" runat="server" />
                                </div>
                            </div>

                            <div class="form-group input-sm">
                                <asp:Label runat="server" CssClass="control-label col-xs-5 " Text="2. Inconsistencia en el Marcado del Pais de Origen:" AssociatedControlID="cb_Dos"></asp:Label>
                                <div class="col-xs-1">
                                    <asp:CheckBox runat="server" ID="cb_Dos" />
                                </div>

                                <asp:Label runat="server" CssClass="control-label col-xs-5" Text="4. Certificado de Origen Apocrifo(falso o alterado):" AssociatedControlID="cb_cinco"></asp:Label>
                                <div class="col-xs-1">
                                    <asp:CheckBox ID="cb_cuatro" runat="server" />
                                </div>
                            </div>

                            <div class="form-group input-sm">
                                <asp:Label CssClass="control-label col-xs-5" Text="Observaciones o Comentarios:" runat="server" AssociatedControlID="cb_ObsMotivo"></asp:Label>
                                <div class="col-xs-1">
                                    <asp:CheckBox ID="cb_ObsMotivo" runat="server" AutoPostBack="True" OnCheckedChanged="cb_ObsMotivo_CheckedChanged" />
                                </div>

                                <asp:Label Text="5. Otras Irregularidades:" runat="server" CssClass="control-label col-xs-5" AssociatedControlID="cb_cinco" />
                                <div class="col-xs-1">
                                    <asp:CheckBox ID="cb_cinco" runat="server" AutoPostBack="True" OnCheckedChanged="cb_cinco_CheckedChanged" />
                                </div>

                            </div>

                            <div class="form-group input-sm">
                                <div class="col-xs-6">
                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtObsMotivo" CssClass="form-control input-sm" />
                                </div>
                                <div class="col-xs-6">
                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtOtrosMotivos" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="panel-footer">
                            <p class="text-success">
                                <asp:Literal runat="server" ID="MensajeMotivo" />
                            </p>
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="ErrorMotivo" />
                            </p>
                            <asp:Button Text="Guardar Motivo" ID="btnGuardarMotivo" runat="server" CssClass="btn btn-primary" OnClick="btnGuardarMotivo_Click" />
                        </div>
                    </div>

                    <%--Tab de Anexos--%>
                    <div role="tabpanel" class="tab-pane" id="tbAnexos">
                        <div class="panel-body form-horizontal">
                            <asp:LinkButton runat="server" ID="lkBtn_AgregarAdjunto" CssClass="btn btn-primary"><i aria-hidden="true" class="glyphicon glyphicon-pencil"></i>Adjuntar Requisito</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lkBtn_viewPanel"></asp:LinkButton>

                            <cc1:ModalPopupExtender ID="lkBtn_AgregarAdjunto_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                                BehaviorID="lkBtn_AgregarAdjunto_ModalPopupExtender" PopupControlID="pnl_Anexo" TargetControlID="lkBtn_AgregarAdjunto" CancelControlID="btnHide">
                            </cc1:ModalPopupExtender>

                            <cc1:ModalPopupExtender ID="lkBtn_viewPanel_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                                BehaviorID="lkBtn_viewPanel_ModalPopupExtender" PopupControlID="pnl_Anexo" TargetControlID="lkBtn_viewPanel">
                            </cc1:ModalPopupExtender>
                        </div>

                        <asp:UpdatePanel runat="server" ID="up_Anexos">
                            <ContentTemplate>
                                <asp:GridView runat="server" ID="gvAnexos"
                                    CssClass="table table-hover table-striped"
                                    GridLines="None"
                                    EmptyDataText="No se han agregado documentos."
                                    AutoGenerateColumns="false" OnRowCommand="gvAnexos_RowCommand">

                                    <Columns>
                                        <asp:BoundField DataField="corr_BorradorAnexo" SortExpression="corr_BorradorAnexo" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                        <asp:BoundField DataField="path" HeaderText="Direccion" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                        <asp:BoundField DataField="nombreDocumentoSistema" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                        <asp:BoundField DataField="nombre" HeaderText="Requisito" />
                                        <asp:BoundField DataField="numeroReferencia" HeaderText="No. Referencia" />
                                        <asp:ButtonField ButtonType="Button" Text="Ver Documento" HeaderText="Ver Documento" CommandName="mostrar" ControlStyle-CssClass="btn btn-primary" />
                                        <%--                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:HyperLink id="openpdf" NavigateUrl='<%#Eval("path")%>' text='<%#Eval("nombreDocumentoSistema")%>' runat="server" />
                                                <asp:LinkButton id="lkbAbrirDocto" Text="Open" CausesValidation="false" CommandArgument='<%#Eval("nombreDocumentoSistema")%>'  OnClick="Unnamed_Click" runat="server" />                                                
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:ButtonField ButtonType="Button" Text="Modificar" HeaderText="Modificar" CommandName="modificar" ControlStyle-CssClass="btn btn-success" />
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnGuardarAnexo" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>

                    <%--Tab de Productos--%>
                    <div role="tabpanel" class="tab-pane" id="tbProductos">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="ErrorTabProductos" />
                        </p>
                        <div class="panel-body form-horizontal">
                            <div class="form-group">
                                <asp:Label AssociatedControlID="cboRegimen_Producto" CssClass="control-label col-xs-2" Text="Regimen de Importacion: " runat="server" />
                                <div class="col-xs-10">
                                    <asp:DropDownList ID="cboRegimen_Producto" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="1">DI - Importación definitiva de mercancías proveniente de almacén fiscal.</asp:ListItem>
                                        <asp:ListItem Value="2">ID - Importación definitiva</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label AssociatedControlID="cboAduana_Producto" CssClass="control-label col-xs-2" Text="Aduana de Ingreso:" runat="server" />
                                <div class="col-xs-10">
                                    <asp:DropDownList ID="cboAduana_Producto" CssClass="form-control" runat="server" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label AssociatedControlID="txtClasificacion_Producto" Text="Clasificacion Arancelaria Declarada:" CssClass="control-label col-xs-2" runat="server" />
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtClasificacion_Producto" CssClass="form-control" runat="server" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label AssociatedControlID="txtDescripcionComercial_Producto" Text="Descripcion Comercial:" CssClass="control-label col-xs-2" runat="server" />
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtDescripcionComercial_Producto" runat="server" CssClass="form-control" TextMode="MultiLine" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label AssociatedControlID="txtDescripcionFactura_Producto" Text="Descripcion en Factura:" CssClass="control-label col-xs-2" runat="server" />
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtDescripcionFactura_Producto" runat="server" CssClass="form-control" TextMode="MultiLine" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label AssociatedControlID="txtObservaciones_Producto" Text="Observaciones / Comentarios" CssClass="control-label col-xs-2" runat="server" />
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtObservaciones_Producto" runat="server" CssClass="form-control" TextMode="MultiLine" />
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <p class="text-success">
                                <asp:Literal runat="server" ID="MensajeProducto" />
                            </p>
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="ErrorProducto" />
                            </p>
                            <asp:Button Text="Guardar Producto" ID="btnGuardarProducto" runat="server" CssClass="btn btn-primary" OnClick="btnGuardarProducto_Click" />
                        </div>
                    </div>

                    <%--Tab de Importadores--%>
                    <div role="tabpanel" class="tab-pane" id="tbImportadores">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="ErrorTabImportadores" />
                        </p>

                        <asp:UpdatePanel runat="server" ID="up_Importadores" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="panel-body form-horizontal">
                                    <asp:LinkButton runat="server" ID="lkBtn_AgregarImportador" CssClass="btn btn-primary"><i aria-hidden="true" class="glyphicon glyphicon-pencil"></i>Agregar Importador</asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="lkBtn_PanelImpo"></asp:LinkButton>

                                    <cc1:ModalPopupExtender ID="lkBtn_AgregarImportador_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackgroupd"
                                        BehaviorID="lkBtn_AgregarImportador_ModalPopupExtender" PopupControlID="pnl_Importador" TargetControlID="lkBtn_AgregarImportador" CancelControlID="btnHide">
                                    </cc1:ModalPopupExtender>

                                    <cc1:ModalPopupExtender ID="lkBtn_PanelImpo_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackgroupd"
                                        BehaviorID="lkBtn_PanelImpo_ModalPopupExtender" PopupControlID="pnl_Importador" TargetControlID="lkBtn_PanelImpo">
                                    </cc1:ModalPopupExtender>
                                </div>

                                <asp:GridView runat="server" ID="gvImportadores"
                                    CssClass="table table-hover table-striped"
                                    GridLines="None"
                                    EmptyDataText="No se han agregado importadores."
                                    AutoGenerateColumns="false" OnRowCommand="gvImportadores_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="corr_BorradorImportador" SortExpression="corr_BorradorImportador" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                        <asp:BoundField DataField="razon_social" HeaderText="Razon Social" />
                                        <asp:BoundField DataField="correo" HeaderText="Correo" />
                                        <asp:BoundField DataField="telefono" HeaderText="Telefono" />
                                        <asp:ButtonField ButtonType="Button" Text="Modificar" HeaderText="Modificar" CommandName="ModificarImportador" ControlStyle-CssClass="btn btn-success" />

                                        <asp:TemplateField HeaderText="Eliminar">
                                            <ItemTemplate>
                                                <asp:Button Text="Eliminar" runat="server" ID="btnEliminar"
                                                    CausesValidation="false"
                                                    CommandName="EliminarImportador"
                                                    CommandArgument="<%# Container.DataItemIndex %>"
                                                    CssClass="btn btn-danger"
                                                    OnClientClick="return confirm(&quot;¿Esta seguro de borrar opcion seleccionada?&quot;)" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnGuardarImportador" />
                                <asp:AsyncPostBackTrigger ControlID="gvImportadores" EventName="" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <%--Panel Modales--%>
                <div>
                    <%--Panel de documentos Adjuntos--%>
                    <asp:Panel runat="server" ID="pnl_Anexo" CssClass="panel panel-primary" BorderColor="Black" BackColor="White"
                        BorderStyle="Inset" BorderWidth="1px" Style="overflow: auto; max-height: 445px; width: 75%;">

                        <div class="panel-heading">Adjunto de Documentacion</div>
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="ErrorMessage" />
                        </p>


                        <div class="panel-body form-horizontal">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="cbOficioSAT" CssClass="control-label col-xs-2" Text="1. Solicitud de SAT "></asp:Label>
                                <div class="col-xs-3">
                                    <div class="checkbox">
                                        <asp:CheckBox runat="server" ID="cbOficioSAT" Text=" de numero " AutoPostBack="True" OnCheckedChanged="cbOficioSAT_CheckedChanged" />
                                    </div>

                                </div>

                                <%--<asp:Label runat="server" AssociatedControlID="cb_CorrelativoSAT" CssClass="control-label col-xs-2" Text=" de numero  "></asp:Label>--%>
                                <div class="col-xs-3">
                                    <asp:DropDownList runat="server" ID="cb_CorrelativoSAT" CssClass="form-control input-sm">
                                        <asp:ListItem Value="1">OFI-SAT-IAD-DOP-UTO</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-xs-2">
                                    <asp:TextBox runat="server" ID="txtNumeroOficioSAT" CssClass="form-control input-sm" TextMode="Number" />
                                </div>

                                <div class="col-xs-2">
                                    <asp:TextBox runat="server" ID="txtAnioOficioSAT" CssClass="form-control input-sm" TextMode="Number" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtNoReferencia" CssClass="control-label col-xs-2" Text="2. Numero de Referencia del Documento: "></asp:Label>
                                <div class="col-xs-4">
                                    <asp:TextBox ID="txtNoReferencia" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                                </div>

                                <asp:Label runat="server" AssociatedControlID="cboTipoRequisito" CssClass="control-label col-xs-2" Text="3. Tipo de Requisito: "></asp:Label>
                                <div class="col-xs-4">
                                    <asp:DropDownList ID="cboTipoRequisito" runat="server" CssClass="form-control input-sm">
                                    </asp:DropDownList>
                                </div>

                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="FileUpload_Anexo" CssClass="control-label col-xs-2" Text="4. Subir Documento"></asp:Label>
                                <div class="col-xs-10">
                                    <asp:FileUpload ID="FileUpload_Anexo" runat="server" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtObservaciones" CssClass="control-label col-xs-2" Text="5. Observaciones o Comentarios:"></asp:Label>
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtObservaciones" runat="server" TextMode="MultiLine" CssClass="form-control input-sm"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="panel-footer">
                            <asp:Button runat="server" ID="btnGuardarAnexo" CssClass="btn btn-primary" Text="Guardar Documento" CommandName="GuardarAnexo" OnClick="btnGuardarAnexo_Click" />
                            <asp:Button runat="server" ID="btnSalir" CssClass="btn btn-default" Text="Salir" CausesValidation="false" OnClick="btnSalir_Click" />
                        </div>

                    </asp:Panel>

                    <%--Panel datos importador--%>

                    <asp:Panel runat="server" ID="pnl_Importador" CssClass="panel panel-primary" BorderColor="Black" BackColor="White"
                        BorderStyle="Inset" BorderWidth="1px" Style="display: none; overflow: auto; max-height: 445px; width: 75%;">

                        <div class="panel-heading">Datos del Importador</div>
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="ErrorMessageImportaroTab" />
                        </p>

                        <div class="panel-body form-horizontal">
                            <div class="form-group input-sm">

                                <asp:Label Text="Nombre o Razon Social" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtRazonSocialImpoTab" />
                                <div class="col-xs-4">
                                    <asp:TextBox runat="server" ID="txtRazonSocialImpoTab" CssClass="form-control input-sm" />
                                </div>

                                <asp:Label Text="E-Mail" runat="server" AssociatedControlID="txtCorreoImpoTab" CssClass="control-label col-xs-2" />
                                <div class="col-xs-4">
                                    <asp:TextBox runat="server" ID="txtCorreoImpoTab" CssClass="form-control input-sm" />
                                </div>
                            </div>

                            <div class="form-group input-sm">
                                <asp:Label Text="Direccion:" runat="server" AssociatedControlID="txtDireccionImpoTab" CssClass="control-label col-xs-2" />
                                <div class="col-xs-4">
                                    <asp:TextBox runat="server" ID="txtDireccionImpoTab" CssClass="form-control input-sm" />
                                </div>
                                <asp:Label Text="NIT" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtNITImpoTab" />
                                <div class="col-xs-4">
                                    <asp:TextBox runat="server" ID="txtNITImpoTab" CssClass="form-control input-sm" />
                                </div>
                            </div>

                            <div class="form-group input-sm">
                                <asp:Label Text="Telefono" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtTelImpoTab" />
                                <div class="col-xs-4">
                                    <asp:TextBox runat="server" ID="txtTelImpoTab" CssClass="form-control input-sm" />
                                </div>
                            </div>
                        </div>

                        <div class="panel-footer">
                            <asp:Button Text="Guardar Importador" runat="server" ID="btnGuardarImportador" CssClass="btn btn-primary" CommandName="GuardarImportador" OnClick="btnGuardarImportador_Click" />
                            <asp:Button Text="Salir" runat="server" ID="btnSalirImpo" CssClass="btn btn-default" CausesValidation="false" OnClick="btnSalirImpo_Click" />
                        </div>
                    </asp:Panel>
                </div>

            </div>



        </div>
    </div>

</asp:Content>
