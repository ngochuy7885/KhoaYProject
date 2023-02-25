using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using System.Data;
using Microsoft.Reporting.WebForms;
using System.Data.SqlClient;
public partial class Main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            Session.Timeout = 1200;
            //LoadCategories();
            LoadShoppingCart();
            LoadCounter();
             
        }
        //string Message = "Trang web KhoaY đang được xây dựng. Xin thông cảm nếu phát xin lỗi";
        string Message = "Giá Trên Sản Phẩm Chỉ Có Tính Tham Khảo Nhé!";

        //if (Session["CloseAlert"] == null) {
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','');", true);

        //}
        if (Session["CloseAlert"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','');", true);
        }

        //Set Css for update badage and textbox search
        Label labelCart1 = (Label)Page.Master.FindControl("labelCart");
        int total = int.Parse(labelCart1.Text);
        TextBox txtSearch = (TextBox)Page.Master.FindControl("txtProductSearch");
        if (total > 0 && total < 1000)
        {
            txtSearch.CssClass = "form-control searchmarginleft1";
        }
        if (total > 1000)
        {
            txtSearch.CssClass = "form-control searchmarginleft5";

        }

        //txtSearch.Attributes.Add("onkeyup", "xmlhttpPost()");
       
    }

    
    public void LoadCounter()
    {
        int totalNumberOfUsers = (int)Application["HitCounters"];
        int currentNumberOfUsers = (int)Application["OnlineUsers"];

        lblTotalNumberOfUsers.Text = totalNumberOfUsers.ToString();    
        lblCurrentNumberOfUsers.Text = currentNumberOfUsers.ToString();
    }
    public void LoadShoppingCart()
    {
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        shoppingcart.CartGUID = Utilities.GetCartGUID();
         
        ProcessShoppingCart processgetcart = new ProcessShoppingCart();
        try
        {
            //Update ShoppingCart label
            if (Session["UpdateCartExpire"] == "Expire")
            {
                labelCart.Text = "0";
                Session["UpdateCartExpire"] = "NoneExpire";
            }
            //else if (Session["UpdateCartExpire"] == "Expire") {
            //    labelCart.Text = "0";            
            //}
            else
            {
                DataSet ds = new DataSet();
                ds = processgetcart.ShoppingCartSelectData(shoppingcart.CartGUID);
                int total = 0;
                if (ds.Tables[0].Rows.Count != 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        total += int.Parse(ds.Tables[0].Rows[i]["Quantity"].ToString());

                    }
                }
                labelCart.Text = total.ToString();

            }
        }
        catch (Exception ex) {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
    //public void LoadCategories()
    //{
    //    try
    //    {
    //        ProcessProductCategory productcategories = new ProcessProductCategory();
    //        rptRepeater.DataSource = productcategories.ProductCategorySelectData();
    //        rptRepeater.DataBind();
    //    }
    //    catch (Exception ex) {
    //        //Response.Write(ex.ToString());
    //        KhoaY.Controller.Utilities.LogException(ex);
    //    }
        
    //}
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //Response.Redirect("ProductSearch.aspx?Search=" + txtProductSearch.Text);
        //System.Threading.Thread.Sleep(3000);
        Session["searchstring"] = HttpUtility.UrlEncode(txtProductSearch.Text);
        Response.Redirect("SearchCriteriaUser.aspx?Search=" + HttpUtility.UrlEncode(txtProductSearch.Text));
    }
    protected void commandProductQuote_Click(object sender, EventArgs e)
    {
        try {
            CreatePDF("Bảng Báo Giá");
            //Response.AddHeader("Refresh", "1;URL=Default.aspx");
            //Response.Redirect("Default.aspx", false);
            //Response.Write(@"<script type='text/javaScript'> window.location.href = 'Default.aspx'; </script>");
        }
        catch (Exception ex)
        {
            Utilities.LogException(ex);
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
        //string encoding = string.Empty;
        string encoding = System.Text.Encoding.UTF8.ToString();
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

    protected void commandLogin_Click(object sender, EventArgs e)
    {
        Response.Cookies["ReturnSelf"].Value = "Login.aspx";
        Response.Redirect("Login.aspx", false);
    }
    protected void commandProductQuotev1_Click(object sender, EventArgs e)
    {
        CreatePDFv1("Bảng Báo Giá v1"); 
    }
    private void CreatePDFv1(string fileName)
    {
        //// Setup DataSet
        //MyDataSetTableAdapters.YourTableAdapterHere ds = new MyDataSetTableAdapters.YourTableAdapterHere();
        ProcessProduct processproduct = new KhoaY.Controller.ProcessProduct();
        DataSet ds = processproduct.ProductQuotev1();

        //// Create Report DataSource
        ReportDataSource rds = new ReportDataSource("DSProductQuotev1", ds.Tables[0]);

        // Variables   
        Warning[] warnings;
        string[] streamIds;
        string mimeType = string.Empty;
        //string encoding = string.Empty;
        string encoding = System.Text.Encoding.UTF8.ToString();
        string extension = string.Empty;

        // Setup the report viewer object and get the array of bytes   
        ReportViewer viewer = new ReportViewer();
        viewer.ProcessingMode = ProcessingMode.Local;
        viewer.LocalReport.ReportPath = "ReportProductQuotev1.rdlc";
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
    protected void functionName(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx",false);
    }
    protected void btnCloseAlert_Click(object sender, EventArgs e)
    {
        Session["CloseAlert"] = "Close";
        //Response.Redirect("Default.aspx", false);
        if (Request.Cookies["ReturnSelf"] != null)
        {
            Response.Redirect(Request.Cookies["ReturnSelf"].Value);
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void commandIntroduction_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("~/Introduction.aspx",false);
    }
    protected void commandProducts_Click(object sender, EventArgs e)
    {
      
        Response.Redirect("~/Default.aspx",false);
    }
    protected void commandCustomerOrders_Click(object sender, EventArgs e)
    {
        Response.Cookies["ReturnURL"].Value = "CustomerOrders.aspx";

        Response.Redirect("~/CustomerOrders.aspx", false);
  
    }
    protected void commandFAQ_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("~/FAQ.aspx", false);
  
    }
    protected void commandContactUs_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ContactUs.aspx", false);
  
    }
    
}
