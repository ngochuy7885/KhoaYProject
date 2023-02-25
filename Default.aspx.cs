using KhoaY.Controller;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { 
            LoadProducts();
            LoadNavigation();
            Response.Cookies["ReturnSelf"].Value = "Default.aspx";
        //    string Message = "Trang web KhoaY đang được xây dựng. Xin thông cảm nếu phát xin lỗi";
        //    string type = "info";
        //    if (Session["CloseAlert"] == null)
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','');", true);   
        //
        }
    }
   
    public void LoadNavigation() {
        //Navigation
        HyperLink hpl1 = (HyperLink)Page.Master.FindControl("hpl1");
        HyperLink hpl2 = (HyperLink)Page.Master.FindControl("hpl2");
        HyperLink hpl3 = (HyperLink)Page.Master.FindControl("hpl3");
        HyperLink hpl4 = (HyperLink)Page.Master.FindControl("hpl4");
        HyperLink hpl5 = (HyperLink)Page.Master.FindControl("hpl5");
        HyperLink hpl6 = (HyperLink)Page.Master.FindControl("hpl6");
       
        HtmlGenericControl li1 = (HtmlGenericControl)Page.Master.FindControl("li1");
        HtmlGenericControl li2 = (HtmlGenericControl)Page.Master.FindControl("li2");
        HtmlGenericControl li3 = (HtmlGenericControl)Page.Master.FindControl("li3");
        HtmlGenericControl li4 = (HtmlGenericControl)Page.Master.FindControl("li4");
        HtmlGenericControl li5 = (HtmlGenericControl)Page.Master.FindControl("li5");
        HtmlGenericControl li6 = (HtmlGenericControl)Page.Master.FindControl("li6");


        hpl1.Text = "Trang Chủ";
        hpl1.NavigateUrl = "Default.aspx";
        hpl2.Text = "";
        hpl3.Text = "";
        hpl4.Text = "";
        hpl5.Text = "";
        hpl6.Text = "";

        li1.Attributes["class"] = "";
        li2.Attributes["class"] = "";
        li3.Attributes["class"] = "";
        li4.Attributes["class"] = "";
        li5.Attributes["class"] = "";
        li6.Attributes["class"] = "";
        
    }
    public void LoadProducts() {
        //System.Threading.Thread.Sleep(3000);
        ProcessProduct processproduct = new ProcessProduct();
        try
        {
            DataSet ds = processproduct.ProductSelectData();
            //DataSet ds = processproduct.ProductSelectTop6BestSeller();

            CollectionPager1.PageSize = 6; //Số sản phẩm hiển thị trên một trang
            CollectionPager1.MaxPages = 1000;
            CollectionPager1.DataSource = ds.Tables[0].DefaultView;
            CollectionPager1.BindToControl = datalistProducts;
            datalistProducts.DataSource = CollectionPager1.DataSourcePaged;

           
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);        
        }
    }
    //protected void btnCloseAlert_Click(object sender, EventArgs e)
    //{
    //    Session["CloseAlert"] = "Close";
    //    LoadProducts();
    //}
}