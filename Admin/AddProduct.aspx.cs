using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using KhoaY.Model;
using System.IO;
using System.Web.UI.HtmlControls;
public partial class Admin_AddProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            textProductName.Focus();
            LoadCategories();
            LoadUnits();
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

        hpl2.Text = "Sản Phẩm";
        hpl2.NavigateUrl = "Products.aspx";

        hpl3.Text = "Thêm Sản Phẩm";
        hpl3.Style.Add("Color", "silver");
        hpl3.Enabled = false;

       
        hpl4.Text = "";
        hpl5.Text = "";
        hpl6.Text = "";

        li1.Attributes["class"] = "breadcrumb-item";
        li2.Attributes["class"] = "breadcrumb-item";
        li3.Attributes["class"] = "breadcrumb-item";
        li4.Attributes["class"] = "";
        li5.Attributes["class"] = "";
        li6.Attributes["class"] = "";

    }

    private void LoadUnits()
    {
        ProcessProductUnit processproductunit = new ProcessProductUnit();
        try
        {
            dropdownlistUnit.DataTextField = "ProductUnitName";
            dropdownlistUnit.DataValueField = "ProductUnitID";

            dropdownlistUnit.DataSource = processproductunit.ProductUnitSelectData();
            dropdownlistUnit.DataBind();
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
            Response.Redirect("../ErrorPage.aspx",false);
        }
    }
    private void LoadCategories()
    {
        ProcessProductCategory processgetcategory = new ProcessProductCategory();
        try
        {
            dropdownlistCategory.DataTextField = "ProductCategoryName";
            dropdownlistCategory.DataValueField = "ProductCategoryID";

            dropdownlistCategory.DataSource = processgetcategory.ProductCategorySelectData();
            dropdownlistCategory.DataBind();
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
            //Response.Redirect("../ErrorPage.aspx");
        }
    }


    protected void commandAdd_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            ProcessProduct processproduct = new ProcessProduct();
            Product prod = new Product();
            prod.ProductName = textProductName.Text;
            prod.SearchName = textSearchName.Text;
            prod.QuotationName = textQuotationName.Text;
            prod.ProductCategoryID = int.Parse(dropdownlistCategory.SelectedItem.Value);
            prod.ProductUnitId = int.Parse(dropdownlistUnit.SelectedItem.Value);
            prod.ProductImage = fileuploadImage.FileBytes; 
            prod.Description = Server.HtmlDecode(textDescription.Text);
            //prod.DescriptionHTML = Server.HtmlDecode(textDescriptionHTML.Text);
            prod.DescriptionHTML = Server.HtmlDecode(textDescriptionHTMLEditor.Text);
            prod.Price = Convert.ToDecimal(textPrice.Text.Replace(".",String.Empty));
            prod.Location = textLocation.Text;
            try               
            {
                processproduct.ProductInsertData(prod);
                Response.Redirect("Products.aspx",false);
            }
            catch (Exception ex)
            {
                //Response.Redirect("../ErrorPage.aspx");
                //labelMessage.Text = ex.ToString();
                KhoaY.Controller.Utilities.LogException(ex);
            }
        }
    }
    protected void commandCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx",false);
    }
    protected void customValidatorProductPrice_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (textPrice.Text == "")
        {
            return;        
        }
        if (Utilities.CheckNumeric(textPrice.Text.Replace(".",string.Empty)))
        {
            args.IsValid = true;
        }
        else
            args.IsValid = false;
    }
    protected void customValidatorProductName_ServerValidate(object source, ServerValidateEventArgs args)
    {
        bool IsAuthentication = false;
        ProcessProduct processproduct = new ProcessProduct();
        try
        {

            string productname = textProductName.Text.Trim();
            

            IsAuthentication = processproduct.ProductCheckDouble(productname);
            if (IsAuthentication)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
            KhoaY.Controller.Utilities.LogException(ex);
        }

    }
}