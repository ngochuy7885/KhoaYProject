using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using System.Data;
public partial class Admin_ToolTipLocationProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        int ProductId = int.Parse( Request.QueryString.Get("ProductId"));
        ProcessProduct processproduct = new ProcessProduct();
        ds = processproduct.ProductSelectByIDDataSet(ProductId);
        //Binding to gridview
        DataList1.DataSource = ds;
        DataList1.DataBind();
    }
}