using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Model;
using KhoaY.Controller;
using System.Data;
using System.Web.UI.HtmlControls;
public partial class Admin_SearchCriteria : System.Web.UI.Page
{
    private static string searchstring;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Search"] == null)
            {
                Response.Redirect("Products.aspx");
            }
            LoadNavigation();
            
            //string search =  HttpUtility.UrlDecode(Request.QueryString["Search"]);
            string search = Session["searchstring"].ToString();
            TextBox txtbox = Page.Master.FindControl("txtOrdersSearch") as TextBox;
            txtbox.Text = search;
            searchstring = search;
            txtbox.Focus();
            GetOrdersByID(search);
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
    public void GetOrdersByID(string search)
    {
        try {
            if (search.Length == 0)
            {
                panelOrders.Visible = false;
                panelProducts.Visible = false;
                panelResults.Visible = true;
                labelMessage.Text = "Không Có Dữ Liệu";
                return;
            }
            ProcesssOrders processorders = new ProcesssOrders();
            if (Utilities.IsNumber(search))
            {
                panelProducts.Visible = false;
                panelOrders.Visible = true;
                DataSet ds = processorders.OrderSearchOrderAndProductName(search);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    panelOrders.Visible = false;
                    panelProducts.Visible = false;
                    panelResults.Visible = true;
                    labelMessage.Text = "Không Có Dữ Liệu";
                }
                else {                                                         
                    panelOrders.Visible = true;
                    panelResults.Visible = false;
                    panelProducts.Visible = false;
                    DataTable datatable = Utilities.RemoveDuplicateRows(ds.Tables[0], "OrderId");
                  
                    gridviewOrder.DataSource = datatable;
                    gridviewOrder.DataBind();
                    //Paging 
                    CollectionPager1.PageSize = 6; //Số sản phẩm hiển thị trên một trang
                    CollectionPager1.MaxPages = 1000;
                    CollectionPager1.DataSource = datatable.DefaultView;
                    CollectionPager1.BindToControl = datalistProducts;
                    datalistProducts.DataSource = CollectionPager1.DataSourcePaged;                 
                }
            }
            else
            {
                panelOrders.Visible = false;
                panelProducts.Visible = true;
                //DataSet ds = processorders.OrderSearchOrderAndProductName(search);
                DataSet ds = processorders.OrderSearchByProductName(search);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    panelOrders.Visible = false;
                    panelProducts.Visible = false;
                    panelResults.Visible = true;
                    labelMessage.Text = "Không Có Dữ Liệu";
                }
                else {
                    DataTable datatable = Utilities.RemoveDuplicateRows(ds.Tables[0], "ProductId");
                    datalistProducts.DataSource = datatable;
                    datalistProducts.DataBind();

                    //Paging 
                    CollectionPager1.PageSize = 6; //Số sản phẩm hiển thị trên một trang
                    CollectionPager1.MaxPages = 1000;
                    CollectionPager1.DataSource = datatable.DefaultView;
                    CollectionPager1.BindToControl = datalistProducts;
                    datalistProducts.DataSource = CollectionPager1.DataSourcePaged;        
                }
            }
        }
        catch (Exception ex) {
            //Response.Write(ex.Message.Replace("\'", " "));
            //lblError.Text = ex.Message.Replace("\'", " ");
            KhoaY.Controller.Utilities.LogException(ex);
        }
      
    }

    protected void gridviewOrder_RowDataBound(object sender, GridViewRowEventArgs e)
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
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gridviewOrder, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Bấm Vào Lựa Chọn Dòng.";
            }
        }
    }

    protected void gridviewOrder_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            GridViewRow row = gridviewOrder.SelectedRow;
            DataKey data = gridviewOrder.DataKeys[row.DataItemIndex];
            int OrderId = int.Parse(data.Values["OrderId"].ToString());
            string email = data.Values["Email"].ToString();
            Response.Redirect("OrderDetails.aspx?OrderID=" + OrderId.ToString() + "&Email=" + email,false);
        }
        catch (Exception ex){
            //labelMessage.Text = Ex.ToString();
            KhoaY.Controller.Utilities.LogException(ex);
        
        }
        
    }
    protected void btn1_Click(object sender, EventArgs e)
    {

        string[] arg = new string[2];
        string stringargument = ((sender as LinkButton).CommandArgument).ToString();
        arg = stringargument.ToString().Split(';');
        ModalPopupExtenderUpdate.Show();
        GetOrdersByID(searchstring);
        lblPrice.Text = arg[1];
        ModalPopupExtenderUpdate.Show();

        //string location = ((sender as LinkButton).CommandArgument).ToString();
        //ModalPopupExtenderUpdate.Show();
        //GetOrdersByID(searchstring);
        //lblLocation.Text = location.ToString();
    }

    protected void btnCloseModel_Click(object sender, EventArgs e)
    {
         GetOrdersByID(searchstring);
    }
}