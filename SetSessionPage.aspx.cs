using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SetSessionPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Services.WebMethod]
    public static string SetSession(string name)
    {
        HttpContext.Current.Session["CloseAlert"] = name;
        return HttpContext.Current.Session["CloseAlert"].ToString();
    }
}