using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using System.Data;
using System.Web.UI.HtmlControls;
public partial class Admin_Products : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadProducts();
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
        hpl1.NavigateUrl = "Products.aspx";
        hpl2.Text = "";

        hpl3.Text = "";
        hpl4.Text = "";
        hpl5.Text = "";
        hpl6.Text = "";

        li1.Attributes["class"] = "breadcrumb-item";
        li2.Attributes["class"] = "";
        li3.Attributes["class"] = "";
        li4.Attributes["class"] = "";
        li5.Attributes["class"] = "";
        li6.Attributes["class"] = "";

    }
    public void LoadProducts()
    {
        ProcessProduct processproduct = new ProcessProduct();
        try {
            DataSet ds = processproduct.ProductAdminSelectData();
            
            datalistProducts.DataSource = ds;
            datalistProducts.DataBind();
            //rptProducts.DataSource = objDataTable;
            //rptProducts.DataBind();

            CollectionPager1.PageSize = 6; //Số sản phẩm hiển thị trên một trang
            CollectionPager1.MaxPages = 1000;
            CollectionPager1.DataSource = ds.Tables[0].DefaultView;
            CollectionPager1.BindToControl = datalistProducts;
            datalistProducts.DataSource = CollectionPager1.DataSourcePaged;
           
       }
        catch (Exception ex) {
            //labelMessage.Text = ex.ToString();
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
    
    protected void commandAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProduct.aspx",false);
    }





    protected void btn1_Click(object sender, EventArgs e)
    {
        string[] arg = new string[2];
        string stringargument = ((sender as LinkButton).CommandArgument).ToString();
        arg = stringargument.ToString().Split(';');
        ModalPopupExtenderUpdate.Show();
        LoadProducts();
        lblPrice.Text = arg[1];
        

        //string location = ((sender as LinkButton).CommandArgument).ToString() ;      
        ModalPopupExtenderUpdate.Show();
        LoadProducts();
        //lblLocation.Text = location.ToString();
        //textLocation.Text = location.ToString();
    }

    protected void btnCloseModel_Click(object sender, EventArgs e)
    {
        LoadProducts();
    }
    
}