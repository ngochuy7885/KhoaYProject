using KhoaY.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KhoaY.Controller
{
    public class ProcessOrderDetails:DataAccessBase
    {
        public void OrderDetailsInsertData(SqlTransaction transaction, OrderDetails orderdetails)
        {
            SqlParameter[] parameters =
            {
            new SqlParameter( "@OrderID" , orderdetails.OrderID ) ,
            new SqlParameter( "@ProductID" , orderdetails.ProductID ) ,
            new SqlParameter( "@Quantity" , orderdetails.Quantity ),
            new SqlParameter("@Price",orderdetails.Price),
            new SqlParameter("@ProductName",orderdetails.ProductName),
            new SqlParameter("@ProductUnitName", orderdetails.ProductUnitName)

            };
            DatabaseHelper dbhelper = new DatabaseHelper("OrderDetails_Insert");
            dbhelper.Run(transaction, parameters);
        }
        public DataSet OrderDetailsSelectData(OrderDetails OrderDetails) {

            SqlParameter[] parameters =
            {
                new SqlParameter( "@OrderID" , OrderDetails.OrderID ) ,
           
            };
            DatabaseHelper dbhelper = new DatabaseHelper("OrderDetails_Select");
            DataSet ds = new DataSet();
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }
    }
}
