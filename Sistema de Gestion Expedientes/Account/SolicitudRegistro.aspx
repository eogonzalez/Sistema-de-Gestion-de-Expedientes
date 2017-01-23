<%@ Page Title="Solicitudes de Registro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SolicitudRegistro.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Account.SolicitudRegistro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading"><%: Title %></div>
        <br />
        <div class="panel-body form-vertical">
            
            <div>
                <asp:GridView runat="server" ID="gvSolicitudRegistro"
                    CssClass="table table-hover table-striped"
                    GridLines="None"
                    EmptyDataText="No existen solicitudes de registro."
                    AutoGenerateColumns="false">

                    <columns>
                        <asp:BoundField DataField="id_usuario" SortExpression="id_usuario">
                            <HeaderStyle CssClass="display:none" />
                            <ItemStyle CssClass="display:none" />
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="nombres" HeaderText="Nombre" />
                        <asp:BoundField DataField="apellidos" HeaderText="Apellido" />
                        <asp:BoundField DataField="cui" HeaderText="CUI" />
                        <asp:BoundField DataField="correo" HeaderText="Correo" />
                        <asp:BoundField DataField="fecha_registro" HeaderText="Fecha Registro" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:Button ID="btnAutorizar" runat="server"
                                    CommandName="autorizar"
                                    CommandArgument="<%#((GridViewRow)Container).RowIndex %>"
                                    Text="Autorizar"  CssClass="btn btn-success"/>
                                <asp:Button ID="btnDenegar" runat="server"
                                    CommandName="denegar"
                                    CommandArgument="<%#((GridViewRow)Container).RowIndex %>"
                                    Text="Denegar"  CssClass="btn btn-danger"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </columns>                   

                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
