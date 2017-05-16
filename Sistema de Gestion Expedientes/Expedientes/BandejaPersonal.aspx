<%@ Page Title="Bandeja de Trabajo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BandejaPersonal.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Expedientes.BandejaPersonal" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-primary">
        <div class="panel-heading"><%: Title %><asp:Label runat="server" ID="lblCantidadBandeja" CssClass="label label-info" /></div>

        <div class="panel-body form-horizontal">
            <h3><span class="label label-primary">Busqueda de expediente</span></h3>

            <div class="form-group input-sm">
                <asp:Label CssClass="control-label col-xs-2" runat="server" Text="Tipo de Solicitud:" AssociatedControlID="cbo_TipoSolicitud"></asp:Label>
                <div class="col-xs-2">
                    <asp:DropDownList ID="cbo_TipoSolicitud" runat="server" CssClass="form-control input-sm">
                        <asp:ListItem Value="VO">Verificacion de Origen</asp:ListItem>
                        <asp:ListItem Value="OT">Opinion Tecnica</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Label ID="lblPeriodo" AssociatedControlID="txtFechaInicial" CssClass="control-label col-xs-2" runat="server" Text="Periodo: De:"></asp:Label>
                <div class="col-xs-2">
                    <asp:TextBox ID="txtFechaInicial" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtFechaInicial_CalendarExtender" runat="server" BehaviorID="txtFechaInicial_CalendarExtender" TargetControlID="txtFechaInicial" Format="dd/MM/yyyy" />
                </div>
                <asp:Label ID="lblFechaFin" AssociatedControlID="txtFechaFinal" CssClass="control-label col-xs-2" runat="server" Text=" A:"></asp:Label>
                <div class="col-xs-2">
                    <asp:TextBox ID="txtFechaFinal" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtFechaFinal_CalendarExtender" runat="server" BehaviorID="txtFechaFinal_CalendarExtender" TargetControlID="txtFechaFinal" Format="dd/MM/yyyy" />
                </div>

            </div>

            <div class="form-group input-sm">
                <asp:Label CssClass="control-label col-xs-2" Text="Numero de Expediente:" runat="server" AssociatedControlID="txtNoExpediente" />
                <div class="col-xs-4">
                    <asp:TextBox ID="txtNoExpediente" runat="server" CssClass="form-control input-sm" />
                </div>

                <asp:Label CssClass="control-label col-xs-2" Text="Estado:" runat="server" AssociatedControlID0="cbo_estado" />
                <div class="col-xs-4">
                    <asp:DropDownList ID="cbo_estado" runat="server" CssClass="form-control input-sm">
                        <asp:ListItem Value="Revisado">Revisado</asp:ListItem>
                        <asp:ListItem Value="Resolucion_Inicial">Resolucion Inicial</asp:ListItem>
                        <asp:ListItem Value="Notificacion">Notificacion</asp:ListItem>
                        <asp:ListItem Value="Completar">Completar</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group input-sm">
                <asp:Label CssClass="control-label col-xs-2" Text="Solicitante:" runat="server" AssociatedControlID="ddl_solicitante" />
                <div class="col-xs-4">
                    <asp:DropDownList ID="ddl_solicitante" runat="server" CssClass="form-control input-sm">
                    </asp:DropDownList>
                </div>
                <asp:Label CssClass="control-label col-xs-2" Text="Exportador" runat="server" />
                <div class="col-xs-4">
                    <asp:TextBox ID="txtExportador" runat="server" CssClass="form-control input-sm" />
                </div>

            </div>

            <div class="text-center">
                <div class="btn-group">
                    <asp:LinkButton ID="lkBtn_Buscar" runat="server" CssClass="btn btn-primary"> <i aria-hidden="true" class="glyphicon glyphicon-search"></i> Buscar </asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-success"> <i aria-hidden="true" class="glyphicon glyphicon-trash"></i> Limpiar </asp:LinkButton>
                </div>

            </div>


            <div>
                <p class="text-success">
                    <asp:Literal runat="server" ID="MensajeCorrecto" />
                </p>
                <p class="text-danger">
                    <asp:Literal runat="server" ID="ErrorMensaje" />
                </p>
            </div>
            <h3><span class="label label-primary">Seleccion de expediente</span></h3>
            <div class="btn-group pull-right" role="group">
                <asp:LinkButton ID="lkBtn_revisar" runat="server" CssClass="btn btn-primary" OnClick="lkBtn_revisar_Click"> <i aria-hidden="true" class="glyphicon glyphicon-folder-open"></i> Revisar Expediente </asp:LinkButton>
                <asp:LinkButton ID="lkBtn_res_inicial" runat="server" CssClass="btn btn-success" OnClick="lkBtn_res_inicial_Click"> <i aria-hidden="true" class="glyphicon glyphicon-list-alt"></i> Resolucion Inicial </asp:LinkButton>
                <asp:LinkButton ID="lkBtn_notificar" runat="server" CssClass="btn btn-info" OnClick="lkBtn_notificar_Click"> <i aria-hidden="true" class="glyphicon glyphicon-send"></i> Notificar </asp:LinkButton>
                <asp:LinkButton ID="lkBtn_complemento" runat="server" CssClass="btn btn-warning" OnClick="lkBtn_complemento_Click"> <i aria-hidden="true" class="glyphicon glyphicon-book"></i> Completar </asp:LinkButton>
                <asp:LinkButton ID="lkBtn_salir_bandeja" runat="server" CssClass="btn btn-danger" OnClick="lkBtn_salir_bandeja_Click"> <i aria-hidden="true" class="glyphicon glyphicon-share"></i> Salir </asp:LinkButton>
            </div>

            <div>
                <asp:GridView runat="server" ID="gvBandeja"
                    CssClass="table table-hover table-striped"
                    GridLines="None"
                    EmptyDataText="No existen registros."
                    AutoGenerateColumns="false">

                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:RadioButton ID="rb_expediente" runat="server" OnClick="javascript:SelectSingleRadiobutton(this.id)" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="sigla_estado" HeaderText="Estado" />
                        <asp:BoundField DataField="id_expediente" HeaderText="#Expediente" SortExpression="id_expediente" />
                        <asp:BoundField DataField="cmd" HeaderText="cmd" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                        <asp:BoundField DataField="id_Solicitud" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                        <asp:BoundField DataField="idWF_Expediente" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                        <asp:BoundField DataField="estado_principal" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                        <asp:BoundField DataField="tipoSolicitud" HeaderText="Tipo de Solicitud" />
                        <asp:BoundField DataField="razonSocialImportador" HeaderText="Importador" />
                        <asp:BoundField DataField="razonSocialExportador" HeaderText="Exportador" />
                        <asp:BoundField DataField="nombres" HeaderText="Solicitante" />
                        <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha Ingreso" />
                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
