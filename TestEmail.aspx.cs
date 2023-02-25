using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
public partial class TestEmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        try {
            Utilities.SendMessageNewsLetter("test", "test", "test", "bodymessage");
        }
        catch (Exception Ex){
            labelMessage.Text = Ex.ToString();
        }

    }
}