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
using System.Text;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.IO;
using Microsoft.Reporting.WebForms;
public partial class ShoppingCart : BasePage
{
    decimal _totalcounter;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //Thong Bao
            if (Request.QueryString["ProductID"] != null)
            {
                Response.Cookies["ReturnSelf"].Value = "ShoppingCart.aspx?ProductID=" + Request.QueryString["ProductID"];
            }
            else {
                Response.Cookies["ReturnSelf"].Value = "ShoppingCart.aspx";
            } 
            LoadShoppingCart();
            LoadPromotion();
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
        hpl2.Text = "Giỏ Hàng";
        hpl2.NavigateUrl = String.Format("~/ShoppingCart.aspx");
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
    public void LoadPromotion()
    {
        ProcessProduct processproduct = new ProcessProduct();
        Product product = new Product();
        DataSet ds = new DataSet();
        if (Request.QueryString["ProductID"] != null)
        {
            product.ProductID = int.Parse(Request.QueryString["ProductID"]);
        }
        try
        {
            ds = processproduct.ProductPromotionSelectData(product);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //panelPromotion.Visible = true;
                panelPromotion1.Visible = true;
                //gridviewAssociated.DataSource = ds;
                //gridviewAssociated.DataBind();
                datalistProductsPromotion.DataSource = ds;
                datalistProductsPromotion.DataBind();
            }
            else {
                //panelPromotion.Visible = false;
                panelPromotion1.Visible = false;
            
            }
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
            Response.Redirect("ErrorPage.aspx", false);
        }
    }
    public void LoadShoppingCart()
    {       
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        shoppingcart.CartGUID = KhoaY.Controller.Utilities.GetCartGUID();

        ProcessShoppingCart processgetcart = new ProcessShoppingCart();
        try { 
            DataSet ds = new DataSet();
            ds = processgetcart.ShoppingCartSelectData(shoppingcart.CartGUID);
            int total = 0;

            if (ds.Tables[0].Rows.Count == 0)
            {
                labelTotal.Text = "";
                //Button Check Disable when total price = 0
                commandCheckout.Enabled = false;
                PanelShoppingCart.Visible = false;
                panelResults.Visible = true;
                labelMessage.Text = "Không Có Dữ Liệu";
                //panelPromotion.Visible = false;
                panelPromotion1.Visible = false;
                //Response.Redirect("Default.aspx");
            }
            else {
                PanelShoppingCart.Visible = true;

                commandCheckout.Enabled = true;

            }
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {

                total += int.Parse(ds.Tables[0].Rows[i]["Quantity"].ToString());
            }
            //Add Total label cart;
            Label labelCart = (Label)Page.Master.FindControl("labelCart");
            labelCart.Text = total.ToString();
           
            gridviewShoppingCart.DataSource = ds;
            gridviewShoppingCart.DataBind();
          
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
            //Response.Redirect("ErrorPage.aspx", false);
        }
    }
    protected void gridviewShoppingCart_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            _totalcounter += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalPrice"));
        }
        labelTotal.Text = string.Format("{0:#,##0}", _totalcounter);
    }
    protected void commandContinueShopping_Click(object sender, EventArgs e)
    {
        Response.Cookies["ReturnSelf"].Value = "Default.aspx";
        Response.Redirect("Default.aspx",false);
    }
    public void Update(int id, int newqty)
    {
        ProcessShoppingCart processupdateshoppingcart = new ProcessShoppingCart();
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        //Check if quantity equal 0
        if (newqty == 0)
        {
            Delete(id);
            LoadShoppingCart();
            
        }
        else {
            shoppingcart.Quantity = newqty;
            shoppingcart.ShoppingCartID = id;
            try
            {
                processupdateshoppingcart.ShoppingCartUpdateData(shoppingcart);
            }
            catch (Exception ex)
            {
                //Response.Write(ex.ToString());
                KhoaY.Controller.Utilities.LogException(ex);
                //Response.Redirect("ErrorPage.aspx", false);
            }       
        }

        
    }
    public void Delete(int id) {
        ProcessShoppingCart processshoppingcart = new ProcessShoppingCart();
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        shoppingcart.ShoppingCartID = id;
        try
        {
            processshoppingcart.ShoppingCartDeleteData(shoppingcart);
            Response.Cookies["ReturnURL"].Value = "ShoppingCart.aspx";
            Response.Redirect("ShoppingCart.aspx", false);
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
            //Response.Redirect("ErrorPage.aspx", false);
        }
    }
    protected void commandUpdate_Click(object sender, EventArgs e)
    {
        try {
            foreach (GridViewRow row in gridviewShoppingCart.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    DataKey data = gridviewShoppingCart.DataKeys[row.DataItemIndex];

                    CheckBox check = (CheckBox)row.FindControl("checkboxDelete");

                    if (check.Checked)
                    {
                        Delete(int.Parse(data.Values["ShoppingCartID"].ToString()));
                    }

                    TextBox textNewQuantity = (TextBox)row.FindControl("textQuantity");
                    int integerNewQuantity = int.Parse(textNewQuantity.Text);
                    int integerOrigQuantity = int.Parse(gridviewShoppingCart.DataKeys[row.DataItemIndex].Value.ToString());

                    if (integerNewQuantity != integerOrigQuantity)
                    {
                        Update(int.Parse(data.Values["ShoppingCartID"].ToString()), integerNewQuantity);
                    }
                }
            }
        }
        catch (Exception ex) {
            KhoaY.Controller.Utilities.LogException(ex);
            Response.Redirect("ErrorPage.aspx", false);
     
        }
        

        LoadShoppingCart();

    }
    protected void commandCheckout_Click(object sender, EventArgs e)
    {

        Response.Cookies["ReturnURL"].Value = "CheckOut.aspx";
        if (CurrentEndUser == null)
        {            
            Response.Redirect("Login.aspx", false);
        }
        else
        {
            Response.Redirect("CheckOut.aspx", false);
        
        }
    }

    protected void commandExport_Click(object sender, EventArgs e)
    {
        CreatePDF("DANHSACHMUAHANG");
    }
    private void CreatePDF(string fileName)
    {
        //// Setup DataSet
        //MyDataSetTableAdapters.YourTableAdapterHere ds = new MyDataSetTableAdapters.YourTableAdapterHere();
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        shoppingcart.CartGUID = KhoaY.Controller.Utilities.GetCartGUID();

        ProcessShoppingCart processgetcart = new ProcessShoppingCart();
        DataSet ds = new DataSet();
        ds = processgetcart.ShoppingCartSelectData(shoppingcart.CartGUID);
       
      
        //// Create Report DataSource
        ReportDataSource rds = new ReportDataSource("DSShoppingCart", ds.Tables[0]);

        // Variables   
        Warning[] warnings;
        string[] streamIds;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;

        // Setup the report viewer object and get the array of bytes   
        ReportViewer viewer = new ReportViewer();
        viewer.ProcessingMode = ProcessingMode.Local;
        viewer.LocalReport.ReportPath = "ReportShoppingCart.rdlc";
        viewer.LocalReport.DataSources.Add(rds); // Add datasource here

        byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

        // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.   
        Response.Buffer = true;
        Response.Clear();
        Response.ContentType = mimeType;
        Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
        Response.BinaryWrite(bytes); // create the file   
        Response.Flush(); // send it to the client to download   
    }  
    

}