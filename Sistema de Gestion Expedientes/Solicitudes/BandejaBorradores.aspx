<%@ Page Title="Bandeja de Borradores de Solicitudes " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BandejaBorradores.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Solicitudes.BandejaBorradores" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading"><%: Title %><asp:Label runat="server" ID="lblCantidadBandeja" CssClass="label label-info" /></div>
        <br />
        <div class="panel-body form-vertical">
            <div class="btn-group" role="group">
                <%--<asp:LinkButton runat="server" ID="lkBtn_nuevo" CssClass="btn btn-primary"><i aria-hidden="true" class="glyphicon glyphicon-pencil"></i> Nuevo </asp:LinkButton>--%>
                <%--                <asp:LinkButton runat="server" ID="lkBtn_viewPanel"></asp:LinkButton>

                <cc1:ModalPopupExtender ID="lkBtn_nuevo_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                    BehaviorID="lkBtn_nuevo_ModalPopupExtender" PopupControlID="pnl_nuevo" TargetControlID="lkBtn_nuevo" CancelControlID="btnHide">
                </cc1:ModalPopupExtender>


                <cc1:ModalPopupExtender ID="lkBtn_viewPanel_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                    BehaviorID="lkBtn_viewPanel_ModalPopupExtender" PopupControlID="pnl_nuevo" TargetControlID="lkBtn_viewPanel">
                </cc1:ModalPopupExtender>--%>
            </div>
            <br />
            <div id="divAlertError" runat="server">
                <p class="alert alert-danger" id="pAlertError" runat="server">
                    <asp:Literal runat="server" ID="ErrorMessagePrincipal" />
                </p>
            </div>
            <div>
                <asp:GridView runat="server" ID="gvBorradores"
                    CssClass="table table-hover table-striped"
                    GridLines="None"
                    EmptyDataText="No existen registros."
                    AllowPaging="true"
                    AutoGenerateColumns="false" 
                    OnPageIndexChanging="gvBorradores_PageIndexChanging"
                    OnRowCommand="gvBorradores_RowCommand">

                    <PagerSettings Mode="Numeric"
                        Position="Bottom"
                        PageButtonCount="10" />

                    <PagerStyle BackColor="LightBlue"
                        Height="30px"
                        VerticalAlign="Bottom"
                        HorizontalAlign="Center" />

                    <Columns>
                        <asp:BoundField DataField="id_Solicitud" SortExpression="id_Solicitud" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                        <asp:BoundField DataField="cmd" HeaderText="cmd" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                        <asp:BoundField DataField="tipoSolicitud" HeaderText="Tipo de Solicitud" />
                        <asp:BoundField DataField="razonSocialImportador" HeaderText="Importador" />
                        <%--<asp:BoundField DataField="correoImportador" HeaderText="Correo Importador" />--%>
                        <asp:BoundField DataField="razonSocialExportador" HeaderText="Exportador" />
                        <asp:BoundField DataField="pais" HeaderText="Pais" />
                        <%--<asp:BoundField DataField="correoExportador" HeaderText="Correo Exportador" />--%>
                        <asp:BoundField DataField="fecha_creacion" HeaderText="Fecha Creacion" />
                        <asp:BoundField DataField="fecha_modificacion" HeaderText="Fecha Modificacion" />
                        <asp:BoundField DataField="descripcion_estado" HeaderText="Estado" />
                        <asp:BoundField DataField="estado" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                        <asp:ButtonField ButtonType="Button" Text="Modificar" HeaderText="Modificar" CommandName="modificar" ControlStyle-CssClass="btn btn-success" />

                        <asp:TemplateField HeaderText="Eliminar">
                            <ItemTemplate>
                                <asp:Button Text="Eliminar" runat="server" ID="btnEliminar" CausesValidation="false" CommandName="eliminar" CommandArgument="<%# Container.DataItemIndex %>" CssClass="btn btn-danger" OnClientClick="return confirm(&quot;¿Esta seguro de borrar opcion seleccionada?&quot;)" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
