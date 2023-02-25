using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using System.Data;
using System.Web.UI.HtmlControls;
public partial class ProductSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Search"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            string search = Request.QueryString["Search"].ToString();
            TextBox txtbox = Page.Master.FindControl("txtProductSearch") as TextBox;
            txtbox.Text = search;
            txtbox.Focus();
            GetProductsByText(search);
            LoadNavigation();
        }
    }
    public void LoadNavigation()
    {

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
        hpl2.Text = "Tìm Kiếm";
        hpl2.Style.Add("Color", "silver");
        hpl2.Enabled = false;
        
        hpl3.Text = "";
        hpl4.Text = "";
        hpl5.Text = "";
        hpl6.Text = "";

        li1.Attributes["class"] = "breadcrumb-item";
        li2.Attributes["class"] = "breadcrumb-item";
        li3.Attributes["class"] = "";
        li4.Attributes["class"] = "";
        li5.Attributes["class"] = "";
        li6.Attributes["class"] = "";

    }
    public void GetProductsByText(string search) {
        ProcessProduct processproduct = new ProcessProduct();
        try {
            DataSet ds = new DataSet();
            ds = processproduct.ProductSelectSearchData(search);
            if (ds.Tables[0].Rows.Count > 0)
            {
                panelResults.Visible = false;
                CollectionPager1.PageSize = 4; //Số sản phẩm hiển thị trên một trang
                CollectionPager1.DataSource = ds.Tables[0].DefaultView;
                CollectionPager1.BindToControl = datalistProducts;
                datalistProducts.DataSource = CollectionPager1.DataSourcePaged;
            }
            else {
                panelResults.Visible = true;
            }
        }
        catch(Exception ex){
            Response.Write(ex.ToString());
        }
    }
}