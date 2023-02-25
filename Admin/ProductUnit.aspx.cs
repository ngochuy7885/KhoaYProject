using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using System.Data;
using KhoaY.Model;
using System.Web.UI.HtmlControls;
public partial class Admin_ProductUnit : System.Web.UI.Page
{
    public static int ProductUnitID;
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadData();
            LoadNavigation();

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
        hpl2.Text = "Đơn Vị Tính";
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

    private void LoadData()
    {
        try {
            ProcessProductUnit processproductunit = new ProcessProductUnit();
            DataSet ds = processproductunit.ProductUnitSelectData();
            gridviewProductUnit.DataSource = ds;
            gridviewProductUnit.DataBind();
            gridviewProductUnit.Focus();
        }
        catch (Exception ex){
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
         }
       
    }
    protected void LinkbtnInsert_Click(object sender, EventArgs e)
    {
        ModalPopupExtenderInsert.Show();
    }
    protected void gridviewProductUnit_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // loop all data rows
            // loop all data rows
            foreach (DataControlFieldCell cell in e.Row.Cells)
            {
                // check all cells in one row
                foreach (Control control in cell.Controls)
                {
                    // Must use LinkButton here instead of ImageButton
                    // if you are having Links (not images) as the command button.
                    ImageButton button = control as ImageButton;
                    if (button != null && button.CommandName == "Delete")
                        // Add delete confirmation
                        button.OnClientClick = "if (!confirm('Are you sure " +
                               "you want to delete this record?')) return;";
                }
            }
        }
    }
    protected void btnInsertAdd_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            ProductUnit productunit = new ProductUnit();
            ProcessProductUnit processproductunit = new ProcessProductUnit();
            productunit.ProductUnitName = textProductUnitName.Text;
            try
            {
                processproductunit.ProductUnitInsertData(productunit);
                //Remove value textbox productcategoryname
                textProductUnitName.Text = "";
                LoadData();
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message.Replace("\'", " "));
                KhoaY.Controller.Utilities.LogException(ex);
            }

        }
        else
            ModalPopupExtenderInsert.Show();
    }
    protected void gridviewProductUnit_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gridviewProductUnit.SelectedRow;
        //DataKey data = gridviewProductUnit.DataKeys[row.DataItemIndex];
        //ProductUnitID = int.Parse(gridviewProductUnit.DataKeys[row.RowIndex].Value.ToString());
        //ProductUnitID = int.Parse(data.Values["ProductUnitId"].ToString());
        ProductUnitID = int.Parse(gridviewProductUnit.DataKeys[row.RowIndex].Value.ToString());
       
        PanelUpdate.Visible = true;
        ModalPopupExtenderUpdate.Show();

        textProductUnitNameUpdate.Text = (gridviewProductUnit.SelectedRow.FindControl("lblProductUnitName") as Label).Text;
  
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            textProductUnitNameUpdate.Focus();
            
            ProductUnit productunit = new ProductUnit();
            productunit.ProductuUnitId = ProductUnitID;
            productunit.ProductUnitName = textProductUnitNameUpdate.Text;

            ProcessProductUnit processproductunit = new ProcessProductUnit();
            try
            {
                processproductunit.ProductUnitUpdateData(productunit);
                LoadData();
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message.Replace("\'", " "));
                //lblMessage.Text = ex.Message.Replace("\'"," ");
                KhoaY.Controller.Utilities.LogException(ex);
            }
        }
        else
        {
            ModalPopupExtenderUpdate.Show();
        }
    }
    protected void gridviewProductUnit_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            ProductUnit productunit = new ProductUnit();
            productunit.ProductuUnitId = int.Parse(gridviewProductUnit.DataKeys[e.RowIndex].Value.ToString());
            ProcessProductUnit processproductunit = new ProcessProductUnit();
            processproductunit.ProductCategoryDeleteData(productunit);
            LoadData();
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
    protected void gridviewProductUnit_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridviewProductUnit.PageIndex = e.NewPageIndex;
        LoadData();
    }
}