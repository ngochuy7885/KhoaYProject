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
        if (!IsPostBack)
        {

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
                //panelPromotion1.Visible = true;
                //gridviewAssociated.DataSource = ds;
                //gridviewAssociated.DataBind();
                //datalistProductsPromotion.DataSource = ds;
                //datalistProductsPromotion.DataBind();
            }
            else
            {
                //panelPromotion.Visible = false;
                //panelPromotion1.Visible = false;

            }
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
            Response.Redirect("ErrorPage.aspx", false);
        }
    }
    public void LoadShoppingCartNoColor()
    {
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        shoppingcart.CartGUID = KhoaY.Controller.Utilities.GetCartGUID();

        ProcessShoppingCart processgetcart = new ProcessShoppingCart();
        try
        {
            int total = 0;
            DataSet ds = new DataSet();
            ds = processgetcart.ShoppingCartSelectData(shoppingcart.CartGUID);


            if (ds.Tables[0].Rows.Count == 0)
            {
                labelTotal.Text = "";
                //Button Check Disable when total price = 0
                commandCheckout.Enabled = false;
                PanelShoppingCart.Visible = false;
                panelResults.Visible = true;
                labelMessage.Text = "Không Có Dữ Liệu";
                //panelPromotion.Visible = false;
                //panelPromotion1.Visible = false;
                //Response.Redirect("Default.aspx");
            }
            else
            {
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
    public void LoadShoppingCart()
    {
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        shoppingcart.CartGUID = KhoaY.Controller.Utilities.GetCartGUID();

        ProcessShoppingCart processgetcart = new ProcessShoppingCart();
        try
        {
            int total = 0;
            DataSet ds = new DataSet();
            ds = processgetcart.ShoppingCartSelectData(shoppingcart.CartGUID);


            if (ds.Tables[0].Rows.Count == 0)
            {
                labelTotal.Text = "";
                //Button Check Disable when total price = 0
                commandCheckout.Enabled = false;
                PanelShoppingCart.Visible = false;
                panelResults.Visible = true;
                labelMessage.Text = "Không Có Dữ Liệu";
                //panelPromotion.Visible = false;
                //panelPromotion1.Visible = false;
                //Response.Redirect("Default.aspx");
            }
            else
            {
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
            SetFocus();

        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
            //Response.Redirect("ErrorPage.aspx", false);
        }
    }
    public static TextBox textNewQuantity;
    public void SetFocus()
    {
        foreach (GridViewRow row in gridviewShoppingCart.Rows)
        {
            row.BackColor = System.Drawing.Color.White;
            if (Request.QueryString["ProductID"] != null)
            {
                DataKey data = gridviewShoppingCart.DataKeys[row.DataItemIndex];
                //int CategoryId = int.Parse(Popup.DataKeys[row.RowIndex].Value.ToString());
                int ProductID = int.Parse(data.Values["ProductID"].ToString());
                if (ProductID == int.Parse(Request.QueryString["ProductID"]))
                {
                    //textNewQuantity = (TextBox)row.FindControl("textQuantity");
                    //textNewQuantity.Focus();
                    //row.BackColor = System.Drawing.Color.Silver;
                    row.BackColor = System.Drawing.Color.FromName("#e4ebf3");
                    return;
                }


            }
            else
            {
                //Get last rows
                int lastrowindex = gridviewShoppingCart.Rows.Count - 1;
                gridviewShoppingCart.Rows[lastrowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");
                //gridviewShoppingCart.Rows[lastrowindex].BackColor = System.Drawing.Color.Silver;
                // gridviewShoppingCart.Rows[lastrowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3"); 
                //textNewQuantity = (TextBox)gridviewShoppingCart.Rows[lastrowindex].FindControl("textQuantity");
                //textNewQuantity.Focus();
            }
        }

    }

    protected void gridviewShoppingCart_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            _totalcounter += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalPrice"));



        }
        labelTotal.Text = string.Format(new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", _totalcounter);
    }
    protected void commandContinueShopping_Click(object sender, EventArgs e)
    {
        Response.Cookies["ReturnSelf"].Value = "Default.aspx";
        Response.Redirect("Default.aspx", false);
    }
    public void Update(int id, int newqty)
    {
        ProcessShoppingCart processupdateshoppingcart = new ProcessShoppingCart();
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        //Check if quantity equal 0
        if (newqty == 0)
        {
            Delete(id);
            LoadShoppingCartNoColor();

        }
        else
        {
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
    public void Delete(int id)
    {
        ProcessShoppingCart processshoppingcart = new ProcessShoppingCart();
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        shoppingcart.ShoppingCartID = id;
        try
        {
            processshoppingcart.ShoppingCartDeleteData(shoppingcart);
            Response.Cookies["ReturnURL"].Value = "ShoppingCart.aspx";
            //LoadShoppingCart();
            //Response.Redirect("ShoppingCart.aspx", false);
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
            //Response.Redirect("ErrorPage.aspx", false);
        }
    }
    public static List<Int32> rowindexs = new List<int>(200);
    public static List<Int32> updaterowindexs = new List<int>(200);
    public static List<Int32> deleterowindexs = new List<int>(200);

    protected void commandUpdate_Click(object sender, EventArgs e)
    {

        try
        {

            //Check Quantity equal 0
            foreach (GridViewRow row1 in gridviewShoppingCart.Rows)
            {
                if (row1.RowType == DataControlRowType.DataRow)
                {
                    TextBox textNewQuantity1 = (TextBox)row1.FindControl("textQuantity");
                    if (textNewQuantity1.Text == "")
                    {
                        
                        LoadShoppingCartNoColor();
                        if (gridviewShoppingCart.Rows.Count >= 1)
                        {
                            int lastrowindex = gridviewShoppingCart.Rows.Count - 1;
                            gridviewShoppingCart.Rows[lastrowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");
                        }

                        return;
                    }

                    DataKey data1 = gridviewShoppingCart.DataKeys[row1.DataItemIndex];
                    int integerNewQuantity1 = int.Parse(textNewQuantity1.Text);
                    int integerOrigQuantity1 = int.Parse(gridviewShoppingCart.DataKeys[row1.DataItemIndex].Value.ToString());

                    if (integerNewQuantity1 == 0)
                    {
                        //Delete(int.Parse(data1.Values["ShoppingCartID"].ToString()));
                        LoadShoppingCartNoColor();
                        if (gridviewShoppingCart.Rows.Count >= 1)
                        {
                            int lastrowindex = gridviewShoppingCart.Rows.Count - 1;
                            gridviewShoppingCart.Rows[lastrowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");
                        }

                        return;
                    }
                }



            }

            //End Check

            foreach (GridViewRow row in gridviewShoppingCart.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    rowindexs.Add(row.RowIndex);
                    DataKey data = gridviewShoppingCart.DataKeys[row.DataItemIndex];

                    CheckBox check = (CheckBox)row.FindControl("checkboxDelete");
                    TextBox textNewQuantity = (TextBox)row.FindControl("textQuantity");
                    int integerNewQuantity = int.Parse(textNewQuantity.Text);
                    int integerOrigQuantity = int.Parse(gridviewShoppingCart.DataKeys[row.DataItemIndex].Value.ToString());


                    if (check.Checked)
                    {
                        Delete(int.Parse(data.Values["ShoppingCartID"].ToString()));
                        deleterowindexs.Add(row.RowIndex);

                    }

                    if (integerNewQuantity != integerOrigQuantity)
                    {

                        Update(int.Parse(data.Values["ShoppingCartID"].ToString()), integerNewQuantity);

                        //Set Focus
                        if (deleterowindexs.Count > 0)
                        {
                            updaterowindexs.Add(row.RowIndex - deleterowindexs.Count);
                        }
                        else
                        {
                            updaterowindexs.Add(row.RowIndex);
                        }
                        //End Focus

                    }

                }
            }
            LoadShoppingCartNoColor();

            foreach (GridViewRow row in gridviewShoppingCart.Rows)
            {

                if (Request.QueryString["ProductID"] != null)
                {
                    DataKey data = gridviewShoppingCart.DataKeys[row.DataItemIndex];
                    int ProductID = int.Parse(data.Values["ProductID"].ToString());
                    if (ProductID == int.Parse(Request.QueryString["ProductID"]))
                    {
                        row.BackColor = System.Drawing.Color.White;

                    }
                    //Color all row into white       
                    foreach (GridViewRow row1 in gridviewShoppingCart.Rows)
                    {
                        row1.BackColor = System.Drawing.Color.White;
                    }
                    //if update and delete action
                    if (updaterowindexs.Count > 0 && deleterowindexs.Count > 0)
                    {

                        //Color all row into white       
                        foreach (GridViewRow row1 in gridviewShoppingCart.Rows)
                        {
                            row1.BackColor = System.Drawing.Color.White;
                        }

                        foreach (var updaterowindex in updaterowindexs)
                        {
                            //int lastrowindex = gridviewShoppingCart.Rows.Count - 1;
                            //gridviewShoppingCart.Rows[lastrowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");

                            //Color Updated Row
                            if (updaterowindex >= 0)
                                gridviewShoppingCart.Rows[updaterowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");



                        }


                    }

                    //If delete action
                    else if (deleterowindexs.Count > 0)
                    {
                        foreach (var deleterowindex in deleterowindexs)
                        {
                            gridviewShoppingCart.DeleteRow(deleterowindex);
                        }
                        int lastrowindex = gridviewShoppingCart.Rows.Count - 1;
                        gridviewShoppingCart.Rows[lastrowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");
                    }
                    //If update action
                    else if (updaterowindexs.Count > 0)
                    {
                        foreach (var updaterowindex in updaterowindexs)
                            gridviewShoppingCart.Rows[updaterowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");

                    }
                    //Do nothing when click update button
                    else
                    {
                        int lastrowindex = gridviewShoppingCart.Rows.Count - 1;
                        gridviewShoppingCart.Rows[lastrowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");

                    }
                }

                else
                {
                    //Color all row into white       
                    foreach (GridViewRow row1 in gridviewShoppingCart.Rows)
                    {
                        row1.BackColor = System.Drawing.Color.White;
                    }
                    //if update and delete action
                    if (updaterowindexs.Count > 0 && deleterowindexs.Count > 0)
                    {
                        foreach (var deleterowindex in deleterowindexs)
                        {
                            gridviewShoppingCart.DeleteRow(deleterowindex);
                        }
                        //Color all row into white       
                        foreach (GridViewRow row1 in gridviewShoppingCart.Rows)
                        {
                            row1.BackColor = System.Drawing.Color.White;
                        }

                        foreach (var updaterowindex in updaterowindexs)
                        {
                            //int lastrowindex = gridviewShoppingCart.Rows.Count - 1;
                            //gridviewShoppingCart.Rows[lastrowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");

                            //Color Updated Row
                            if (updaterowindex >= 0)
                                gridviewShoppingCart.Rows[updaterowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");


                        }


                    }

                    //If delete action
                    else if (deleterowindexs.Count > 0)
                    {
                        foreach (var deleterowindex in deleterowindexs)
                        {
                            gridviewShoppingCart.DeleteRow(deleterowindex);
                        }
                        int lastrowindex = gridviewShoppingCart.Rows.Count - 1;
                        gridviewShoppingCart.Rows[lastrowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");
                    }
                    //If update action
                    else if (updaterowindexs.Count > 0)
                    {
                        foreach (var updaterowindex in updaterowindexs)
                            gridviewShoppingCart.Rows[updaterowindex].BackColor = System.Drawing.Color.FromName("#e4ebf3");

                    }

                    //int lastrowindex = gridviewShoppingCart.Rows.Count - 1;
                    //gridviewShoppingCart.Rows[lastrowindex].BackColor = System.Drawing.Color.White;


                }


            }
            updaterowindexs.Clear();
            deleterowindexs.Clear();
            rowindexs.Clear();

            //Set Css for update badage and textbox search
            Label labelCart1 = (Label)Page.Master.FindControl("labelCart");
            int total = int.Parse(labelCart1.Text);
            TextBox txtSearch = (TextBox)Page.Master.FindControl("txtProductSearch");
            if (total > 0 && total < 1000)
            {
                txtSearch.CssClass = "form-control searchmarginleft1";
            }
            if (total > 1000) {

                txtSearch.CssClass = "form-control searchmarginleft5";
                
            }
            
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
            Response.Redirect("ErrorPage.aspx", false);

        }

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


    protected void gridviewShoppingCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}