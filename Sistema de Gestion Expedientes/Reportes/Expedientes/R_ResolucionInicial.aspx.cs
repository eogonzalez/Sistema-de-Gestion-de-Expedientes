using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Negocio.Reportes.Expedientes;
using Microsoft.Reporting.WebForms;

namespace Sistema_de_Gestion_Expedientes.Reportes.Expedientes
{
    public partial class R_ResolucionInicial : System.Web.UI.Page
    {
        CNR_Expedientes objCNR_Expedientes = new CNR_Expedientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var dsp = new DataSet();
                int id_expediente = 3;
                dsp = objCNR_Expedientes.SelectResolucionInicial(id_expediente);
                dsp.Tables[0].TableName = "SelectDatosResolucionInicial";

                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource Repo = new ReportDataSource("SelectDatosResolucionInicial", dsp.Tables[0]);
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("rpt_resolucion_inicial.rdlc");
                ReportViewer1.LocalReport.DataSources.Add(Repo);
                ReportViewer1.LocalReport.Refresh();
                
            }
        }
    }
}