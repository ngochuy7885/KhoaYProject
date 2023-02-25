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
public partial class CheckOut : BasePage
{
    decimal _totalcounter;
    protected void Page_Load(object sender, EventArgs e)
    {
        EndUser enduser = new EndUser();
        enduser = CurrentEndUser;
        Response.Cookies["ReturnSelf"].Value = "CheckOut.aspx";

        
        if (!IsPostBack) {
            if (CurrentEndUser == null)
            {
                Response.Redirect("Default.aspx");
            }
            LoadShoppingCart();
            LoadInformation();
            LoadNavigation();
            
        }
        //labelMessage.Text = enduser.FirstName + enduser.LastName;
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
        hpl5.Text = "";
        hpl6.Text = "";

        li1.Attributes["class"] = "breadcrumb-item";
        li2.Attributes["class"] = "breadcrumb-item";
        li3.Attributes["class"] = "breadcrumb-item";
        li4.Attributes["class"] = "breadcrumb-item";
        li5.Attributes["class"] = "";
        li6.Attributes["class"] = "";        

    }
    private void LoadInformation(){
        textFirstName.Text = base.CurrentEndUser.FirstName;
        textLastName.Text = base.CurrentEndUser.LastName;
        textAddress.Text = base.CurrentEndUser.Address.AddressLine;
        textAddress2.Text = base.CurrentEndUser.Address.AddressLine2;
        textCity.Text = base.CurrentEndUser.Address.City;
        textState.Text = base.CurrentEndUser.Address.State;
        textPostalCode.Text = base.CurrentEndUser.Address.PostalCode;
        textPhone.Text = base.CurrentEndUser.ContactInformation.Phone;
        textPhone2.Text = base.CurrentEndUser.ContactInformation.Phone2;
        textFax.Text = base.CurrentEndUser.ContactInformation.Fax;
        
    }
    private void LoadShoppingCart()
    {
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        shoppingcart.CartGUID = Utilities.GetCartGUID();
        //int total = 0;
        ProcessShoppingCart processgetcart = new ProcessShoppingCart();
        try
        {
            DataSet ds = new DataSet();
            ds = processgetcart.ShoppingCartSelectData(shoppingcart.CartGUID);
            if (ds.Tables[0].Rows.Count == 0)
            {
               
                //labelSubTotal.Text = "";
                Response.Redirect("Default.aspx", false);
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

    protected void gridviewShoppingCart_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            int NumCells = e.Row.Cells.Count;
            for (int i = 0; i < NumCells - 1; i++)
            {
                e.Row.Cells[i].HorizontalAlign = HorizontalAlign.Center;
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            _totalcounter += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalPrice"));
        }
        labelSubTotal.Text = string.Format(new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", _totalcounter);
    }
    protected void commandSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid) {
            
            ProcessEndUser processenduser = new ProcessEndUser();
            base.CurrentEndUser.FirstName = textFirstName.Text;
            base.CurrentEndUser.LastName = textLastName.Text;

            base.CurrentEndUser.Address.AddressLine = textAddress.Text;
            base.CurrentEndUser.Address.AddressLine2 = textAddress2.Text;
            base.CurrentEndUser.Address.City = textCity.Text;
            base.CurrentEndUser.Address.State = textState.Text;
            base.CurrentEndUser.Address.PostalCode = textPostalCode.Text;

           
            base.CurrentEndUser.ContactInformation.Phone = textPhone.Text;
            base.CurrentEndUser.ContactInformation.Phone2 = textPhone2.Text;
            base.CurrentEndUser.ContactInformation.Fax = textFax.Text;
           
            base.CurrentOrder = new Orders();
            base.CurrentOrder.EndUser.FirstName = textFirstName.Text;
            base.CurrentOrder.EndUser.LastName = textLastName.Text;
            base.CurrentOrder.EndUserID = base.CurrentEndUser.EndUserID;
            labelSubTotal.Text = labelSubTotal.Text.Replace(".", "");
            base.CurrentOrder.SubTotal = Convert.ToDecimal(labelSubTotal.Text);

            try {
                processenduser.EndUserUpdateData(base.CurrentEndUser);
            }
            catch (Exception ex)
            {
                //Response.Write(ex.ToString());
                KhoaY.Controller.Utilities.LogException(ex);
            }
            Response.Redirect("CheckOutConfirmv1.aspx");
        }
    }
    protected void checkboxVerify_CheckedChanged(object sender, EventArgs e)
    {
        if (checkboxVerify.Checked)
        {
            commandSubmit.Enabled = checkboxVerify.Checked;
        }
        else {
            commandSubmit.Enabled = false;

        }
    }
}