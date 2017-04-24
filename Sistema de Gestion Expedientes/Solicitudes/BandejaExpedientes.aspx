<%@ Page Title="Bandeja de Expedientes " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BandejaExpedientes.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Solicitudes.BandejaExpedientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading"><%: Title %><asp:Label runat="server" ID="lblCantidadBandeja" CssClass="label label-info"/></div>
        <br />
        <div class="panel-body form-vertical">

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
                        <asp:BoundField DataField="razonSocialExportador" HeaderText="Exportador" />
                        <asp:BoundField DataField="fecha_creacion" HeaderText="Fecha Creacion" />
                        <asp:BoundField DataField="fecha_modificacion" HeaderText="Fecha Modificacion" />

                        <asp:ButtonField ButtonType="Button" Text="Asignar" HeaderText="Asignar" CommandName="Asignar" ControlStyle-CssClass="btn btn-success" />                        
                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
