using KhoaY.Controller;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestProgressBar2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //System.Threading.Thread.Sleep(3000);

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Timer1.Enabled = false;
        My_Page_Load_Function(); // Function created in step 1 above)
    }
    protected void My_Page_Load_Function()
    {
        //System.Threading.Thread.Sleep(5000); // A delay to simulate doing something.
        //CreatePDF("test");
        Response.Redirect("Default.aspx");
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
        Response.ClearHeaders();
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file 

        Response.Flush(); // send it to the client to download 
        Response.Close();

    }
}