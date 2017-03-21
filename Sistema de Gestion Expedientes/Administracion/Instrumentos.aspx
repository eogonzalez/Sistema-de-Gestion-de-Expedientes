<%@ Page Title="Instrumentos Comerciales" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Instrumentos.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Administracion.Instrumentos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading"><%: Title %></div>
        <br />
        <div class="panel-body form-vertical">
            <div class="btn">
                <asp:LinkButton runat="server" ID="lkBtn_nuevo" CssClass="btn btn-primary"><i aria-hidden="true" class="glyphicon glyphicon-pencil"></i> Nuevo </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lkBtn_viewPanel"></asp:LinkButton>

                <cc1:ModalPopupExtender ID="lkBtn_nuevo_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                    BehaviorID="lkBtn_nuevo_ModalPopupExtender" PopupControlID="pnl_nuevo" TargetControlID="lkBtn_nuevo" CancelControlID="btnHide">
                </cc1:ModalPopupExtender>


                <cc1:ModalPopupExtender ID="lkBtn_viewPanel_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                    BehaviorID="lkBtn_viewPanel_ModalPopupExtender" PopupControlID="pnl_nuevo" TargetControlID="lkBtn_viewPanel">
                </cc1:ModalPopupExtender>

            </div>
            <br />
            <div>
                <asp:GridView runat="server" ID="gvInstrumentos"
                    CssClass="table table-hover table-striped"
                    GridLines="None"
                    EmptyDataText="No existen registros."
                    AutoGenerateColumns="false" OnRowCommand="gvInstrumentos_RowCommand">

                    <Columns>
                        <asp:BoundField DataField="id_Instrumento" SortExpression="id_Instrumento" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                        <asp:BoundField DataField="nombre_instrumento" HeaderText="Nombre" />
                        <asp:BoundField DataField="fecha_vigencia" HeaderText="Fecha Vigencia" />
                        

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

    <div>
        <asp:Panel runat="server" ID="pnl_nuevo" CssClass="panel panel-primary" BorderColor="Black" BackColor="White"
            BorderStyle="Inset" BorderWidth="1px" Style="overflow: auto; max-height: 545px; width: 65%;">
            <div class="panel-heading">Mantenimiento de <%:Title%>.</div>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>

                    <div class="panel-body form-horizontal">

                        <div class="form-group">
                            <asp:Label AssociatedControlID="txtNombre" CssClass="control-label col-xs-2" runat="server" Text="Nombre: "></asp:Label>
                            <div class="col-xs-10">
                                <asp:TextBox ID="txtNombre" type="text" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombre"
                                    CssClass="text-danger" ErrorMessage="El campo no puede quedar vacio." />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label AssociatedControlID="txtSigla" CssClass="control-label col-xs-2" runat="server" Text="Sigla: "></asp:Label>
                            <div class="col-xs-10">
                                <asp:TextBox ID="txtSigla" type="text" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSigla"
                                    CssClass="text-danger" ErrorMessage="El campo no puede quedar vacio." />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label AssociatedControlID="txtObservaciones" CssClass="control-label col-xs-2" runat="server" Text="Observaciones:"></asp:Label>
                            <div class="col-xs-10">
                                <asp:TextBox ID="txtObservaciones" type="text" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        
                <div class="form-group">
                    <asp:Label ID="Label11" AssociatedControlID="txtFechaVigencia" CssClass="control-label col-xs-2" runat="server" Text="Fecha Vigencia:"></asp:Label>
                    <div class="col-xs-10">
                        <asp:TextBox ID="txtFechaVigencia" CssClass="form-control" runat="server"></asp:TextBox>                        
                        
                        <cc1:CalendarExtender ID="txtFechaVigencia_CalendarExtender" runat="server" BehaviorID="txtFechaVigencia_CalendarExtender" TargetControlID="txtFechaVigencia" />
                        
                    </div>
                </div>
                    </div>

                    <div class="panel-footer">
                        <asp:Button runat="server" ID="btnGuardar" CssClass="btn btn-primary" Text="Guardar" CommandName="Guardar" OnClick="btnGuardar_Click" />
                        <asp:Button runat="server" ID="btnSalir" CssClass="btn btn-default" Text="Salir" CausesValidation="false" OnClick="btnSalir_Click" />
                    </div>

                
        </asp:Panel>
    </div>
</asp:Content>
