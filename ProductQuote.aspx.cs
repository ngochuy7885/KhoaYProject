using KhoaY.Controller;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductQuote : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            GetData();
        }
    }
    public void GetData()
    {
        KhoaY.Controller.ProcessProduct processproduct = new KhoaY.Controller.ProcessProduct();
        DataSet ds = processproduct.ProductQuote();


        ReportViewer1.ProcessingMode = ProcessingMode.Local;
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("ReportProductQuote.rdlc");
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DSProductQuote", ds.Tables[0]));
        ReportViewer1.LocalReport.Refresh();

    }
    private void CreatePDF(string fileName)
    {
        //// Setup DataSet
        //MyDataSetTableAdapters.YourTableAdapterHere ds = new MyDataSetTableAdapters.YourTableAdapterHere();
        ProcessProduct processproduct = new KhoaY.Controller.ProcessProduct();
        DataSet ds = processproduct.ProductQuote();

        //// Create Report DataSource
        ReportDataSource rds = new ReportDataSource("DSProductQuote", ds.Tables[0]);

        // Variables   
        Warning[] warnings;
        string[] streamIds;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;

        // Setup the report viewer object and get the array of bytes   
        ReportViewer viewer = new ReportViewer();
        viewer.ProcessingMode = ProcessingMode.Local;
        viewer.LocalReport.ReportPath = "ReportProductQuote.rdlc";
        viewer.LocalReport.DataSources.Add(rds); // Add datasource here

        byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.   
        Response.Buffer = true;
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file   
        Response.Flush(); // send it to the client to download   
    }

    protected void commandProductQuote_Click(object sender, EventArgs e)
    {
        try {           
            CreatePDF("test");
            Response.Redirect("Default.aspx", false);
        }
        catch (Exception ex) {
            Utilities.LogException(ex);
        }
    }
}