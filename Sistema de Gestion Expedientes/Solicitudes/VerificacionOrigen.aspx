﻿<%@ Page Title="Verificacion de Origen" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerificacionOrigen.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Solicitudes.VerificacionOrigen" %>

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


                    <asp:Label Text="NIT" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtNITExpo" />
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
                <p class="alert alert-success">
                    <asp:Literal runat="server" ID="MensajeCorrectoPrincipal" />
                </p>
                <p class="alert alert-danger">
                    <asp:Literal runat="server" ID="ErrorMessagePrincipal" />
                </p>
                <div class="text-center">
                    <div class="btn-group">
                        <asp:Button Text="Guardar Datos de Identificacion " ID="btnGuardar" runat="server" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                        <asp:Button Text="Enviar Solicitud" ID="btnEnviar" runat="server" CssClass="btn btn-success" OnClick="btnEnviar_Click" />
                        <asp:Button Text="Salir" ID="btnCancelar" runat="server" CssClass="btn btn-info" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </div>

            <div class="thumbnail">

                <ul class="nav nav-tabs nav-justified">
                    <li role="presentation" class="active"><a href="#tbMotivo" aria-controls="tbMotivo" data-toggle="tab">Motivo de Solicitud</a></li>
                    <li role="presentation"><a href="#tbAnexos" aria-controls="tbAnexos" data-toggle="tab">Documentacion Anexa</a></li>
                    <li role="presentation"><a href="#tbProductos" aria-controls="tbProductos" data-toggle="tab">Datos del Producto Importado</a></li>
                </ul>

                <%--Contenido de los paneles--%>

                <div class="tab-content">
                    <%--Panel de Motivo--%>
                    <div role="tabpanel" class="tab-pane active" id="tbMotivo">
                        <div class="panel-body form-horizontal">
                            <div class="form-group input-sm">
                                <asp:Label runat="server" CssClass="control-label col-xs-5 " Text="1. Inclumplimiento de la Regla de Origen:" AssociatedControlID="cb_Uno"></asp:Label>
                                <div class="col-xs-1">
                                    <asp:CheckBox runat="server" ID="cb_Uno" />
                                </div>

                                <asp:Label runat="server" CssClass="control-label col-xs-5" Text="5. Certificado de Origen Apocrifo(falso o alterado):" AssociatedControlID="cb_cinco"></asp:Label>
                                <div class="col-xs-1">
                                    <asp:CheckBox ID="cb_cinco" runat="server" />
                                </div>
                            </div>

                            <div class="form-group input-sm">
                                <asp:Label runat="server" CssClass="control-label col-xs-5 " Text="2. Falla de Marcado Pais de Origen:" AssociatedControlID="cb_Dos"></asp:Label>
                                <div class="col-xs-1">
                                    <asp:CheckBox runat="server" ID="cb_Dos" />
                                </div>

                                <asp:Label runat="server" CssClass="control-label col-xs-5" Text="6. Irregularidades en el Comercio Exterior:" AssociatedControlID="cb_seis"></asp:Label>
                                <div class="col-xs-1">
                                    <asp:CheckBox runat="server" ID="cb_seis" />
                                </div>
                            </div>

                            <div class="form-group input-sm">
                                <asp:Label CssClass="control-label col-xs-5" Text="3. Exportador No Produce la Mercancia:" runat="server" AssociatedControlID="cb_tres" />
                                <div class="col-xs-1">
                                    <asp:CheckBox ID="cb_tres" runat="server" />
                                </div>

                                <asp:Label CssClass="control-label col-xs-5" Text="7. Inconsistencias en Datos del Certificado de Origen:" runat="server" AssociatedControlID="cb_siete" />
                                <div class="col-xs-1">
                                    <asp:CheckBox ID="cb_siete" runat="server" />
                                </div>
                            </div>

                            <div class="form-group input-sm">
                                <asp:Label CssClass="control-label col-xs-5" Text="4. Investigar el Origen:" runat="server" AssociatedControlID="cb_cuatro"></asp:Label>
                                <div class="col-xs-1">
                                    <asp:CheckBox ID="cb_cuatro" runat="server" />
                                </div>


                            </div>

                            <div class="form-group input-sm">
                                <asp:Label CssClass="control-label col-xs-5" Text="Observaciones o Comentarios:" runat="server" AssociatedControlID="cb_ObsMotivo"></asp:Label>
                                <div class="col-xs-1">
                                    <asp:CheckBox ID="cb_ObsMotivo" runat="server" AutoPostBack="True" OnCheckedChanged="cb_ObsMotivo_CheckedChanged" />
                                </div>

                                <asp:Label Text="8. Otras Irregularidades:" runat="server" CssClass="control-label col-xs-5" AssociatedControlID="cb_ocho" />
                                <div class="col-xs-1">
                                    <asp:CheckBox ID="cb_ocho" runat="server" AutoPostBack="True" OnCheckedChanged="cb_ocho_CheckedChanged" />
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

                    <%--Panel de Anexos--%>
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

                    <%--Panel de Productos--%>
                    <div role="tabpanel" class="tab-pane" id="tbProductos">

                        <div class="panel-body form-horizontal">
                            <div class="form-group">
                                <asp:Label AssociatedControlID="cboRegimen_Producto" CssClass="control-label col-xs-2" Text="Regimen de Importacion: " runat="server" />
                                <div class="col-xs-10">
                                    <asp:DropDownList ID="cboRegimen_Producto" CssClass="form-control" runat="server" />
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
                                    <asp:TextBox ID="txtDescripcionFactura_Producto" runat="server" CssClass="form-control" TextMode="MultiLine"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label AssociatedControlID="txtObservaciones_Producto" Text="Observaciones / Comentarios" CssClass="control-label col-xs-2" runat="server" />
                                <div class="col-xs-10">
                                    <asp:TextBox ID="txtObservaciones_Producto" runat="server" CssClass="form-control"  TextMode="MultiLine"/>
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
                            <asp:Button Text="Guardar Producto" ID="btnGuardarProducto" runat="server" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>


                <%--Panel de documentos Adjuntos--%>
                <div>
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



                            <div class="panel-footer">
                                <asp:Button runat="server" ID="btnGuardarAnexo" CssClass="btn btn-primary" Text="Guardar Documento" CommandName="GuardarAnexo" OnClick="btnGuardarAnexo_Click" />
                                <asp:Button runat="server" ID="btnSalir" CssClass="btn btn-default" Text="Salir" CausesValidation="false" OnClick="btnSalir_Click" />
                            </div>
                        </div>



                    </asp:Panel>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
