using KhoaY.Controller;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //hplNSX.NavigateUrl = "ProductCategory.aspx";
            Session.Timeout = 1200;
            LoadCounter();
        }
       // string Message;
       // Message = DateTime.Now.ToString() + " test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test ";
       
       // //if (Session["CloseAlert"] == null) {
       // //    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','');", true);

       // //}
       // if (Session["CloseAlert"] == null)
       // {
       //     ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','');", true);
       //}    
         
    }
    public void LoadCounter()
    {
        int totalNumberOfUsers = (int)Application["HitCounters"];
        int currentNumberOfUsers = (int)Application["OnlineUsers"];

        lblTotalNumberOfUsers.Text = totalNumberOfUsers.ToString();
        lblCurrentNumberOfUsers.Text = currentNumberOfUsers.ToString();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //Response.Redirect("OrdersSearch.aspx?Search=" + txtOrdersSearch.Text);
        string formatstring = String.Format("SearchCriteria.aspx?Search={0}", HttpUtility.UrlEncode(txtOrdersSearch.Text).ToString());
        Session["searchstring"] = txtOrdersSearch.Text;
        Response.Redirect(formatstring);
        //Response.Redirect("SearchCriteria.aspx?Search=" + txtOrdersSearch.Text);
    }
    protected void commandSignOut_Click(object sender, EventArgs e)
    {
        if (Session["RememberMe"] == null )
        {
            Session.RemoveAll();
            Response.Cookies["Email"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);  
                  
        }
        FormsAuthentication.SignOut() ;
        //Roles.DeleteCookie();
        Session.Clear();
        Response.Redirect("Login.aspx");
        
    }
    protected void commandProductLocation_Click(object sender, EventArgs e)
    {
        CreatePDFLocation("Location");
    }
    private void CreatePDFLocation(string fileName)
    {
        //// Setup DataSet
        //MyDataSetTableAdapters.YourTableAdapterHere ds = new MyDataSetTableAdapters.YourTableAdapterHere();
        ProcessProduct processproduct = new KhoaY.Controller.ProcessProduct();
        DataSet ds = processproduct.ProductLocation();

        //// Create Report DataSource
        ReportDataSource rds = new ReportDataSource("DSProductLocation", ds.Tables[0]);

        // Variables   
        Warning[] warnings;
        string[] streamIds;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;

        // Setup the report viewer object and get the array of bytes   
        ReportViewer viewer = new ReportViewer();
        viewer.ProcessingMode = ProcessingMode.Local;
        viewer.LocalReport.ReportPath = "Admin/ReportProductLocation.rdlc";
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
    protected void commandProductPrice_Click(object sender, EventArgs e)
    {
        try {
            CreatePDFPrice("Price");
           // Response.Redirect("Products.aspx", false);
        }
        catch(Exception ex){
            KhoaY.Controller.Utilities.LogException(ex);
        }
       
    }
    public void CreatePDFPrice(string fileName)
    {
        //// Setup DataSet
        //MyDataSetTableAdapters.YourTableAdapterHere ds = new MyDataSetTableAdapters.YourTableAdapterHere();
        ProcessProduct processproduct = new KhoaY.Controller.ProcessProduct();
        DataSet ds = processproduct.ProductPrice();

        //// Create Report DataSource
        ReportDataSource rds = new ReportDataSource("DSProductPrice", ds.Tables[0]);

        // Variables   
        Warning[] warnings;
        string[] streamIds;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;

        // Setup the report viewer object and get the array of bytes   
        ReportViewer viewer = new ReportViewer();
        viewer.ProcessingMode = ProcessingMode.Local;
        viewer.LocalReport.ReportPath = "Admin/ReportProductPrice.rdlc";
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

    protected void commandProductCategory_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin/ProductCategory.aspx", false);
    }
    protected void commandProductUnit_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin/ProductUnit.aspx", false);
    }
    protected void commandProducts_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin/Products.aspx", false);
    }
    protected void commandRecycleBin_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin/RecycleBinV1.aspx", false);
    }
    protected void commandOrders_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin/Orders.aspx", false);
    }
    protected void commandReportOrders_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin/ReportOrder.aspx", false);
    }
    protected void commandNewsLetter_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin/NewsLetter.aspx", false);
    }
}
