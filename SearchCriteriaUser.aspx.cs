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
public partial class SearchCriteriaUser : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["Search"] == null)
            {
                Response.Redirect("Default.aspx",false);
            }
            if (Session["searchstring"] == null){
                Response.Redirect("Default.aspx",false);
                return;
            }
            if (HttpContext.Current.Request.Cookies["ReturnSelf"] == null )
            {
                // do something
                Response.Redirect("Default.aspx", false);    
            }
            else {
                Response.Cookies["ReturnSelf"].Value = "SearchCriteriaUser.aspx?Search=" + Session["searchstring"].ToString();            
            }
               
            string search = Request.QueryString["Search"].ToString();
            //string search = Session["searchstring"].ToString();
            TextBox txtbox = Page.Master.FindControl("txtProductSearch") as TextBox;
            txtbox.Text = search;
            //txtbox.Focus();
            
            
            GetOrdersByID(search);
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
    
    public void GetOrdersByID(string search)
    {
        try
        {
            // Check search length bang 0
            if (search.Length == 0)
            {
                panelOrders.Visible = false;
                panelProducts.Visible = false;
                panelResults.Visible = true;
                labelMessage.Text = "Không Có Dữ Liệu";
                return;
            }

            ProcessProduct processproduct = new ProcessProduct();
            EndUser enduser = new EndUser();
            if (Utilities.IsNumber(search))
            {
                Response.Cookies["ReturnURL"].Value = "CustomerOrders.aspx";
                   
                if (CurrentEndUser == null)
                {
                    Response.Redirect("Login.aspx", false);
                    return;

                }
                

                enduser.EndUserID = CurrentEndUser.EndUserID;

                panelProducts.Visible = false;
                panelOrders.Visible = true;
                DataSet ds = processproduct.ProductSearchOrderAndProductNameUser(search, enduser);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    panelOrders.Visible = false;
                    panelProducts.Visible = false;
                    panelResults.Visible = true;
                    labelMessage.Text = "Không Có Dữ Liệu";
                }
                else
                {
                    
                    panelOrders.Visible = true;
                    panelResults.Visible = false;
                    panelProducts.Visible = false;
                    DataTable datatable = Utilities.RemoveDuplicateRows(ds.Tables[0], "OrderId");

                    //DataView dv = new DataView(datatable);

                    //dv[0]["ShipDate"] = "Product11";


                    gridviewOrders.DataSource = datatable;
                    gridviewOrders.DataBind();
                    //Paging 
                    CollectionPager1.PageSize = 6; //Số sản phẩm hiển thị trên một trang
                    CollectionPager1.MaxPages = 1000;
                    CollectionPager1.DataSource = datatable.DefaultView;
                    CollectionPager1.BindToControl = datalistProducts;
                    datalistProducts.DataSource = CollectionPager1.DataSourcePaged;
                 }
                    //gridviewOrders.DataSource = datatable;
                    //gridviewOrders.DataBind();
            }
            else
            {
                panelOrders.Visible = false;
                panelProducts.Visible = true;
                DataSet ds = processproduct.ProductSearchByProductNameUser(search);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    panelOrders.Visible = false;
                    panelProducts.Visible = false;
                    panelResults.Visible = true;
                    labelMessage.Text = "Không Có Dữ Liệu";
                }
                else {
                     datalistProducts.DataSource = ds.Tables[0];
                    datalistProducts.DataBind();
                    CollectionPager1.PageSize = 6; //Số sản phẩm hiển thị trên một trang
                    CollectionPager1.MaxPages = 1000;
                    CollectionPager1.DataSource = ds.Tables[0].DefaultView;
                    CollectionPager1.BindToControl = datalistProducts;
                    datalistProducts.DataSource = CollectionPager1.DataSourcePaged;
               
                }
            }
        }
        catch (Exception ex)
        {
            //Response.Write(ex.Message.Replace("\'", " "));
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
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gridviewOrders, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }


        }
    }
      protected void gridviewOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gridviewOrders.SelectedRow;
        int OrderId = int.Parse(gridviewOrders.DataKeys[row.RowIndex].Value.ToString());
        Response.Redirect("CustomerOrderDetails.aspx?OrderID=" + OrderId.ToString());

    }
}