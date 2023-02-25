using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestFocus3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SetDefaultButton(TextBox1, Button1);   
    }
    private void SetDefaultButton(TextBox txt, Button defaultButton)
    {
        txt.Attributes.Add("onkeydown", "funfordefautenterkey1(" + defaultButton.ClientID + ",event)");
    } 
    protected void Button1_Click(object sender, EventArgs e)
    {
        message.Text = TextBox1.Text;
    }
}