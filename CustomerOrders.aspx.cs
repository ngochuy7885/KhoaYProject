using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using System.Data;
using KhoaY.Model;
using System.Web.UI.HtmlControls;
public partial class CustomerOrders : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Response.Cookies["ReturnSelf"].Value = "CustomerOrders.aspx";
            if (CurrentEndUser == null)
            {
                Response.Redirect("Login.aspx");
            }
            LoadOrders();
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

        hpl4.Text = "";
        hpl5.Text = "";
        hpl6.Text = "";

        li1.Attributes["class"] = "breadcrumb-item";
        li2.Attributes["class"] = "breadcrumb-item";
        li3.Attributes["class"] = "breadcrumb-item";
        li4.Attributes["class"] = "";
        li5.Attributes["class"] = "";
        li6.Attributes["class"] = "";

    }
    public void LoadOrders()
    {
        ProcesssOrders processorder = new ProcesssOrders();
        DataSet ds = new DataSet();
        try
        {
            ds = processorder.OrdersSelectByEndUserID(base.CurrentEndUser);

        }
        catch (Exception ex) {
            Response.Write(ex.ToString());
        }
        gridviewOrders.DataSource = ds;
        gridviewOrders.DataBind();
        labelName.Text = CurrentEndUser.LastName + " " + CurrentEndUser.FirstName; 
    }
    protected void gridviewOrders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           

            e.Row.Attributes["onmouseover"] = "javascript:setMouseOverColor(this);";
            e.Row.Attributes["onmouseout"] = "javascript:setMouseOutColor(this)";
            // e.Row.Attributes["onclick"] =
            // ClientScript.GetPostBackClientHyperlink
            //    (this.gvProducts, "Select$" + e.Row.RowIndex);
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gridviewOrders, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
           
          
        }
    }
    
    protected void gridviewOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridviewOrders.PageIndex = e.NewPageIndex;
        LoadOrders();
    }
    protected void gridviewOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gridviewOrders.SelectedRow;
        int OrderId = int.Parse(gridviewOrders.DataKeys[row.RowIndex].Value.ToString());
        Response.Redirect("CustomerOrderDetails.aspx?OrderID=" + OrderId.ToString());

    }
}