using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
public partial class TestCase3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string test = "tets";
        //ScriptManager.RegisterStartupScript(this, GetType(),"displayalertmessage", "ConfirmRemoveDialog(" + test + ");", true);
        ScriptManager.RegisterStartupScript(Button1, typeof(Button), "scr", "ConfirmRemoveDialog('" + test + "');", true);
   
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try {
            string test = "test";
   
            int a = int.Parse(test);
        }
        catch(Exception ex) {
            string extest = ex.Message.Replace("\'", " ");
            string test = "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello world";
           //Response.Write("<script>alert('" + ex.Message.Replace("\'", " ") + "')</script>");
            ScriptManager.RegisterStartupScript(Button2, typeof(Button), "scr", "ConfirmRemoveDialog('" +test + "');", true);
            //WebMsgBox.Show(extest);
        }
    }
}