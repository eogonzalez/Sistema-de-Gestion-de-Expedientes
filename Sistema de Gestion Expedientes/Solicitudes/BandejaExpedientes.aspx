<%@ Page Title="Bandeja de Expedientes " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BandejaExpedientes.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Solicitudes.BandejaExpedientes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading"><%: Title %><asp:Label runat="server" ID="lblCantidadBandeja" CssClass="label label-info" /></div>
        <br />
        <asp:LinkButton runat="server" ID="lkBtn_Hidden_Autorizar" Style="display: hidden"></asp:LinkButton>
        <cc1:ModalPopupExtender ID="lkBtn_Autorizar_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
            BehaviorID="lkBtn_Autorizar_ModalPopupExtender" PopupControlID="pnl_nuevo" TargetControlID="lkBtn_Hidden_Autorizar">
        </cc1:ModalPopupExtender>

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
                        <asp:BoundField DataField="razonSocialExportador" HeaderText="Exportador" />
                        <asp:BoundField DataField="fecha_creacion" HeaderText="Fecha Creacion" />
                        <asp:BoundField DataField="fecha_modificacion" HeaderText="Fecha Modificacion" />

                        <asp:ButtonField ButtonType="Button" Text="Auto Asignar" HeaderText="Asignar" CommandName="Asignar" ControlStyle-CssClass="btn btn-success" />
                        <asp:ButtonField ButtonType="Button" Text="Asignar Funcionario" HeaderText="AsignarFuncionario" CommandName="AsignarFuncionario" ControlStyle-CssClass="btn btn-info" />
                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </div>


    <asp:Panel runat="server" ID="pnl_nuevo" CssClass="panel panel-primary" BorderColor="Black" BackColor="White"
        BorderStyle="Inset" BorderWidth="1px" heigth="600" Width="35%">
        <div class="panel-heading">Mantenimiento de <%:Title%>.</div>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessagePanel" />
        </p>
        <div class="panel-body form-horizontal">

            <p class="alert alert-info">
                ¡Atento! Usted esta realizando una asignacion de expediente                    
                Seleccione el usuario que desea asignarle, en el siguiente listado.
            </p>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddlUsuarioDACE" CssClass="control-label col-xs-2" Text="Usuario DACE: "></asp:Label>
                <div class="col-xs-10">
                    <asp:DropDownList runat="server" ID="ddlUsuarioDACE" CssClass="form-control">
                    </asp:DropDownList>
                </div>
            </div>


            <div class="panel-footer">
                <asp:Button runat="server" ID="btnAsignar" CssClass="btn btn-success" Text="Asignar" OnClientClick="return confirm(&quot;¿Esta seguro de asigar el usuario seleccionado?&quot;)" OnClick="btnAsignar_Click" />
                <asp:Button runat="server" ID="btnSalir" CssClass="btn btn-default" Text="Salir" CausesValidation="false" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
