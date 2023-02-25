using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using KhoaY.Model;
using KhoaY.Controller;
using System.Data;
using System.Collections.Specialized;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_RecycleBin : System.Web.UI.Page
{
    private static int PageSize = 5;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            LoadProducts();
            LoadNavigation();
            
        }
       
    }
    
   
    private void LoadProducts()
    {
        ProcessProduct processorders = new ProcessProduct();
        DataSet ds = new DataSet();
        try
        {
            ds = processorders.DeletedProductSelectData();
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
            // Response.Write(ex.ToString());
        }
        gridviewDeletedProduct.DataSource = ds;
        gridviewDeletedProduct.DataBind();
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
        hpl2.Text = "Giỏ Rác";
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
    protected void gridviewDeletedProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridviewDeletedProduct.PageIndex = e.NewPageIndex;
        LoadProducts();

    }
    protected void gridviewDeletedProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gridviewDeletedProduct.SelectedRow;
        int productid = (int)gridviewDeletedProduct.DataKeys[row.RowIndex].Value;
        Recover(productid);
        LoadProducts();    

    }
    protected void btnTim_Click(object sender, EventArgs e)
    {
        try {
            string search = txtSearch.Text.Trim();
            ProcessProduct processproduct = new ProcessProduct();
            DataSet ds = processproduct.ProductDeletedSelectBySearchName(search);
            gridviewDeletedProduct.DataSource = ds;
            gridviewDeletedProduct.DataBind();
        }
        catch (Exception ex) {
            KhoaY.Controller.Utilities.LogException(ex);
        }

        
    }
    protected void gridviewDeletedProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int productid =(int)gridviewDeletedProduct.DataKeys[e.RowIndex].Value;
        Recover(productid);
        LoadProducts();

    }
    protected void btnRecover_Click(object sender, EventArgs e)
    {
        string Selected = "";
        foreach (GridViewRow gr in gridviewDeletedProduct.Rows)
        {
            CheckBox cb = (CheckBox)gr.FindControl("chkSelect");
            Label lblName = (Label)gr.FindControl("lblProductName");
            // You can get other value same way               

            if (cb != null && cb.Checked)
            {
                string productID = gridviewDeletedProduct.DataKeys[gr.RowIndex].Values["ProductID"].ToString();
                Recover(int.Parse(productID));
                //Selected += "Product ID : " + StdID + ", Name : " + lblName.Text.Trim() + "<br/>";
            }
        }
        LoadProducts();

       // lblResult.Text = Selected;
       
       
    }
    public void Recover (int productid){
        try {
            Product product = new Product();
            product.ProductID = productid;
            ProcessProduct processproduct = new ProcessProduct();
            processproduct.ProductRecoverData(product);
        }
        catch(Exception ex) {
            KhoaY.Controller.Utilities.LogException(ex);
            
        }
    }

    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        try
        {
            string search = txtSearch.Text.Trim();
            ProcessProduct processproduct = new ProcessProduct();
            DataSet ds = processproduct.ProductDeletedSelectBySearchName(search);
            gridviewDeletedProduct.DataSource = ds;
            gridviewDeletedProduct.DataBind();
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
}