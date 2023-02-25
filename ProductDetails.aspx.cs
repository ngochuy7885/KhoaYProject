using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using KhoaY.Model;
using System.Web.UI.HtmlControls;
public partial class ProductDetails : System.Web.UI.Page
{
    public static int productId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadProduct();
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
        hpl2.Text = "Chi Tiết Sản Phẩm";
        hpl2.NavigateUrl = String.Format("~/ProductDetails.aspx");
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
    public void LoadProduct()
    {
        try {
            ProcessProduct processproduct = new ProcessProduct();
            productId = int.Parse(Request.QueryString["ProductID"]);
            Product product = processproduct.ProductSelectByIDData(productId);
           imageProduct.ImageUrl = "ImageViewer.ashx?ProductImageID=" + product.ProductImageID.ToString();
            labelProductName.Text = product.ProductName;
            labelProductCategoryName.Text = product.ProductCategory.ProductCategoryName;
            labelDescription.Text = product.Description;
            labelPrice.Text = String.Format(new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", product.Price) + " VNĐ";
            labelDescriptionHTML.Text = Server.HtmlDecode(product.DescriptionHTML);
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }
        
    }
    protected void commandContinueShopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }


    
    protected void commandShopping_Click1(object sender, EventArgs e)
    {
        Response.Redirect("AddToCart.aspx?ProductID=" + productId);
    }
}