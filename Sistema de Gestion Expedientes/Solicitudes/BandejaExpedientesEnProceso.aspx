<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BandejaExpedientesEnProceso.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Solicitudes.BandejaExpedientesEnProceso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading"><%: Title %><asp:Label runat="server" ID="lblCantidadBandeja" CssClass="label label-info" /></div>
        <br />
        <div class="panel-body form-vertical">

            <div>
                <asp:GridView runat="server" ID="gvBandeja"
                    CssClass="table table-hover table-striped"
                    GridLines="None"
                    EmptyDataText="No existen registros."
                    AutoGenerateColumns="false" 
                    AllowPaging="true"
                    OnPageIndexChanging="gvBandeja_PageIndexChanging"
                    OnRowCommand="gvBandeja_RowCommand">

                    <PagerSettings Mode="Numeric"
                        Position="Bottom"
                        PageButtonCount="10" />

                    <PagerStyle BackColor="LightBlue"
                        Height="30px"
                        VerticalAlign="Bottom"
                        HorizontalAlign="Center" />

                    <Columns>
                        <asp:BoundField DataField="id_expediente" HeaderText="#Expediente" SortExpression="id_expediente" />
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
