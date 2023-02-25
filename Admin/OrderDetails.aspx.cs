using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using KhoaY.Model;
using System.Text.RegularExpressions;
using System.Data.SqlTypes;
using System.Globalization;
using System.Web.UI.HtmlControls;
public partial class Admin_OrderDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //calendarDatePicker.SelectedDate = DateTime.Today;
            //textShippedDate.Text = DateTime.Today.ToShortDateString();
            LoadOrderStatus();
            LoadOrderDetails();
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
        hpl2.NavigateUrl = "Orders.aspx";
        
        hpl3.Text = "Chi Tiết Hóa Đơn";
        hpl3.Style.Add("Color", "silver");
        hpl3.Enabled = false;

        hpl4.Text = "";
        hpl5.Text = "";
        hpl6.Text = "";

        li1.Attributes["class"] = "breadcrumb-item";
        li2.Attributes["class"] = "breadcrumb-item";
        li3.Attributes["class"] = "breadcrumb-item";
        li4.Attributes["class"] = "";
        li5.Attributes["class"] = "";
        li6.Attributes["class"] = "";

    }
    public void LoadOrderDetails()
    {
        try
        {
            ProcessOrderDetails processorderdetails = new ProcessOrderDetails();
            KhoaY.Controller.ProcesssOrders processorder = new ProcesssOrders();

            OrderDetails orderdetails = new OrderDetails();
            if (Request.QueryString["OrderID"] == null)
            {
                Response.Redirect("Orders.aspx",false);
            }
            orderdetails.OrderID = int.Parse(Request.QueryString["OrderID"]);
            //orderdetails = processorderdetails.OrderDetailsSelectData(orderdetails.OrderID);

            Orders orders = new Orders();
            orders.OrderID = int.Parse(Request.QueryString["OrderID"]);
            orders = processorder.OrderSelectOrderByIDData(int.Parse(Request.QueryString["OrderID"]));


            gridviewOrderDetailsProducts.DataSource = processorderdetails.OrderDetailsSelectData(orderdetails);
            gridviewOrderDetailsProducts.DataBind();

            labelOrderID.Text = Request.QueryString["OrderID"].ToString();
            if (orders.ShipDate != DateTime.MinValue)
            {
                //textShippedDate.Text = orders.ShipDate.ToString("dd/MM/yyyy HH:mm:ss");
                if (orders.ShipDate.ToString("dd/MM/yyyy") == "01/01/1900")
                    textShippedDate.Text = "";
                else
                { 
                    textShippedDate.Text = orders.ShipDate.ToString("dd/MM/yyyy"); 
                }
            }
            ////else {
            ////    textShippedDate.Text = DateTime.Now.ToString();
            ////}


            textTrackingNumber.Text = orders.TrackingNumber;
            dropdownlistOrderStatus.SelectedIndex = dropdownlistOrderStatus.Items.IndexOf(dropdownlistOrderStatus.Items.FindByValue(orders.OrderStatusID.ToString()));
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }

    }
    public void LoadOrderStatus()
    {
        KhoaY.Controller.ProcessOrderStatus processorderstatus = new KhoaY.Controller.ProcessOrderStatus();
        try
        {
            dropdownlistOrderStatus.DataTextField = "OrderStatusName";
            dropdownlistOrderStatus.DataValueField = "OrderStatusID";
            dropdownlistOrderStatus.DataSource = processorderstatus.OrderStatusSelectData();
            dropdownlistOrderStatus.DataBind();
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
    protected void commandReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Orders.aspx",false);
    }
    protected void calendarDatePicker_SelectionChanged(object sender, EventArgs e)
    {
        //DateTime time = DateTime.Parse(calendarDatePicker.SelectedDate.ToString("dd/MM/yyyy"));
        //if (time.ToShortDateString() == DateTime.Now.ToShortDateString())
        //{
        //    textShippedDate.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"); //tt AM or PM
        //}
        //else
        //{
        //    textShippedDate.Text = calendarDatePicker.SelectedDate.ToShortDateString() + " 12:00:00";
        //}
        //textShippedDate.Text = calendarDatePicker.SelectedDate.ToString("dd/MM/yyyy hh:mm:ss");
        textShippedDate.Text = calendarDatePicker.SelectedDate.ToShortDateString();

        calendarDatePicker.Visible = false;
    }
    protected void imagebuttonDatePicker_Click(object sender, ImageClickEventArgs e)
    {
        if (calendarDatePicker.Visible)
        {
            calendarDatePicker.Visible = false;
        }
        else
        {

            calendarDatePicker.Visible = true;
        }

    }
    protected void commandUpdate_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try
            {
                Orders orders = new Orders();
                KhoaY.Controller.ProcesssOrders processorders = new KhoaY.Controller.ProcesssOrders();

                orders.OrderID = int.Parse(Request.QueryString["OrderID"]);
                orders.OrderStatusID = int.Parse(dropdownlistOrderStatus.SelectedItem.Value);

                //If pending status, shipped date return null
                //if (int.Parse(dropdownlistOrderStatus.SelectedItem.Value) == 1) {
                //    orders.ShipDate = (DateTime)SqlDateTime.Null;
                //}
                //else 
                if (textShippedDate.Text.Length == 0)
                {
                    orders.ShipDate = (DateTime)SqlDateTime.Null;
                }
                else {
                    orders.ShipDate = Convert.ToDateTime(textShippedDate.Text);
                    //if (Convert.ToDateTime(textShippedDate.Text).ToString("dd/MM/yyyy HH:mm:ss") == DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss")){
                    //    orders.ShipDate = Convert.ToDateTime(textShippedDate.Text);
                    //}
                    //else {
                    //    orders.ShipDate = Convert.ToDateTime(textShippedDate.Text + " 12:00:00");
                    //}
                    
                }
                
                orders.TrackingNumber = textTrackingNumber.Text;

                processorders.OrderUpdateData(orders);
                //Informing Customer by email

                string email = Request.QueryString["Email"].ToString();
                string emailheadtest = "KhoaY Cập Nhập Hóa Đơn của Bạn";
                string subjectmessage = "KhoaY cập nhập - Hóa Đơn ID: " + orders.OrderID;
                string bodymessage = "Hóa Đơn của bạn đã được cập nhật. Xin vui lòng đăng nhập để biết thêm chi tiết";
                Utilities.SendMessageMultipleEmail(email, emailheadtest, subjectmessage, bodymessage.ToString());

                Response.Redirect("Orders.aspx",false);

            }
            catch (Exception ex)
            {
                // Response.Write(ex.ToString());
                //lblMessage.Text = ex.ToString();
                KhoaY.Controller.Utilities.LogException(ex);
            }
        }

    }
    protected void customValidatorShippedDate_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (textShippedDate.Text.Length == 0)
        {
            args.IsValid = false;
            return;
        }
        
        //string pattern = "^(0[1-9]|[12][0-9]|3[01])[/](0[1-9]|1[012])[/](19|20)[0-9]{2}$";
        //string r = "(0{0,1}[1-9])|(1/d)|(2/d)|(3[0-1])/(0{0,1}[1-9])|(1[0-2])/([1-9]/d):(0{0,1}/d)|(1/d)|(2[0-4]):(0{0,1}/d)|([1-5]/d)";

        //Match match = Regex.Match(textShippedDate.Text, r);
        //if (match.Success)
        //    args.IsValid = true;
        //else
        //    args.IsValid = false;
        string date = textShippedDate.Text;
        string pattern = "dd/MM/yyyy";
        DateTime parsedDate;
        bool test = DateTime.TryParseExact(date, pattern,
                                          CultureInfo.InvariantCulture,
                                          DateTimeStyles.None, out parsedDate);
        if (test) {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }        
    }
    protected void commandRefund_Click(object sender, EventArgs e)
    {
        Orders orders = new Orders();
        ProcesssOrders processorder = new ProcesssOrders();

        int refundstatustype = 3;

        orders.OrderID = int.Parse(Request.QueryString["OrderID"]);
        orders.OrderStatusID = refundstatustype;
        orders.ShipDate = (DateTime)SqlDateTime.Null;
        try
        {
            processorder.OrderUpdateData(orders);
            //Informing Customer by email
            string email = Request.QueryString["Email"].ToString();
            //string emailheadtest = "KhoaY Cập Nhập Hóa Đơn của Bạn";
            string subjectmessage = "KhoaY cập nhập - Hóa Đơn ID: " + orders.OrderID;
            string bodymessage = "Hóa Đơn của bạn đã được hoàn trả lại. Xin vui lòng đăng nhập để biết chi tiết";
            //Utilities.SendMessageMultipleEmail(email, emailheadtest, subjectmessage, bodymessage.ToString());
            Utilities.MultipleEmail_Without_Attachment(email, subjectmessage, bodymessage.ToString());
            Response.Redirect("Orders.aspx",false);
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
}