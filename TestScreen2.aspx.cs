using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestScreen2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ScreenResolution"] == null)
        {
            // Session variable is not set
            // Redirect to the screen resolution detection script
            Response.Redirect("detectscreen.aspx");
        }
        else
        {
            // Session variable is set
            // Display it on the page
            labelWidth.Text = Session["ScreenResolution"].ToString();
        }
    }
}