using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using KhoaY.Model;
using System.Data;
using System.Web.UI.HtmlControls;
public partial class Admin_ProductCategory : System.Web.UI.Page
{
    public static int ProductCategoryID;
       
    protected void Page_Load(object sender, EventArgs e)
    {
         //Response.Write(Context.User.Identity.Name);
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
        hpl2.Text = "Nhà Sản Xuất";
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
    public void LoadData() {
        ProcessProductCategory processproductcategory = new ProcessProductCategory();
        DataSet ds = processproductcategory.ProductCategorySelectData();
        gridviewProductCategory.DataSource = ds;
        gridviewProductCategory.DataBind();
        gridviewProductCategory.Focus();
        //PanelInsert.Visible = false;
        ///PanelUpdate.Visible = false;
    
    }
    protected void btnInsertAdd_Click(object sender, EventArgs e)
    {
        //PanelInsert.Visible = true;
        if (IsValid)
        {

            ProductCategory productcategory = new ProductCategory();
            ProcessProductCategory processproductcategory = new ProcessProductCategory();
            productcategory.ProductCategoryName = textProductCategoryName.Text;
            try { 
                processproductcategory.ProductCategoryInsertData (productcategory);
                //Remove value textbox productcategoryname
                textProductCategoryName.Text = "";
                LoadData();
            }
            catch (Exception ex) {
                //Response.Write(ex.Message.Replace("\'", " "));
                KhoaY.Controller.Utilities.LogException(ex);
            }
            
        }
        else
            ModalPopupExtenderInsert.Show();
    }
    protected void gridviewProductCategory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //for (int i = 1; i < (e.Row.Cells.Count - 1); i++)
        //{
        //    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal", true);

        //    e.Row.Cells[i].Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(this.gridviewProductCategory, "Select$" + e.Row.RowIndex);
        //}
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
    protected void gridviewProductCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gridviewProductCategory.SelectedRow;
        //DataKey data = gridviewProductCategory.DataKeys[row.DataItemIndex];
        ProductCategoryID = int.Parse(gridviewProductCategory.DataKeys[row.RowIndex].Value.ToString());
        //ProductCategoryID = int.Parse(data.Values["ProductCategoryId"].ToString());
        PanelUpdate.Visible = true;
        ModalPopupExtenderUpdate.Show();

        textProductCategoryNameUpdate.Text = (gridviewProductCategory.SelectedRow.FindControl("lblCategoryName") as Label).Text;
           
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            textProductCategoryNameUpdate.Focus();
            ProductCategory productcategory = new ProductCategory();
            productcategory.ProductCategoryID = ProductCategoryID;
            productcategory.ProductCategoryName = textProductCategoryNameUpdate.Text;
            ProcessProductCategory processproductcategory = new ProcessProductCategory();
            try
            {
                processproductcategory.ProductCategoryUpdateData(productcategory);
                LoadData();
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message.Replace("\'", " "));
                KhoaY.Controller.Utilities.LogException(ex);
            }
        }
        else {
            ModalPopupExtenderUpdate.Show();
        }
    }
    protected void LinkbtnInsert_Click(object sender, EventArgs e)
    {
        ModalPopupExtenderInsert.Show();
    }
  
    protected void gridviewProductCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            ProductCategory productcategory = new ProductCategory();
            productcategory.ProductCategoryID = int.Parse(gridviewProductCategory.DataKeys[e.RowIndex].Value.ToString());
            ProcessProductCategory processProductCategory = new ProcessProductCategory();
            processProductCategory.ProductCategoryDeleteData(productcategory);
            LoadData();
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
    protected void gridviewProductCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridviewProductCategory.PageIndex = e.NewPageIndex;
        LoadData();
    }
}