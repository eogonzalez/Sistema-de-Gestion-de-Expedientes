using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Capa_Negocio.Administracion;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace Sistema_de_Gestion_Expedientes.Reportes.Administracion
{
    public partial class R_SelectPaises : System.Web.UI.Page
    {
        CNPaises objPaises = new CNPaises();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet dsp = new DataSet();
                
                dsp = objPaises.SelectPaises();
                dsp.Tables[0].TableName = "SelectPaises";

                ReportViewer2.LocalReport.DataSources.Clear();
                ReportDataSource Repo = new ReportDataSource("SelectPaises", dsp.Tables[0]);
                ReportViewer2.LocalReport.ReportPath = Server.MapPath("RPaises.rdlc");
                ReportViewer2.LocalReport.DataSources.Add(Repo);
                ReportViewer2.LocalReport.Refresh();
                
            }
            
        }


    }
}