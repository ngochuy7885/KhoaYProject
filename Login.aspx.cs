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
public partial class Login : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        textUserName.Focus();
        if (!IsPostBack)
        {
            if (Request.Cookies["Email"] != null)
                textUserName.Text = Request.Cookies["Email"].Value;
            if (Request.Cookies["Password"] != null)
                textPassword.Attributes.Add("value", Request.Cookies["Password"].Value);
            if (Request.Cookies["Email"] != null && Request.Cookies["Password"] != null)
                chkRememberMe.Checked = true;
            LoadNavigation();
            //Response.Cookies["ReturnSelf"].Value = "Login.aspx";
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
        
        hpl2.Text = "Đăng Nhập";
        hpl2.NavigateUrl = String.Format("~/Login.aspx");
        
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
    protected void commandLogin_Click(object sender, EventArgs e)
    {
        if (IsValid) {
            EndUser enduser = new EndUser();
            ProcessEndUser processenduser = new ProcessEndUser();
            enduser.ContactInformation.Email = textUserName.Text;
            enduser.Password = textPassword.Text;
            try {

                //Set Cookies
                if (chkRememberMe.Checked)
                {
                    Response.Cookies["Email"].Value = textUserName.Text;
                    Response.Cookies["Password"].Value = textPassword.Text;
                    Response.Cookies["Email"].Expires = DateTime.Now.AddDays(15);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(15);
                    Session["RememberMe"] = textUserName.Text;
                }
                else
                {
                    Response.Cookies["Email"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                }

                DataSet ds = new DataSet();
                ds = processenduser.EndUserLoginSelectData(enduser);
                if (ds.Tables[0].Rows.Count != 0)
                {

                    enduser.Address.AddressID = int.Parse(ds.Tables[0].Rows[0]["AddressID"].ToString());
                    enduser.Address.AddressLine = ds.Tables[0].Rows[0]["AddressLine"].ToString();
                    enduser.Address.AddressLine2 = ds.Tables[0].Rows[0]["AddressLine2"].ToString();
                    enduser.Address.City = ds.Tables[0].Rows[0]["City"].ToString();
                    enduser.Address.State = ds.Tables[0].Rows[0]["State"].ToString();
                    enduser.Address.PostalCode = ds.Tables[0].Rows[0]["PostalCode"].ToString();

                    enduser.ContactInformation.ContactInformationID = int.Parse(ds.Tables[0].Rows[0]["ContactInformationID"].ToString());
                    enduser.ContactInformation.Phone = ds.Tables[0].Rows[0]["Phone"].ToString();
                    enduser.ContactInformation.Phone2 = ds.Tables[0].Rows[0]["Phone2"].ToString();
                    enduser.ContactInformation.Fax = ds.Tables[0].Rows[0]["Fax"].ToString();
                    enduser.ContactInformation.Email = ds.Tables[0].Rows[0]["Email"].ToString();

                    enduser.EndUserID = int.Parse(ds.Tables[0].Rows[0]["EndUserID"].ToString());
                    enduser.EndUserTypeID = int.Parse(ds.Tables[0].Rows[0]["EndUserTypeID"].ToString());
                    enduser.FirstName = ds.Tables[0].Rows[0]["FirstName"].ToString();
                    enduser.LastName = ds.Tables[0].Rows[0]["LastName"].ToString();
                    enduser.Password = ds.Tables[0].Rows[0]["Password"].ToString();
                    enduser.IsSubscribed = Boolean.Parse(ds.Tables[0].Rows[0]["isSubscribed"].ToString());

                    base.CurrentEndUser = enduser;

                    if (Request.Cookies["ReturnURL"] != null)
                    {
                        Response.Redirect(Request.Cookies["ReturnURL"].Value);
                    }
                    else
                    {
                        Response.Redirect("CustomerOrders.aspx");
                    }
                }
                else {
                    labelMessage.Text = "Đăng Nhập Thất Bại";
                }
               
            }
            catch (Exception ex) {
                labelMessage.Text = ex.ToString();
            }
        }
    }
    protected void chkRememberMe_CheckedChanged(object sender, EventArgs e)
    {
        //Set Cookies
        if (chkRememberMe.Checked)
        {
            Response.Cookies["Email"].Value = textUserName.Text;
            Response.Cookies["Password"].Value = textPassword.Text;
            Response.Cookies["Email"].Expires = DateTime.Now.AddDays(15);
            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(15);
            Session["RememberMe"] = textUserName.Text;
        }
        else
        {
            Response.Cookies["Email"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
        }
    }
}