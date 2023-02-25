using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using System.IO;
using System.Data;
using System.Web.UI.HtmlControls;
public partial class Admin_Newsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
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

        hpl2.Text = "Bảng Tin";
        hpl2.NavigateUrl = "Newsletter.aspx";

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
    protected void commandSend_Click(object sender, EventArgs e)
    {
        //System.Threading.Thread.Sleep(5000);
        string unsubscr = string.Empty;
        try {
            //string URL = "NewsletterConfirmation.aspx";
            //base.NewsletterBody = Utilities.FormatText.( textMessageBody.Text , true );
            //Response.Redirect( "SendingNewsletter.aspx?Page=" + URL );
            string messagebody = Utilities.FormatText(textMessage.Text, true);
            string emailheadtest = "KhoaY Thông Báo Bảng Tin";
            string subjectmessage = "Bảng Tin";
            string msgbody = "";
            ProcessEndUser processenduser = new ProcessEndUser();
            DataSet ds = new DataSet();
            ds = processenduser.NewsletterSelectData();
            using (StreamReader sr = new StreamReader(HttpContext.Current.Server.MapPath("~/Admin/EmailTemplates/CustomerNewsletter.html")))
            {
                string stringBody = sr.ReadToEnd();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    unsubscr = "<a href=\"http://192.168.1.100/Admin/UnSubscribeV1.aspx?EndUserID=" + dr["EndUserID"] + "&FullName=" + dr["FirstName"].ToString() + dr["LastName"].ToString() + '"' + " target=\"_blank" + '"' + "> Bấm Vào Đây </a>";
                    //unsubscr = "<a href=http://mediscience.ddns.net/Admin/UnSubscribeV1.aspx?EndUserID=" + dr["EndUserID"] + " target=\"_blank" + '"' + "> Nhấn Vào Đây </a>";

                    msgbody = stringBody;
                    msgbody = msgbody.Replace("`+Name+", dr["LastName"].ToString() + " " + dr["FirstName"].ToString());
                    msgbody = msgbody.Replace("`+MessageBody+", messagebody);
                    msgbody = msgbody.Replace("`+Nhấn Vào Đây+", unsubscr);
                    

                    Utilities.SendMessageNewsLetter(dr["Email"].ToString(), emailheadtest, subjectmessage, msgbody.ToString());
                   
                }
            }
            Response.Redirect("NewsletterConfirmation.aspx",false);     
        }
        catch (Exception ex) {
            KhoaY.Controller.Utilities.LogException(ex);
            //Response.Write(ex.ToString());
            //string exception = ex.ToString();
            //base.NewsletterBody = Utilities.FormatText.( textMessageBody.Text , true );
            //Response.Redirect( "SendingNewsletter.aspx?Page=" + URL );
            //Response.Redirect("../ErrorPage.aspx?Error=" + exception);
            //labelMessage.Text = ex.ToString();
        }
           
    }
}