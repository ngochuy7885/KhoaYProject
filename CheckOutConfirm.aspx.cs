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

            //send email
            string emailheadtest = "KhoaY Thông Báo Hóa Đơn Của " + CurrentEndUser.LastName + " " + CurrentEndUser.FirstName + " " + CurrentEndUser.ContactInformation.Phone;
            string subjectmessage = "KhoaY Thông Báo Hóa Đơn Của " + CurrentEndUser.LastName + " " + CurrentEndUser.FirstName + " " + CurrentEndUser.ContactInformation.Phone;
            StringBuilder bodymessage = new StringBuilder();
            bodymessage.Append("<img src='https://dm2304files.storage.live.com/y4mXm84CpaOdlz67WNVBzqZ4XiWxPcERZ4V3ZONz7hjWcSnKgNgBKU_bqsLV4njMwlL4viF5z-gY7ocQM9y33vq_q1ICrDGsf7BrwIbnRNHuyFWQjKmoTKqTpdwlbUraCn1J-OvrGeM4uXq9LhDJIWZYMC2FSZ4pVeUzbUrTktvG_F0gJ3s6EGmItNzuRKYbwfg?width=155&height=63&cropmode=none' width='155' height='63' />");
            bodymessage.Append("<p></p>");
            bodymessage.Append(" <table style='width:100%' border='1'");
            bodymessage.Append("<tr>");
            bodymessage.Append("<th> Tên Sản Phẩm </th>");
            bodymessage.Append("<th> Số Lượng </th>");
            bodymessage.Append("<th> Đơn Vị Tính </th>");
            bodymessage.Append("<th> Giá </th>");
            bodymessage.Append("<th> Tổng Phụ </th>");
            bodymessage.Append("</tr>");


            foreach (Product product in CurrentOrder.OrderDetails.Products)
            {
                bodymessage.Append("<tr>");
                bodymessage.Append("<td style='text-align:left;'>");
                bodymessage.Append(product.ProductName);
                bodymessage.Append("</td>");
                
                bodymessage.Append("<td style='text-align:center;'>");
                bodymessage.Append(product.Quantity);
                bodymessage.Append("</td>");

                bodymessage.Append("<td style='text-align:center;'>");
                bodymessage.Append(product.ProductUnit.ProductUnitName);
                bodymessage.Append("</td>");


                bodymessage.Append("<td style='text-align:center;'>");
                decimal price = Convert.ToDecimal(Utilities.FormatMoney(product.Price.ToString()));

                //bodymessage.Append(String.Format("{0:#,##0}", price));
                bodymessage.Append(String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", price ) );

                bodymessage.Append("</td>");
                bodymessage.Append("<td style='text-align:center;'>");
                decimal total = product.Quantity * product.Price;
                total = Convert.ToDecimal(Utilities.FormatMoney(total.ToString()));

                //bodymessage.Append(String.Format("{0:#,##0}", total));
                bodymessage.Append(String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", total ) );


                bodymessage.Append("</td>");
                bodymessage.Append("</tr>");


            }
            bodymessage.Append("</table>");
            bodymessage.Append("<p></p>");
            decimal temp = Convert.ToDecimal(Utilities.FormatMoney(CurrentOrder.SubTotal.ToString()));
            bodymessage.Append("Tổng tiền số hóa đơn này là: <strong> " + String.Format(new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", temp) + " VNĐ" + " </strong>");
        
            try {
              

                OrderInsertTransaction ordertransaction = new OrderInsertTransaction();
                CurrentOrder.OrderID = ordertransaction.Begin(CurrentOrder);
                bodymessage.Append("<p></p>");
                bodymessage.Append("Số hóa đơn này là: <strong> " + CurrentOrder.OrderID + " </strong>");
                //Utilities.SendMessage("ngochuy7885@gmail.com,hinhmaythangio14@gmail.com,huy7885@gmail.com", emailheadtest, subjectmessage, bodymessage.ToString());   
                //Utilities.SendMessageMultipleEmail("huy7885@gmail.com,ngochuy7885@gmail.com", emailheadtest, subjectmessage, bodymessage.ToString());
                Utilities.MultipleEmail_Without_Attachment("huy7885@gmail.com,ngochuy7885@gmail.com", subjectmessage, bodymessage.ToString());
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