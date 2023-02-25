using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using KhoaY.Model;
using System.Data;
using KhoaY.Controller;
using System.Web.UI.HtmlControls;
public partial class CustomerOrderDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           Response.Cookies["ReturnSelf"].Value = "CustomerOrderDetails.aspx?OrderID=" + Request.QueryString["OrderID"];
           LoadOrderDetails();
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
        hpl2.Text = "Đăng Nhập";
        hpl2.NavigateUrl = String.Format("~/Login.aspx");


        hpl3.Text = "Hóa Đơn Khách Hàng";
        hpl3.NavigateUrl = "~/CustomerOrders.aspx";

        hpl4.Text = "Chi Tiết Hóa Đơn";
        hpl4.Style.Add("Color", "silver");
        hpl4.Enabled = false;

        hpl5.Text = "";
        hpl6.Text = "";

        li1.Attributes["class"] = "breadcrumb-item";
        li2.Attributes["class"] = "breadcrumb-item";
        li3.Attributes["class"] = "breadcrumb-item";
        li4.Attributes["class"] = "breadcrumb-item";
        li5.Attributes["class"] = "";
        li6.Attributes["class"] = "";

    }
    public void LoadOrderDetails()
    {
        ProcessOrderDetails processorderdetails = new ProcessOrderDetails();
        OrderDetails orderdetails = new OrderDetails();
        orderdetails.OrderID = int.Parse(Request.QueryString["OrderID"]);
        labelOrderID.Text = orderdetails.OrderID.ToString() ;
        DataSet ds = new DataSet();
        try {
            ds = processorderdetails.OrderDetailsSelectData(orderdetails);
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
        gridviewOrderDetailsProducts.DataSource = ds;
        gridviewOrderDetailsProducts.DataBind();
        decimal total = 0;
        foreach (GridViewRow grow in gridviewOrderDetailsProducts.Rows)
        {
            Label labelUnitPrice = (Label)grow.FindControl("LabelTotalPrice");
             total += decimal.Parse(labelUnitPrice.Text);

        }
        labelOrderTotal.Text = String.Format("{0:#,##0}", total) + " VNĐ";
    }
    protected void commandReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerOrders.aspx");
    }
 
    
}