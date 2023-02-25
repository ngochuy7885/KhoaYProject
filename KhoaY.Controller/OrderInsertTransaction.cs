using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KhoaY.Controller;
using KhoaY.Model;
namespace KhoaY.Controller
{
    public class OrderInsertTransaction : TransactionBase
    {
        public OrderInsertTransaction()
        { }
        public int Begin(Orders orders)
        {
            int orderID = 0;
            command = connection.CreateCommand();
            transaction = connection.BeginTransaction("OrderInsert");
            command.Connection = connection;
            command.Transaction = transaction;

            ProcesssOrders orderadd = new ProcesssOrders();
            ProcessOrderDetails orderdetailsadd = new ProcessOrderDetails();
            try
            {
                //Insert Order.
                orderID = orderadd.OrderInsertData(transaction, orders);
                
                //Insert Order Details.
                for (int i = 0; i < orders.OrderDetails.Products.Length; i++)
                {
                    orders.OrderDetails.OrderID = orderID;
                    orders.OrderDetails.ProductID = orders.OrderDetails.Products[i].ProductID;
                    orders.OrderDetails.Quantity = orders.OrderDetails.Products[i].Quantity;
                    orders.OrderDetails.Price = orders.OrderDetails.Products[i].Price;
                    orders.OrderDetails.ProductName = orders.OrderDetails.Products[i].ProductName;
                    orders.OrderDetails.ProductUnitName = orders.OrderDetails.Products[i].ProductUnit.ProductUnitName;
                   
                    orderdetailsadd.OrderDetailsInsertData(transaction, orders.OrderDetails);
                }
                transaction.Commit();
                return orderID;
            }
            catch (Exception ex)
            {
                transaction.Rollback("OrderInsert");
                throw ex;
            }
        }
    }
}
