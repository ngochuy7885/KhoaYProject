using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Model;
using KhoaY.Controller;
public partial class AddToCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        KhoaY.Model.ShoppingCart shoppingcart = new KhoaY.Model.ShoppingCart();
        shoppingcart.ProductID = int.Parse(Request.QueryString["ProductID"]);
        shoppingcart.CartGUID = Utilities.GetCartGUID();
        shoppingcart.Quantity = 1;
        ProcessShoppingCart processshoppingcart = new ProcessShoppingCart();
        try
        {
            processshoppingcart.ShoppingCartInsertData(shoppingcart);
            
        }
        catch (Exception ex) {
            Response.Write(ex.ToString());
        }
        Response.Redirect("ShoppingCart.aspx?ProductID=" + Request.QueryString["ProductID"],false);
    }
    
}