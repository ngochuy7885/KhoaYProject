using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using KhoaY.Model;
using System.Data;
public partial class Admin_UnSubscribe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadFullName();
            UnsubscribeCustomer();
           
        }
    }

    private void LoadFullName()
    {
        try {
            EndUser enduser = new EndUser();
            enduser.EndUserID = int.Parse(Request.QueryString["EndUserID"]);
            DataSet ds = new DataSet();
            ProcessEndUser processenduser = new ProcessEndUser();
            ds = processenduser.EndUserSelectByEndUserID(enduser);
            

            labelName.Text =  ds.Tables[0].Rows[0]["LastName"].ToString() + " " + ds.Tables[0].Rows[0]["FirstName"].ToString();
        
        }
        catch (Exception ex) {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }

    private void UnsubscribeCustomer()
    {
        ProcessEndUser processenduser = new ProcessEndUser();
        EndUser enduser = new EndUser();
        enduser.EndUserID = int.Parse(Request.QueryString["EndUserID"]);
        try {
            processenduser.NewsletterUpdateData(enduser);
        }
        catch (Exception ex) {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
   
}