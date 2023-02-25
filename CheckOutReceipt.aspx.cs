using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using KhoaY.Model;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Data;
public partial class CheckOutReceipt : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            Response.Cookies["ReturnSelf"].Value = "CheckOutReceipt.aspx";
            if (Request.Cookies["KhoaY"] != null)
            {
                Response.Cookies["KhoaY"].Expires = DateTime.Now.AddDays(-1);
                //Update shopping cart quantity state
                Session["UpdateCartExpire"] = "Expire";
            }         
            SubmitOrder();
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
        hpl6.Text = "Xuất Hóa Đơn";
        hpl6.NavigateUrl = String.Format("~/CheckoutReceipt.aspx");

        li1.Attributes["class"] = "breadcrumb-item";
        li2.Attributes["class"] = "breadcrumb-item";
        li3.Attributes["class"] = "breadcrumb-item";
        li4.Attributes["class"] = "breadcrumb-item";
        li5.Attributes["class"] = "breadcrumb-item";
        li6.Attributes["class"] = "breadcrumb-item";

    }
    public void SubmitOrder()
    {
        if (CurrentOrder == null)
        {
            Response.Cookies["ReturnURL"].Value = "Default.aspx";
            Response.Redirect("Default.aspx");
        }
        panelSuccess.Visible = true;
        labelOrderID.Text = CurrentOrder.OrderID.ToString();
        decimal temp = Convert.ToDecimal(Utilities.FormatMoney(CurrentOrder.SubTotal.ToString()));
        //labelOrderTotal.Text = String.Format("{0:#,##0}", temp) + "VNĐ";
        labelOrderTotal.Text = String.Format(new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", temp) + " VNĐ";
        labelOrderID.Text = CurrentOrder.OrderID.ToString();
             
        ////send email
        //string emailheadtest = "KhoaY Thông Báo Hóa Đơn Của " + CurrentEndUser.LastName + " " + CurrentEndUser.FirstName;
        //string subjectmessage = "KhoaY Thông Báo Hóa Đơn Của " + CurrentEndUser.LastName + " " + CurrentEndUser.FirstName;
        //StringBuilder bodymessage = new StringBuilder();
        //bodymessage.Append("<img src='https://dm2304files.storage.live.com/y4mXm84CpaOdlz67WNVBzqZ4XiWxPcERZ4V3ZONz7hjWcSnKgNgBKU_bqsLV4njMwlL4viF5z-gY7ocQM9y33vq_q1ICrDGsf7BrwIbnRNHuyFWQjKmoTKqTpdwlbUraCn1J-OvrGeM4uXq9LhDJIWZYMC2FSZ4pVeUzbUrTktvG_F0gJ3s6EGmItNzuRKYbwfg?width=155&height=63&cropmode=none' width='155' height='63' />");
        //bodymessage.Append("<p></p>");
        //bodymessage.Append(" <table style='width:100%' border='1'");
        //bodymessage.Append("<tr>");
        //bodymessage.Append("<th> Tên Sản Phẩm </th>");
        //bodymessage.Append("<th> Số Lượng </th>");
        //bodymessage.Append("<th> Giá </th>");
        //bodymessage.Append("<th> Tổng Phụ </th>");
        //bodymessage.Append("</tr>");
       
      
        //foreach (Product product in CurrentOrder.OrderDetails.Products)
        //{
        //    bodymessage.Append("<tr>");
        //    bodymessage.Append("<td style='text-align:center;'>");
        //    bodymessage.Append(product.ProductName);
        //    bodymessage.Append("</td>");
        //    bodymessage.Append("<td style='text-align:center;'>");
        //    bodymessage.Append(product.Quantity);
        //    bodymessage.Append("</td>");
        //    bodymessage.Append("<td style='text-align:center;'>");
        //    decimal price = Convert.ToDecimal(Utilities.FormatMoney(product.Price.ToString()));
                  
        //    bodymessage.Append(String.Format("{0:#,##0}", price));
        //    bodymessage.Append("</td>");
        //    bodymessage.Append("<td style='text-align:center;'>");
        //    decimal total = product.Quantity * product.Price;
        //    total = Convert.ToDecimal(Utilities.FormatMoney(total.ToString()));
        //    bodymessage.Append(String.Format("{0:#,##0}", total));
        //    bodymessage.Append("</td>");
        //    bodymessage.Append("</tr>");
                    
       
        //}
        //bodymessage.Append("</table>");
        //bodymessage.Append("<p></p>");
        //bodymessage.Append("Tổng tiền số hóa đơn này là: <strong> " + labelOrderTotal.Text + " </strong>");
        
        try
        {
             //OrderInsertTransaction ordertransaction = new OrderInsertTransaction();
             //CurrentOrder.OrderID = ordertransaction.Begin(CurrentOrder);
            //bodymessage.Append("<p></p>");      
             //bodymessage.Append("Số hóa đơn này là: <strong> " + labelOrderID.Text + " </strong>");    
             //Utilities.SendMessage("ngochuy7885@gmail.com,hinhmaythangio14@gmail.com,huy7885@gmail.com", emailheadtest, subjectmessage, bodymessage.ToString());
        
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
            panelFailure.Visible = true;
            labelErrorMessage.Text = ex.ToString();
        }
    }
    
}