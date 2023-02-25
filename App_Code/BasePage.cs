using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KhoaY.Model;
/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : System.Web.UI.Page
{
    internal const string KEY_CURRENTUSER = "Current Logged In User";
    internal const string KEY_CURRENTORDER = "Current Order";


    //
    // TODO: Add constructor logic here
    //
    public EndUser CurrentEndUser
    {
        get
        {
            try
            {
                return (EndUser)(Session[KEY_CURRENTUSER]);
            }
            catch
            {
                return (null);  // for design time
            }
        }

        set
        {
            if (value == null)
            {
                Session.Remove(KEY_CURRENTUSER);
            }
            else
            {
                Session[KEY_CURRENTUSER] = value;
            }
        }
    }

    public Orders CurrentOrder
    {
        get
        {
            try
            {
                return (Orders)(Session[KEY_CURRENTORDER]);
            }
            catch
            {
                return (null);  // for design time
            }
        }

        set
        {
            if (value == null)
            {
                Session.Remove(KEY_CURRENTORDER);
            }
            else
            {
                Session[KEY_CURRENTORDER] = value;
            }
        }
    }
}