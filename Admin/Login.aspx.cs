using KhoaY.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using System.Web.Security;
public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtEmail.Focus();
        if(!IsPostBack)
        {
            if (Request.Cookies["EmailAdmin"] != null)
                txtEmail.Text = Request.Cookies["EmailAdmin"].Value;
            if (Request.Cookies["PasswordAdmin"] != null)
                txtPassword.Attributes.Add("value", Request.Cookies["PasswordAdmin"].Value);
            if (Request.Cookies["EmailAdmin"] != null && Request.Cookies["PasswordAdmin"] != null)
                chkRememberMe.Checked = true;  
        }
    }
    protected void commandLogin_Click(object sender, EventArgs e)
    {
        if (IsValid)
        { 
            EndUser enduser = new EndUser();
            ProcessEndUser processlogin = new ProcessEndUser();
            enduser.ContactInformation.Email = txtEmail.Text;
            enduser.Password = txtPassword.Text;
            
            try
            {              
                if ( processlogin.AdminLoginSelectData(enduser))
                {
                    FormsAuthentication.RedirectFromLoginPage( txtEmail.Text , false );
                    //Set cookies de nhan biet user
                    FormsAuthentication.SetAuthCookie(txtEmail.Text, true);
                     
                    if (chkRememberMe.Checked)
                    {
                        Response.Cookies["EmailAdmin"].Value = txtEmail.Text;
                        Response.Cookies["PasswordAdmin"].Value = txtPassword.Text;
                        Response.Cookies["EmailAdmin"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["PasswordAdmin"].Expires = DateTime.Now.AddDays(15);
                        Session["RememberMeAdmin"] = txtEmail.Text;
                    }
                    else
                    {
                        Response.Cookies["EmailAdmin"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["PasswordAdmin"].Expires = DateTime.Now.AddDays(-1);  
                    }
                    
                    Response.Redirect("~/Admin/Products.aspx",false);
                }
                else
                {
                    labelMessage.Text = "Đăng Nhập Thất Bại!";
                }
            }
            catch (Exception ex)
            {
                KhoaY.Controller.Utilities.LogException(ex);
                //labelMessage.Text = ex.ToString();
                //Response.Redirect("../ErrorPage.aspx");
                           
            }
         }
    }
}