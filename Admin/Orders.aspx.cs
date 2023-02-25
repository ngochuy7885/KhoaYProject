using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using System.Data;
using System.Web.UI.HtmlControls;
public partial class Admin_Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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
        hpl1.NavigateUrl = "Products.aspx";

        hpl2.Text = "Hóa Đơn";
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
    public void LoadOrders()
    {
        ProcesssOrders processorders = new ProcesssOrders();
        DataSet ds = new DataSet();
        try {
          ds =  processorders.OrdersAllSelectData();
        } catch(Exception ex){
            KhoaY.Controller.Utilities.LogException(ex);
           // Response.Write(ex.ToString());
        }
        gridviewAllOrders.DataSource = ds;
        gridviewAllOrders.DataBind();
        
    }
    protected void gridviewAllOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridviewAllOrders.PageIndex = e.NewPageIndex;
        LoadOrders();

    }
    protected void gridviewAllOrders_RowDataBound(object sender, GridViewRowEventArgs e)
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
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gridviewAllOrders, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Bấm Vào Lựa Chọn Dòng.";
            }


        }
    }
    protected void gridviewAllOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gridviewAllOrders.SelectedRow;

       
        //Get the value of column from the DataKeys using the RowIndex.
        int orderid = Convert.ToInt32(gridviewAllOrders.DataKeys[row.RowIndex].Values["OrderId"]);
        string email = gridviewAllOrders.DataKeys[row.RowIndex].Values["Email"].ToString();
        
        Response.Redirect("OrderDetails.aspx?OrderID=" + orderid.ToString() + "&Email=" + email,false );

    }
}