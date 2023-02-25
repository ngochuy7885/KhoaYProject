using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using KhoaY.Model;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Data.SqlClient;
public partial class Admin_EditProduct : System.Web.UI.Page
{
    public static int SavedProductImageID;
    public static decimal Price;
    public static bool IsDelete;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            textProductName.Focus();
            LoadCategories();
            LoadProductUnit();
            LoadProduct();
            LoadNavigation();
            LoadDeleteButton();
        }
    }
    public void LoadDeleteButton() {
        Product product = new Product();
        product.ProductID = int.Parse(hdID.Value);
        bool i = true;
        try
        {
            ProcessProduct processproduct = new ProcessProduct();
            i = processproduct.ProductCheckDelete(product);

        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
            //Response.Write(ex.ToString());
        }
        if (i) {
            commandDelete.Text = "Xóa";
            IsDelete = true;
        }
        else
        {
            commandDelete.Text = "Phục Hồi";
            IsDelete = false;
        }
        //return i > 0 ? "Deleted" : "Failed";
        
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

        hpl3.Text = "Sửa Sản Phẩm";
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
    public void LoadProductUnit()
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
            //Response.Write(ex.ToString());
        }
    }

    [System.Web.Services.WebMethod]
    public static string DeleteClick(int id)
    {
        Product product = new Product();
        product.ProductID = id;
        int i = 0;
        try
        {
            ProcessProduct processproduct = new ProcessProduct();
            if (IsDelete)
            {
                i = processproduct.ProductDeleteDataV1(product);
            }
            else {
                i = processproduct.ProductRecoverData(product);
            }
            
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
            //Response.Write(ex.ToString());
        }
        return i > 0 ? "Deleted" : "Failed";
    }


    public void LoadProduct()
    {
        Product prod = new Product();
        ProcessProduct processproduct = new ProcessProduct();
        int ProductID = int.Parse(Request.QueryString["ProductID"]);
        prod = processproduct.ProductSelectByIDData(ProductID);
        try {
            hdID.Value = prod.ProductID.ToString();
            textProductName.Text = prod.ProductName;
            textSearchName.Text = prod.SearchName;
            TextQuotationName.Text = prod.QuotationName;
            dropdownlistCategory.Items.FindByValue(prod.ProductCategory.ProductCategoryID.ToString()).Selected = true;
            dropdownlistUnit.Items.FindByValue(prod.ProductUnit.ProductuUnitId.ToString()).Selected = true;
            
            textDescription.Text = Server.HtmlEncode(prod.Description);
            //textDescriptionHTML.Text = Server.HtmlEncode(prod.DescriptionHTML);
            textDescriptionHTMLEditor.Text = Server.HtmlEncode(prod.DescriptionHTML);
            textPrice.Text = String.Format(new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", prod.Price);
            imageProductDetail.ImageUrl = "../ImageViewer.ashx?ProductImageID=" + prod.ProductImageID.ToString();
            textLocation.Text = prod.Location;
            SavedProductImageID = prod.ProductImageID;
            
        }
        catch (Exception ex) {
            KhoaY.Controller.Utilities.LogException(ex);
            //Response.Write(ex.ToString());
        }
    }
    public void LoadCategories()
    {
        ProcessProductCategory processgetcategories = new ProcessProductCategory();
        try {
            dropdownlistCategory.DataTextField = "ProductCategoryName";
            dropdownlistCategory.DataValueField = "ProductCategoryID";

            dropdownlistCategory.DataSource = processgetcategories.ProductCategorySelectData();
            dropdownlistCategory.DataBind();
        }
        catch (Exception ex){
            KhoaY.Controller.Utilities.LogException(ex);
            //Response.Write(ex.ToString());
        }
    }
    protected void commandUpdate_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            Product prod = new Product();
            prod.ProductID = int.Parse(Request.QueryString["ProductID"]);
            prod.ProductCategoryID = int.Parse(dropdownlistCategory.SelectedItem.Value);
            prod.ProductUnitId = int.Parse(dropdownlistUnit.SelectedItem.Value);
            prod.ProductName = textProductName.Text;
            prod.SearchName = textSearchName.Text;
            prod.QuotationName = TextQuotationName.Text;
            prod.Description = Server.HtmlDecode(textDescription.Text);
            //prod.DescriptionHTML = Server.HtmlDecode(textDescriptionHTML.Text);
            prod.DescriptionHTML = Server.HtmlDecode(textDescriptionHTMLEditor.Text);
            //prod.Price = Convert.ToDecimal(KhoaY.Controller.Utilities.FormatMoney(textPrice.Text));
            prod.Price = Convert.ToDecimal(textPrice.Text.Replace(".",string.Empty));
           
            prod.Location = textLocation.Text;
            prod.ProductImageID = SavedProductImageID;
            if (fileuploadProductImage.HasFile)
            {
                prod.ProductImage = fileuploadProductImage.FileBytes;
            }
            else
            {
                try
                {
                    ProcessProductImages processproductimages = new ProcessProductImages();
                    prod.ProductImage = (byte[])processproductimages.ProductImageSelectByIDData(prod.ProductImageID);

                }
                catch (Exception ex)
                {
                    KhoaY.Controller.Utilities.LogException(ex);
                    //Response.Write(ex.ToString());
                }
            }
            try {
                ProcessProduct processproduct = new ProcessProduct();
                processproduct.ProductUpdateData(prod);
                Response.Redirect("Products.aspx",false);
            }
            catch (Exception ex) {
                //Response.Write(ex.ToString());
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
        if (Utilities.CheckNumeric(textPrice.Text.Replace(".",string.Empty)))
        {
            args.IsValid = true;
        }
        else
            args.IsValid = false;
    }
}