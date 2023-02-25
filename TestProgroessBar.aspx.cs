using KhoaY.Controller;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestCase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
           
            CreatePDF("test");
            System.Threading.Thread.Sleep(1000);
           
            Response.Write("<script>window.location='http://192.168.1.111/Default.aspx';</script>");
     
            // Label1.Text = "elloo";

        }
        catch (Exception ex)
        {

            KhoaY.Controller.Utilities.LogException(ex);
        }
        finally {
            //Response.Redirect("Default.aspx");
        }
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
        Response.ContentType = "text/plain";
        //Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file      
        Response.Flush(); // send it to the client to download 
            
     
      
        
    }
}