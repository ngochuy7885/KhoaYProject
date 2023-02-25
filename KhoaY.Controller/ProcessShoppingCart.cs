using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KhoaY.Model;
using System.Data.SqlClient;
using System.Data;

namespace KhoaY.Controller
{
    public class ProcessShoppingCart:DataAccessBase
    {
        public void ShoppingCartInsertData(ShoppingCart shoppingcart) { 
            SqlParameter[] parameters  =
            {
                new SqlParameter( "@CartGUID" ,shoppingcart.CartGUID ) ,
                new SqlParameter( "@ProductID",shoppingcart.ProductID ) ,
                new SqlParameter( "@Quantity",shoppingcart.Quantity )
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ShoppingCart_Insert");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
        public DataSet ShoppingCartSelectData(string CartGUID) {
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
            {
                new SqlParameter( "@CartGUID" ,CartGUID) 
                
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ShoppingCart_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }
        public void ShoppingCartUpdateData(ShoppingCart shoppingcart) {
            SqlParameter[] parameters = {
                new SqlParameter("@Quantity",shoppingcart.Quantity),
                new SqlParameter("@ShoppingCartID", shoppingcart.ShoppingCartID)             
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ShoppingCart_Update");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
        public void ShoppingCartDeleteData(ShoppingCart shoppingcart) {
            SqlParameter[] parameters = {
                
                new SqlParameter("@ShoppingCartID", shoppingcart.ShoppingCartID)             
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ShoppingCart_Delete");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
    }
}
