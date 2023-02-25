using KhoaY.Controller;
using KhoaY.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Admin_TestTextBoxKeyUp : System.Web.UI.Page
{
    private static int PageSize = 2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            LoadNavigation();
            LoadProducts();
        }
    }
    public void LoadNavigation()
    {
        //Navigation
        HyperLink hpl1 = (HyperLink)Page.Master.FindControl("hpl1");
        HyperLink hpl2 = (HyperLink)Page.Master.FindControl("hpl2");
        HyperLink hpl3 = (HyperLink)Page.Master.FindControl("hpl3");
        HyperLink hpl4 = (HyperLink)Page.Master.FindControl("hpl4");
        HyperLink hpl5 = (HyperLink)Page.Master.FindControl("hpl5");
        HyperLink hpl6 = (HyperLink)Page.Master.FindControl("hpl6");

        HtmlGenericControl li1 = (HtmlGenericControl)Page.Master.FindControl("li1");
        HtmlGenericControl li2 = (HtmlGenericControl)Page.Master.FindControl("li2");
        HtmlGenericControl li3 = (HtmlGenericControl)Page.Master.FindControl("li3");
        HtmlGenericControl li4 = (HtmlGenericControl)Page.Master.FindControl("li4");
        HtmlGenericControl li5 = (HtmlGenericControl)Page.Master.FindControl("li5");
        HtmlGenericControl li6 = (HtmlGenericControl)Page.Master.FindControl("li6");


        hpl1.Text = "Trang Chủ";
        hpl1.NavigateUrl = "Products.aspx";
        hpl2.Text = "Giỏ Rác";
        hpl2.Style.Add("Color", "silver");
        hpl2.Enabled = false;

        hpl3.Text = "";
        hpl4.Text = "";
        hpl5.Text = "";
        hpl6.Text = "";

        li1.Attributes["class"] = "breadcrumb-item";
        li2.Attributes["class"] = "breadcrumb-item";
        li3.Attributes["class"] = "";
        li4.Attributes["class"] = "";
        li5.Attributes["class"] = "";
        li6.Attributes["class"] = "";

    }
    private void LoadProducts()
    {
        ProcessProduct processorders = new ProcessProduct();
        DataSet ds = new DataSet();
        try
        {
            ds = processorders.DeletedProductSelectData();
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
            // Response.Write(ex.ToString());
        }
        GridViewDeletedProductTest.DataSource = ds;
        GridViewDeletedProductTest.DataBind();
    }
   
    [WebMethod]
    public static string GetProducts(string searchTerm, int pageIndex)
    {
        string query = "[GetProducts_Pager]";
        SqlCommand cmd = new SqlCommand(query);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);
        cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
        cmd.Parameters.AddWithValue("@PageSize", PageSize);
        cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
        return GetData(cmd, pageIndex).GetXml();
        //return "Hello " + searchTerm + Environment.NewLine + "The Current Time is: "
        //+ DateTime.Now.ToString();
    }
    private static DataSet GetData(SqlCommand cmd, int pageIndex)
    {
        string strConnString = ConfigurationManager.ConnectionStrings["SQLCONN"].ConnectionString;
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                using (DataSet ds = new DataSet())
                {
                    sda.Fill(ds, "Products");
                    DataTable dt = new DataTable("Pager");
                    dt.Columns.Add("PageIndex");
                    dt.Columns.Add("PageSize");
                    dt.Columns.Add("RecordCount");
                    dt.Rows.Add();
                    dt.Rows[0]["PageIndex"] = pageIndex;
                    dt.Rows[0]["PageSize"] = PageSize;
                    dt.Rows[0]["RecordCount"] = cmd.Parameters["@RecordCount"].Value;
                    ds.Tables.Add(dt);
                    return ds;
                }
            }
        }
    }
   
    [WebMethod]
    public static bool RecoverProductv1(int productid)
    {
        
        string conString = ConfigurationManager.ConnectionStrings["SQLCONN"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand("update Products set isdelete = 1 where ProductID = @ProductId"))
            {
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@ProductId", productid);
                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                con.Close();
                return rowsAffected > 0;
            }
        }

    }
    [System.Web.Services.WebMethod]
    public static void ValidateNumber(string number)
    {
        int no = Convert.ToInt32(number);
    }
    [WebMethod]
    public static void RecoverProduct(string productid)
    {
        Product product = new Product();
        product.ProductID = Int32.Parse(productid);
        ProcessProduct processproduct = new ProcessProduct();
        int i = processproduct.ProductRecoverData(product);
       
    }
    public void Recover(int productid)
    {
        try
        {
            Product product = new Product();
            product.ProductID = productid;
            ProcessProduct processproduct = new ProcessProduct();
            processproduct.ProductRecoverData(product);
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);

        }
    }
 
    
    
}