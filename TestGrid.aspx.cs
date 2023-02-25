using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestGrid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Country") });
            dt.Rows.Add(1, "John Hammond", "United States");
            dt.Rows.Add(2, "Mudassar Khan", "India");
            dt.Rows.Add(3, "Suzanne Mathews", "France");
            dt.Rows.Add(4, "Robert Schidner", "Russia");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //foreach (GridViewRow row in GridView1.Rows)
        //{
        //    if (row.RowIndex == GridView1.SelectedIndex)
        //    {
        //        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
        //        row.ToolTip = string.Empty;

        //    }
        //    else
        //    {
        //        row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
        //        row.ToolTip = "Click to select this row.";
        //    }

        //}
        int index = GridView1.SelectedRow.RowIndex;
        string name = GridView1.SelectedRow.Cells[0].Text;
        string country = GridView1.SelectedRow.Cells[1].Text;
        string message = "Row Index: " + index + "\\nName: " + name + "\\nCountry: " + country;
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
    }
}