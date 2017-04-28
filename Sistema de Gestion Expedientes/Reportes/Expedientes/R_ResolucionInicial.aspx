<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="R_ResolucionInicial.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes.Reportes.Expedientes.R_ResolucionInicial" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="720px" Height="547px"></rsweb:ReportViewer>
    </div>
    
</asp:Content>
