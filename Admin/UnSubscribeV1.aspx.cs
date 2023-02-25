using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Model;
using KhoaY.Controller;
using System.Web.UI.HtmlControls;
public partial class Admin_UnSubscribeV1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadFullName();
            UnsubscribeCustomer();
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

        hpl2.Text = "Bảng Tin";
        hpl2.NavigateUrl = "Newsletter.aspx";


        hpl3.Text = "Không Đăng Ký Email";
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
    private void LoadFullName()
    {
        try
        {
            EndUser enduser = new EndUser();
            enduser.EndUserID = int.Parse(Request.QueryString["EndUserID"]);
            //enduser.EndUserID = 6;
            DataSet ds = new DataSet();
            ProcessEndUser processenduser = new ProcessEndUser();
            ds = processenduser.EndUserSelectByEndUserID(enduser);


            labelName.Text = ds.Tables[0].Rows[0]["LastName"].ToString() + " " + ds.Tables[0].Rows[0]["FirstName"].ToString();

        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
            //KhoaY.Controller.Utilities.LogException(ex);
        }
    }

    private void UnsubscribeCustomer()
    {
        ProcessEndUser processenduser = new ProcessEndUser();
        EndUser enduser = new EndUser();
        enduser.EndUserID = int.Parse(Request.QueryString["EndUserID"]);
        //enduser.EndUserID = 6;
        try
        {
            processenduser.NewsletterUpdateData(enduser);
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
            //KhoaY.Controller.Utilities.LogException(ex);
        }
    }
}