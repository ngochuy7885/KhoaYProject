using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SweetAlert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string conString = ConfigurationManager.ConnectionStrings["SQLCONN1"].ConnectionString;
            string query = "SELECT * FROM Products";
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        //ClientScript.RegisterClientScriptBlock(Page.GetType(), "AlertMsg", "<script language='javascript'>alert('Record Inserted.');</script>");
        //ScriptManager.RegisterClientScriptBlock(Button1, this.GetType(), "AlertMsg", "<script language='javascript'>alert('The Web Policy need to be accepted to submit the new assessor information.');</script>", false);
        //ScriptManager.RegisterClientScriptBlock(Button1, Page.GetType(), "AlertMsg", "<script language='javascript'>swal('Good job!', 'You clicked the button!', 'info');</script>",false);
        labelMessage.Text = "test";
    }
    [System.Web.Services.WebMethod]
    public static string DeleteClick(int id)
    {
        string conString = ConfigurationManager.ConnectionStrings["SQLCONN1"].ConnectionString;
        string query = "DELETE FROM Products WHERE ProductId = @Id";
        SqlCommand cmd = new SqlCommand(query);
        SqlConnection con = new SqlConnection(conString);
        cmd.Connection = con;
        con.Open();
        cmd.Parameters.AddWithValue("@Id", id);
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i > 0 ? "Deleted" : "Failed";

    }
    
}