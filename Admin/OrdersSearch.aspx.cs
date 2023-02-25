using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using KhoaY.Model;
using System.Data;
public partial class Admin_OrdersSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Search"] == null)
            {
                Response.Redirect("Products.aspx",false);
            }
            string search = Request.QueryString["Search"].ToString();
            TextBox txtbox = Page.Master.FindControl("txtOrdersSearch") as TextBox;
            txtbox.Text = search;
            txtbox.Focus();
            GetOrdersByID(search);
        }
    }
    public void GetOrdersByID(string search)
    {
        ProcesssOrders processorders = new ProcesssOrders();
        try
        {
            DataSet ds = new DataSet();
            int orderid = int.Parse(search);
            ds = processorders.OrderSearchSelectByOrderID(orderid);
            if (ds.Tables[0].Rows.Count > 0)
            {
                panelResults.Visible = false;
                gridviewOrder.DataSource = ds;
                gridviewOrder.DataBind();
                
            }
            else
            {
                panelResults.Visible = true;
            }
        }
        catch (Exception ex)
        {
            panelOrders.Visible = false;
            KhoaY.Controller.Utilities.LogException(ex);
            labelMessage.Text = ex.ToString();
            panelResults.Visible = true;
            
            //Response.Write(ex.ToString());
        }
    }
}