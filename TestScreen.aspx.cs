using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestScreen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string height = HttpContext.Current.Request.Params["clientScreenHeight"];
        string width = HttpContext.Current.Request.Params["clientScreenWidth"];
        lblMessage.Text = height + " " + width + " " + hdf1.Value;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string height = HttpContext.Current.Request.Params["clientScreenHeight"];
        string width = HttpContext.Current.Request.Params["clientScreenWidth"];
        lblMessage.Text = height + "   " + width + " " + hdf1.Value;
    }
}