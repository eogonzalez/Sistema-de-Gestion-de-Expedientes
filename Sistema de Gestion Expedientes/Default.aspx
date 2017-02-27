<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sistema_de_Gestion_Expedientes._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Unidad de Origen</h1>
        <p class="lead">Fue creada a través del surgimiento de la administración de los Acuerdos Comerciales Internacionales, para dar cumplimiento en lo referente a lo que se establece en los capítulos de Reglas de Origen y Procedimientos Aduaneros de cada tratado o acuerdo comercial.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-large">Más acerca de Origen &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Verificaciones de Origen</h2>
            <p>
                Es el procedimiento realizado por la autoridad competente, para verificar que las mercancías que se importaron aplicando una preferencia arancelaria, 
                de conformidad con los diversos tratados comerciales firmados por Guatemala, cumplan con los requisitos (Reglas de Origen) específicos establecidos en dichos acuerdos.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Más información.. &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Opiniones Técnicas</h2>
            <p>
                Informe legal acerca de una situación dada en el proceso de aplicación de las preferencias arancelarias a las mercancías que otorgan los tratados de libre Comercio.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Más información.. &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Otros Servicios</h2>
            <p>
                Usted podra tambien, generar solicitudes electronicas de Certificados de Origen tales como (Taiwan, Union Europea).
                Solicitudes de Resoluciones anticipadas.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Más información..&raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
