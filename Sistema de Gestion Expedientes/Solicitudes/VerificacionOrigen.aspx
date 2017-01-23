<%@ Page Title="Verificacion de Origen" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerificacionOrigen.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Solicitudes.VerificacionOrigen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="panel panel-primary">
        <div class="panel-heading">Formulario <%:Title %> </div>
        <div class="panel-body form-horizontal">

            <h4><span class="label label-primary">Datos de Identificacion del Solicitante</span></h4>

            <div class="form-group">
                <asp:Label CssClass="control-label col-xs-2" runat="server" Text="Nombres:" AssociatedControlID="txtNombre"></asp:Label>
                <div class="col-xs-4">
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control"></asp:TextBox>
                </div>

                <asp:Label CssClass="control-label col-xs-2" runat="server" Text="Apellidos:" AssociatedControlID="txtApellido"></asp:Label>
                <div class="col-xs-4">
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" CssClass="control-label col-xs-2" Text="Direccion:" AssociatedControlID="txtDireccion"></asp:Label>
                <div class="col-xs-10">
                    <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" CssClass="control-label col-xs-2" Text="Departamento:" AssociatedControlID="cboDepartamento"></asp:Label>
                <div class="col-xs-2">
                    <asp:DropDownList runat="server" ID="cboDepartamento" CssClass="form-control"></asp:DropDownList>
                </div>

                <asp:Label Text="E-Mail" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtCorreo" />
                <div class="col-xs-2">
                    <asp:TextBox runat="server" ID="txtCorreo" CssClass="form-control" />
                </div>

                <asp:Label Text="Telefono:" runat="server" AssociatedControlID="txtTelefono" CssClass="control-label col-xs-2" />
                <div class="col-xs-2">
                    <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" />
                </div>
            </div>

            <h4><span class="label label-primary">Datos de Identificacion del Importador</span></h4>

            <div class="form-group">
                <asp:Label Text="Nombre o Razon Social" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtRazonSocialImpo" />
                <div class="col-xs-10">
                    <asp:TextBox runat="server" ID="txtRazonSocialImpo" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label Text="Direccion:" runat="server" AssociatedControlID="txtDireccionImpo" CssClass="control-label col-xs-2" />
                <div class="col-xs-10">
                    <asp:TextBox runat="server" ID="txtDireccionImpo" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label Text="E-Mail" runat="server" AssociatedControlID="txtCorreoImpo" CssClass="control-label col-xs-2" />
                <div class="col-xs-10">
                    <asp:TextBox runat="server" ID="txtCorreoImpo" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label Text="Departamento" runat="server" AssociatedControlID="cboDeptoImpo" CssClass="control-label col-xs-2" />
                <div class="col-xs-2">
                    <asp:DropDownList runat="server" ID="cboDeptoImpo" CssClass="form-control">
                    </asp:DropDownList>
                </div>

                <asp:Label Text="NIT" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtNITImpo" />
                <div class="col-xs-2">
                    <asp:TextBox runat="server" ID="txtNITImpo" CssClass="form-control" />
                </div>

                <asp:Label Text="Telefono" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtTelImpo" />
                <div class="col-xs-2">
                    <asp:TextBox runat="server" ID="txtTelImpo" CssClass="form-control" />
                </div>
            </div>

            <h4><span class="label label-primary">Datos de Identificacion del Exportador</span></h4>

            <div class="form-group">
                <asp:Label Text="Nombre o Razon Social" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtRazonSocialImpo" />
                <div class="col-xs-10">
                    <asp:TextBox runat="server" ID="txtRazonSocialExpo" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label Text="Direccion:" runat="server" AssociatedControlID="txtDireccionExpo" CssClass="control-label col-xs-2" />
                <div class="col-xs-10">
                    <asp:TextBox runat="server" ID="txtDireccionExpo" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label Text="E-Mail" runat="server" AssociatedControlID="txtCorreoExpo" CssClass="control-label col-xs-2" />
                <div class="col-xs-10">
                    <asp:TextBox runat="server" ID="txtCorreoExpo" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label Text="Departamento" runat="server" AssociatedControlID="cboPaisExpo" CssClass="control-label col-xs-2" />
                <div class="col-xs-2">
                    <asp:DropDownList runat="server" ID="cboPaisExpo" CssClass="form-control">
                    </asp:DropDownList>
                </div>

                <asp:Label Text="NIT" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtNITExpo" />
                <div class="col-xs-2">
                    <asp:TextBox runat="server" ID="txtNITExpo" CssClass="form-control" />
                </div>

                <asp:Label Text="Telefono" runat="server" CssClass="control-label col-xs-2" AssociatedControlID="txtTelExpo" />
                <div class="col-xs-2">
                    <asp:TextBox runat="server" ID="txtTelExpo" CssClass="form-control" />
                </div>
            </div>

            <ul class="nav nav-tabs nav-justified">
                <li role="presentation" class="active"><a href="#">Motivo de Solicitud</a></li>
                <li role="presentation"><a href="#">Documentacion Anexa</a></li>
                <li role="presentation"><a href="#">Datos del Producto Importado</a></li>
            </ul>

            <div class="panel-footer">
                <asp:Button Text="Guardar" id="btnGuardar" runat="server" CssClass="btn btn-primary"/>
                <asp:Button Text="Enviar Solicitud" id="btnEnviar" runat="server" CssClass="btn btn-success"/>
                <asp:Button Text="Cancelar" id="btnCancelar" runat="server" CssClass="btn btn-danger"/>
            </div>

        </div>
    </div>

</asp:Content>
