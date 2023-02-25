using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Model;
using KhoaY.Controller;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
public partial class Register : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        textFirstName.Focus();
        LoadNavigation();
        Response.Cookies["ReturnSelf"].Value = "Register.aspx";
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
        hpl2.Text = "Đăng Kí";
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
    protected void commandRegister_Click(object sender, EventArgs e)
    {
        EndUser enduser = new EndUser();
        ProcessEndUser processenduser = new ProcessEndUser();

        if (IsValid)
        {
            enduser.EndUserTypeID = 1;
            enduser.FirstName = textFirstName.Text;
            enduser.LastName = textLastName.Text;
            enduser.Address.AddressLine = textAddress.Text;
            enduser.Address.AddressLine2 = textAddress2.Text;
            enduser.Address.City = textCity.Text;
            enduser.Address.State = textState.Text;
            enduser.Address.PostalCode = textPostalCode.Text;
            enduser.Password = textPassword.Text;
            enduser.ContactInformation.Email = textEmail.Text;
            enduser.ContactInformation.Phone = textPhone.Text;
            enduser.ContactInformation.Phone2 = textPhone2.Text;
            enduser.ContactInformation.Fax = textFax.Text;
            enduser.IsSubscribed = checkboxNewsletter.Checked;
            try
            {

                enduser.EndUserID = processenduser.EndUserInsertData(enduser);
                CurrentEndUser = enduser;
                Response.Redirect("Login.aspx", false);
            }
            catch (Exception ex)
            {
                //Response.Write(ex.ToString());
                //labelMessage.Text = ex.ToString();              
                KhoaY.Controller.Utilities.LogException(ex);
            }
        }
        else {
            ////checkboxNewsletter.Checked = false;
            //if (checkboxNewsletter.Checked)
            //{
            //    HtmlGenericControl myspan = (HtmlGenericControl)Page.Master.FindControl("MainContent").FindControl("myspan");
                
            //    myspan.Style.Add("display","inline");
               
            //}
            //else
            //{
            //    HtmlGenericControl myspan = (HtmlGenericControl)Page.Master.FindControl("MainContent").FindControl("myspan");
            //    myspan.Style.Add("display", "none");
                
            //}
        }
    
       
    }
    protected void customValidatorEmail_ServerValidate(object source, ServerValidateEventArgs args)
    {
        bool IsAuthentication = false;
        ProcessEndUser processenduser = new ProcessEndUser();
        try{
      
            string email = textEmail.Text;
            if (email.Length == 0)
            {
                args.IsValid = false;
                customValidatorEmail.ErrorMessage = "Xin vui lòng Nhập Email";
                return;
            }
            else {
                args.IsValid = true;
            }

            if (email.Length >= 50)
            {
                args.IsValid = false;
                customValidatorEmail.ErrorMessage = "Xin vui lòng Nhập Email Không Quá 50 Kí Tự";
                return;
            }
            else {
                args.IsValid = true;
            }

            string filter = @"^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$"; 

             Regex regex = new Regex(filter );
             Match match = regex.Match(email);
            if (match.Success)
            {
                
                 args.IsValid=true; }
            else
            {
                customValidatorEmail.ErrorMessage = "Xin vui lòng nhập email hợp lệ";
                args.IsValid = false;
                return;

            } 

            IsAuthentication = processenduser.EndUserCheckDouble(email);
            if (IsAuthentication)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        catch(Exception ex){
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }
      
    }
    protected void commandCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
        //textLastName.Text = "";
        //textFirstName.Text = "";
        //textAddress.Text = "";
        //textAddress2.Text = "";
        //textCity.Text = "";
        //textState.Text = "";
        //textPostalCode.Text = "";
        //textPassword.Text = "";
        //textConfirmPassword.Text = "";
        //textEmail.Text = "";
        //textPhone.Text = "";
        //textPhone2.Text = "";
        //textFax.Text = "";
    }
    protected void lnkEmail_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("DownloadFile.ashx?yourVariable=Hướng dẫn bật Less secure apps để gửi gmail thông qua SMTP.pdf", false);
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
        }

        
    }
    //protected void checkboxNewsletter_CheckedChanged(object sender, EventArgs e)
    //{
    //    if (checkboxNewsletter.Checked)
    //    {
    //        lnkEmail.Visible = checkboxNewsletter.Checked;
    //    }
    //    else
    //    {
    //        lnkEmail.Visible = false;

    //    }
    //}
}