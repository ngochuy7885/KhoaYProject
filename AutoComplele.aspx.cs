using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;

public partial class AutoCompele : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchProductsV1(string prefixText, int count)
    {
        List<string> products = new List<string>();
        ProcessProduct processproduct = new ProcessProduct();
        DataSet ds = processproduct.ProductSelectBySearchName(prefixText);
        //int rcount, size;
        //rcount = ds.Tables[0].Rows.Count;
        //if (rcount >= count)
        //    size = count;
        //else
        //    size = rcount;
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++) {
            DataRow row = ds.Tables[0].Rows[i];
            products.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem
                (string.Format("{0}",
            row["ProductName"]),
            row["ProductImageId"].ToString() + "|" + row["ProductName"]));
        }

        return products;
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