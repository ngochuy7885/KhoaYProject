using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Model;
public partial class TestAutoCompleteExtender1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchEmployees(string prefixText, int count)
    {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SQLCONN"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                 List<string> products = new List<string>();
                if (KhoaY.Controller.Utilities.CheckNumeric(prefixText)) {
                    string product = "";
                    products.Add(product);
                    return products;
                }
                SqlCommand cmd = new SqlCommand("ProductBySearchName_Select", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@SearchName",prefixText));
                conn.Open();
                
               
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        products.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem
                            (string.Format("{0}",
                        sdr["ProductName"]),
                        sdr["ProductImageId"].ToString() + "|" + sdr["ProductName"]));
                    }
                }
                conn.Close();
                return products;
        }
   }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchProducts(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["SQLCONN"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select ProductName , ProductImageID, SearchName from" +
                 " Products where SearchName like '%' +  @SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> products = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        products.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem
                            (string.Format("{0}",
                        sdr["ProductName"]),
                        sdr["ProductImageId"].ToString() + "|" + sdr["ProductName"]));
                    }
                }
                conn.Close();
                return products;
            }
        }
    }

}