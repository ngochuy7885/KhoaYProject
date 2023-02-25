using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using KhoaY.Controller;
public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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
        hpl2.Text = "Liên Lạc";
        hpl2.NavigateUrl = "ContactUs.aspx";



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
    protected void commandCancel_Click(object sender, EventArgs e)
    {
        textName.Text = "";
        textEmail.Text = "";
        textComment.Text = "";
        textName.Focus();
    }
    protected void commandSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            try {
                string emailheadtest = textEmail.Text;
                string subjectmessage = textName.Text;
                string bodymessage = textComment.Text;

                Utilities.SendMessageV1("huy7885@gmail.com", textEmail.Text,  emailheadtest, subjectmessage, bodymessage.ToString());
                Response.Redirect("ContactUsConfirm.aspx", false);  
            }
            catch (Exception Ex){
                KhoaY.Controller.Utilities.LogException(Ex);
                
            }
             
        }
    }
}