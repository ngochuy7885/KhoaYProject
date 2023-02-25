using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using System.Text;
using System.Data;
public partial class TestImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "82.500,55";
        Response.Write(FormatMoney1(str));
        DataSet ds = new DataSet();
        //int ProductId =  int.Parse(Request.QueryString.Get("ProductId"));
        int ProductID = 10;
        ProcessProduct processproduct = new ProcessProduct();
        ds = processproduct.ProductSelectByIDDataSet(ProductID);

        //Binding to gridview
        DataList1.DataSource = ds;
        DataList1.DataBind();
    }
    public static string FormatMoney1(string str)
    {

        StringBuilder sb = new StringBuilder();
        foreach (char c in str)
        {
            if (c.ToString() == ".")
            {

            }
            else if (c.ToString() == ",") {
                break;
            }
            else
                sb.Append(c);
        }
        //Xu ly chuoi bo''''

        return sb.ToString();
    }
}