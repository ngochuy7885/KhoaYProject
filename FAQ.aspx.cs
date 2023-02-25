using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class FAQ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadNavigation();
    }

    private void LoadNavigation()
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
        hpl2.Text = "FAQ";
        hpl2.NavigateUrl = String.Format("~/FAQ.aspx");
        hpl2.Style.Add("Color", "silver");
       
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
    protected void lbkEmail_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("DownloadFile.ashx?yourVariable=Hướng dẫn bật Less secure apps để gửi gmail thông qua SMTP.pdf", false);
        }
        catch (Exception ex) {
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
    protected void lnkQuote_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("DownloadFile.ashx?yourVariable=L1Locationv3.0.0.3-c.pdf", false);
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
}