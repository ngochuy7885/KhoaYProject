using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using System.Net.Mail;
using System.Text;
using KhoaY.Controller;
public partial class TestCase2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        decimal temp = Convert.ToDecimal(Utilities.FormatMoney("82000"));
        labelMessage.Text = String.Format("{0:#,##0}", temp);
        System.Threading.Thread.Sleep(3000);
    }
    protected void commandEmail_Click(object sender, EventArgs e)
    {
        
       }
    protected void CommandSendEmail_Click(object sender, EventArgs e)
    {
        string emailheadtest = "KhoaY Thong Bao Hoa Don Cua Ban";
        string subjectmessage = "KhoaY Thong Bao Hoa Don Cua Ban";
        StringBuilder bodymessage = new StringBuilder();
        bodymessage.Append(" <table style='width:100%' border='1'");
        bodymessage.Append("<tr>");
        bodymessage.Append("<th> Company </th>");
        bodymessage.Append("<th> Contact </th>");
        bodymessage.Append("<th> Country </th>");
        bodymessage.Append("</tr>");
        bodymessage.Append("<tr>");
        bodymessage.Append("<td> Alfreds futterkiste </td>");
        bodymessage.Append("<td> Maria Anders </td>");
        bodymessage.Append("<td> Germanay</td>");
        bodymessage.Append("</tr>");
        bodymessage.Append("</table>");
        //Utilities.SendMessage("ngochuy7885@gmail.com,hinhmaythangio14@gmail.com,huy7885@gmail.com", emailheadtest, subjectmessage, bodymessage.ToString());
        Utilities.SendMessageMultipleEmail("ngochuy7885@gmail.com", emailheadtest, subjectmessage, bodymessage.ToString());
    }

    protected void commandThread_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);
        Response.Redirect("Default.aspx");
    }
}