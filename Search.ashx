<%@ WebHandler Language="C#" Class="Search" %>

using System;
using System.Data.SqlClient;
using System.Text;
using System.Web;

public class Search : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string searchText = context.Request.QueryString["q"];
        string connnection = Convert.ToString(System.Configuration.ConfigurationManager.ConnectionStrings["SQLCONN"]);

        SqlConnection con = new SqlConnection(connnection);

        SqlCommand cmd = new SqlCommand("Select  * from products where searchname like '%" + searchText + "%'", con);

        con.Open();

        
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        using (System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader())
        {
            while (dr.Read())
            {
                sb.Append(string.Format("{0},{1}{2}", dr["ProductName"], dr["ProductImageId"], Environment.NewLine));
            }
        }
        con.Close();
        context.Response.Write(sb.ToString());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}