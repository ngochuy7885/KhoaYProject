using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestCheckbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void checkboxVerify_CheckedChanged(object sender, EventArgs e)
    {
        if (checkboxVerify.Checked)
        {
            commandSubmit.Enabled = checkboxVerify.Checked;
            lnkEmail.Visible = checkboxVerify.Checked;
            commandSubmit.Focus();
        }
        else
        {
            commandSubmit.Enabled = false;
            lnkEmail.Visible = false;
        }
    }
    protected void commandSubmit_Click(object sender, EventArgs e)
    {

    }
    protected void lnkEmail_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("DownloadFile.ashx?yourVariable=Hướng dẫn bật Less secure apps để gửi gmail thông qua SMTP.pdf", false);
            Response.Redirect("Default.aspx");
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
}