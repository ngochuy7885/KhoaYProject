using KhoaY.Controller;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Model;
using System.Text;
using System.Web.UI.HtmlControls;
using Microsoft.Reporting.WebForms;
public partial class CheckOutConfirm : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Xu ly vo luon thang trang
            if (CurrentEndUser == null)
            {
                Response.Redirect("Default.aspx");
            }

            LoadInformation();
            LoadShoppingCart();
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
        hpl3.Text = "Đăng Nhập";
        hpl3.NavigateUrl = String.Format("~/Login.aspx");
        hpl4.Text = "Tính Tiền";
        hpl4.NavigateUrl = String.Format("~/CheckOut.aspx");
        hpl5.Text = "Xác Nhận Hóa Đơn";
        hpl5.NavigateUrl = String.Format("~/CheckOutConfirm.aspx");
        hpl6.Text = "";
       
        li1.Attributes["class"] = "breadcrumb-item";
        li2.Attributes["class"] = "breadcrumb-item";
        li3.Attributes["class"] = "breadcrumb-item";
        li4.Attributes["class"] = "breadcrumb-item";
        li5.Attributes["class"] = "breadcrumb-item";
        li6.Attributes["class"] = "";

    }
    public void LoadInformation() {
        textFirstName.Text = base.CurrentEndUser.FirstName;
        textLastName.Text = base.CurrentEndUser.LastName;
        textAddress1.Text = base.CurrentEndUser.Address.AddressLine;
        textAddress2.Text = base.CurrentEndUser.Address.AddressLine2;
        textCity.Text = base.CurrentEndUser.Address.City;
        textState.Text = base.CurrentEndUser.Address.State;
        textPostalCode.Text = base.CurrentEndUser.Address.PostalCode;
         textPhone1.Text = base.CurrentEndUser.ContactInformation.Phone;
        textPhone2.Text = base.CurrentEndUser.ContactInformation.Phone2;


        labelSubTotal.Text = String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", base.CurrentOrder.SubTotal );
    }
    private void LoadShoppingCart()
    {
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        shoppingcart.CartGUID = Utilities.GetCartGUID();

        ProcessShoppingCart processgetcart = new ProcessShoppingCart();
        try
        {
            DataSet ds = new DataSet();
            ds = processgetcart.ShoppingCartSelectData(shoppingcart.CartGUID);
            
            // Shopping Cart has no row, back to default.aspx
            if (ds.Tables[0].Rows.Count == 0)
            {
                labelSubTotal.Text = "";
                Response.Cookies["ReturnURL"].Value = "Default.aspx";
                Response.Redirect("Default.aspx");
            }
            gridviewShoppingCart.DataSource = ds;
            gridviewShoppingCart.DataBind();

        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }

    protected void commandConfirm_Click(object sender, EventArgs e)
    {
        Product[] prods = new Product[ gridviewShoppingCart.Rows.Count ];
            foreach ( GridViewRow grow in gridviewShoppingCart.Rows )
            {
                if ( grow.RowType == DataControlRowType.DataRow )
                {
                    Product prod = new Product();
                    DataKey data = gridviewShoppingCart.DataKeys[grow.DataItemIndex ];
                    prod.ProductID = int.Parse( data.Values["ProductID"].ToString() );

                    Label labelProductName = ( Label ) grow.FindControl( "labelProductName" );
                    prod.ProductName = labelProductName.Text;

                    Label labelQuantity = (Label ) grow.FindControl("labelQuantity" );
                    prod.Quantity= int.Parse( labelQuantity.Text );

                    Label labelProductUnitName = (Label)grow.FindControl("labelProductUnitName");
                    prod.ProductUnit.ProductUnitName = labelProductUnitName.Text;
                    

                    Label labelUnitPrice = (Label ) grow.FindControl("labelUnitPrice");
                    labelUnitPrice.Text = labelUnitPrice.Text.Replace( "." , "" );
                    prod.Price = Convert.ToDecimal( labelUnitPrice.Text );

                    prods.SetValue( prod , grow.DataItemIndex );
                }
            }

            CurrentOrder.OrderDetails.Products = prods;
            //CurrentOrder.SubTotal = Convert.ToDecimal(labelSubTotal.Text);
            labelSubTotal.Text = labelSubTotal.Text.Replace(".", "");
            CurrentOrder.SubTotal = Convert.ToDecimal(labelSubTotal.Text);
            CurrentOrder.EndUserID = CurrentEndUser.EndUserID;
            CurrentOrder.OrderDetails.Products = prods;

            
            try {
              
                OrderInsertTransaction ordertransaction = new OrderInsertTransaction();
                CurrentOrder.OrderID = ordertransaction.Begin(CurrentOrder);
               

                //Send Order
                ProcesssOrders processorders = new KhoaY.Controller.ProcesssOrders();
                DataSet ds = processorders.OrderSelectByOrderID(CurrentOrder.OrderID);

                if (ds.Tables[0].Rows.Count > 0)
                {

                    //// Create Report DataSource
                    ReportDataSource rds = new ReportDataSource("DSOrderKhoaY2", ds.Tables[0]);

                    // Variables   
                    Warning[] warnings;
                    string[] streamIds;
                    string mimeType = string.Empty;
                    string encoding = string.Empty;
                    string extension = string.Empty;

                    // Setup the report viewer object and get the array of bytes   
                    ReportViewer viewer = new ReportViewer();
                    viewer.ProcessingMode = ProcessingMode.Local;
                    viewer.LocalReport.ReportPath = "Admin/ReportOrderKhoaY3.rdlc";
                    viewer.LocalReport.DataSources.Add(rds); // Add datasource here

                    byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

                    // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.   
                    Response.Buffer = true;
                    Response.Clear();
                    Response.ContentType = mimeType;
                    string fileName = "HoaDon";
                    Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
                    //Response.BinaryWrite(bytes); // create the file

                    string FileNameSave = Server.MapPath("HoaDon.pdf");
                    string NameOfFile = "HoaDon_" + CurrentOrder.OrderID + ".pdf";
                    string emailto = "huy7885@gmail.com,ngochuy7885@gmail.com," +  CurrentEndUser.ContactInformation.Email;

                    // Setup the report viewer object and get the array of bytes   
                    ReportViewer viewer1 = new ReportViewer();
                    viewer1.ProcessingMode = ProcessingMode.Local;
                    viewer1.LocalReport.ReportPath = "Admin/ReportOrderKhoaY3A5Size.rdlc";
                    viewer1.LocalReport.DataSources.Add(rds); // Add datasource here

                    byte[] bytes1 = viewer1.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

                    // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.   
                    Response.Buffer = true;
                    Response.Clear();
                    Response.ContentType = mimeType;
                    string fileName1 = "HoaDon";
                    Response.AddHeader("content-disposition", "attachment; filename=" + fileName1 + "." + extension);
                    //Response.BinaryWrite(bytes); // create the file

                    string FileNameSave1 = Server.MapPath("HoaDon.pdf");
                    string NameOfFile1 = "HoaDon_" + CurrentOrder.OrderID + "_" + "A5Szie" + ".pdf";
                    string emailto1 = "huy7885@gmail.com,ngochuy7885@gmail.com," + CurrentEndUser.ContactInformation.Email;


                    //KhoaY.Controller.Utilities.SendMessageWithAttachment(emailto, bytes, NameOfFile, "Hóa Đơn_" + CurrentOrder.OrderID.ToString(), "Xin Vui Lòng Tải Xuống Hóa Đơn");
                    KhoaY.Controller.Utilities.SendMessageWithMultipleAttachment(emailto, bytes, bytes1, NameOfFile,NameOfFile1, "Hóa Đơn_" + CurrentOrder.OrderID.ToString(), "Xin Vui Lòng Tải Xuống Hóa Đơn");
                    
                    //System.GC.Collect();
                    //System.GC.WaitForPendingFinalizers();

                }
                
                //Utilities.MultipleEmail_Without_Attachment("huy7885@gmail.com,ngochuy7885@gmail.com", subjectmessage, bodymessage.ToString());
                //Utilities.SendMessageV1("huy7885@gmail.com","huy7885@gmail.com",emailheadtest, subjectmessage, bodymessage.ToString());
                Response.Redirect("CheckOutReceipt.aspx",false);
            
            }
            catch (Exception ex) {
                //Response.Write(ex.ToString());
                //labelMessage.Text = ex.ToString();
                KhoaY.Controller.Utilities.LogException(ex);
            }
        

    }
    protected void commandEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckOut.aspx");
    }
}