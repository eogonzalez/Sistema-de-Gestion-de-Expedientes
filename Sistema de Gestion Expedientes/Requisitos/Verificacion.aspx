<%@ Page Title="Requisitos de Verificacion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Verificacion.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Requisitos.Verificacion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading"><%: Title %></div>
        <br />
        <div class="panel-body form-vertical">
            <div class="btn-group" role="group">
                <asp:LinkButton runat="server" ID="lkBtn_nuevo" CssClass="btn btn-primary"><i aria-hidden="true" class="glyphicon glyphicon-pencil"></i> Nuevo </asp:LinkButton>
                <%--<asp:LinkButton runat="server" ID="lkBtn_Hidden_nuevo" Style="display: hidden"></asp:LinkButton>--%>

                <cc1:modalpopupextender id="lkBtn_nuevo_ModalPopupExtender" runat="server" backgroundcssclass="modalBackground"
                    behaviorid="lkBtn_nuevo_ModalPopupExtender" popupcontrolid="pnl_nuevo" targetcontrolid="lkBtn_nuevo" cancelcontrolid="btnHide">
                </cc1:modalpopupextender>
            </div>
            <br />
            <div>
                <asp:GridView runat="server" ID="gvRequisitosVerificacion"
                    CssClass="table table-hover table-striped"
                    GridLines="None"
                    EmptyDataText="No existen registros."
                    AutoGenerateColumns="false">

                    <Columns>
                        <asp:BoundField DataField="idRequisito" SortExpression="idDepartamento">
                            <HeaderStyle CssClass="display:none" />
                            <ItemStyle CssClass="display:none" />
                        </asp:BoundField>


                        <asp:BoundField DataField="nombre" HeaderText="Departamento" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />

                        <asp:ButtonField ButtonType="Button" Text="Modificar" HeaderText="Modificar" CommandName="modificar" ControlStyle-CssClass="btn btn-success" />
                        <asp:ButtonField ButtonType="Button" Text="Eliminar" HeaderText="Eliminar" CommandName="eliminar" ControlStyle-CssClass="btn btn-danger" />

                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </div>

    <div>
        <asp:Panel runat="server" ID="pnl_nuevo" CssClass="panel panel-primary" BorderColor="Black" BackColor="White"
            BorderStyle="Inset" BorderWidth="1px" heigth="600" Width="35%">
            <div class="panel-heading">Mantenimiento de <%:Title%>.</div>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <div class="panel-body form-horizontal">


                <div class="form-group">
                    <asp:Label AssociatedControlID="txtNombre" CssClass="control-label col-xs-2" runat="server" Text="Requisito: "></asp:Label>
                    <div class="col-xs-10">
                        <asp:TextBox ID="txtNombre" type="text" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombre"
                            CssClass="text-danger" ErrorMessage="El campo no puede quedar vacio." />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label AssociatedControlID="txtDescripcionOpcion" CssClass="control-label col-xs-2" runat="server" Text="Descripcion:"></asp:Label>
                    <div class="col-xs-10">
                        <asp:TextBox ID="txtDescripcionOpcion" type="text" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label3" CssClass="control-label col-xs-2" runat="server" Text="Obligatorio:"></asp:Label>
                    <div class="col-xs-10">
                        <asp:CheckBox ID="cb_obligatorio" runat="server" />
                    </div>
                </div>

                <div class="panel-footer">
                    <asp:Button runat="server" ID="btnGuardar" CssClass="btn btn-primary" Text="Guardar" OnClick="btnGuardar_Click" />
                    <asp:Button runat="server" ID="btnSalir" CssClass="btn btn-default" Text="Salir" CausesValidation="false" />
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
