s<%@ WebHandler Language="C#" Class="SearchProduct" %>

using System;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using KhoaY.Controller;
public class SearchProduct : IHttpHandler
{

    public void ProcessRequest(HttpContext context) 
    {
        try
        {
            string searchText = context.Request.QueryString["q"];
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            if (KhoaY.Controller.Utilities.CheckNumeric(searchText))
            {
                sb.Append(string.Format("{0};{1}{2}", searchText, "No Image", Environment.NewLine));

            }
            else
            {
                //string connnection = Convert.ToString(System.Configuration.ConfigurationManager.ConnectionStrings["SQLCONN"]);

                //SqlConnection con = new SqlConnection(connnection);

                //SqlCommand cmd = new SqlCommand("Select ProductName, ProductImageId from products where searchname like '%" + searchText + "%'", con);

                //con.Open();
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SQLCONN"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("ProductBySearchName_Select", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@SearchName", searchText));
                    con.Open();
                    //System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader();
                    using (System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader())
                    {
                        
                        if (dr.HasRows)
                        {
                            //First Line AutoComplete
                            //sb.Append(string.Format("{0},{1}{2}", searchText,"", Environment.NewLine));
                            bool bLastRecord = false;
                            string productname = "";
                            int productimageid = 0;
                            do
                            {
                                
                                if (dr.Read())
                                {
                                    productname = dr.GetString(0);
                                    productimageid = dr.GetInt32(1);
                                    sb.Append(string.Format("{0};{1}{2} ", dr["ProductName"], dr["ProductImageId"], Environment.NewLine));

                                }
                                else
                                {
                                    
                                    bLastRecord = true;
                                }



                                //sb.Append(string.Format("{0};{1}{2} ", dr["ProductName"], dr["ProductImageId"], Environment.NewLine));

                                //sb.Append(dr.GetString(0) + ";" + dr.GetInt32(1) + Environment.NewLine);
                                //sb.Append(string.Format("{0};{1}{2} ",dr.GetString(0),dr.GetInt32(1), Environment.NewLine));

                            }
                            while (!bLastRecord);
                            //while (!dr.Read());
                         
                        }
                        else
                        {
                            sb.Append(string.Format("{0};{1}{2}", "No Data", "No Image", Environment.NewLine));

                        }
                    }       
                    
                    con.Close();
                }
            }

            context.Response.Write(sb.ToString());
        }
        catch (Exception ex) {
                KhoaY.Controller.Utilities.LogException(ex); 
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}