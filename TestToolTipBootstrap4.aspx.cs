using KhoaY.Controller;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestToolTipBootstrap4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        int ProductId = 11;//int.Parse(Request.QueryString.Get("ProductId"));
        ProcessProduct processproduct = new ProcessProduct();
        ds = processproduct.ProductSelectByIDDataSet(ProductId);
        //Binding to gridview
        DataList1.DataSource = ds;
        DataList1.DataBind();
    }
}