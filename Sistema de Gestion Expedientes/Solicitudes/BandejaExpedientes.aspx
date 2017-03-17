<%@ Page Title="Bandeja de Expedientes " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BandejaExpedientes.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Solicitudes.BandejaExpedientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading"><%: Title %><asp:Label runat="server" ID="lblCantidadBandeja" CssClass="label label-info"/></div>
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
            <div>
                <asp:GridView runat="server" ID="gvBandeja"
                    CssClass="table table-hover table-striped"
                    GridLines="None"
                    EmptyDataText="No existen registros."
                    AutoGenerateColumns="false" OnRowCommand="gvBandeja_RowCommand">

                    <Columns>
                        <asp:BoundField DataField="id_expediente" HeaderText="#Expediente" SortExpression="id_expediente"  />                        
                        <asp:BoundField DataField="cmd" HeaderText="cmd" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                        <asp:BoundField DataField="id_Solicitud" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                        <asp:BoundField DataField="nombres" HeaderText="Usuario" />
                        <asp:BoundField DataField="tipoSolicitud" HeaderText="Tipo de Solicitud" />
                        <asp:BoundField DataField="razonSocialImportador" HeaderText="Importador" />
                        <%--<asp:BoundField DataField="correoImportador" HeaderText="Correo Importador" />--%>
                        <asp:BoundField DataField="razonSocialExportador" HeaderText="Exportador" />
                        <%--<asp:BoundField DataField="pais" HeaderText="Pais" />--%>
                        <%--<asp:BoundField DataField="correoExportador" HeaderText="Correo Exportador" />--%>
                        <asp:BoundField DataField="fecha_creacion" HeaderText="Fecha Creacion" />
                        <asp:BoundField DataField="fecha_modificacion" HeaderText="Fecha Modificacion" />

                        <asp:ButtonField ButtonType="Button" Text="Revisar" HeaderText="Revisar" CommandName="revisar" ControlStyle-CssClass="btn btn-success" />
                        <asp:ButtonField ButtonType="Button" Text="Aclarar" HeaderText="Aclarar" CommandName="aclarar" ControlStyle-CssClass="btn btn-info" />
                        <asp:ButtonField ButtonType="Button" Text="Aprobar" HeaderText="Aprobar" CommandName="aprobar" ControlStyle-CssClass="btn btn-primary" />
                        
                        <asp:TemplateField HeaderText="Rechazar">
                            <ItemTemplate>
                                <asp:Button Text="Rechazar" runat="server" ID="btnRechazar" CausesValidation="false" CommandName="rechazar" CommandArgument="<%# Container.DataItemIndex %>" CssClass="btn btn-danger" OnClientClick="return confirm(&quot;¿Esta seguro de rechazar opcion seleccionada?&quot;)" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
