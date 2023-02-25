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
    public class ProcesssOrders: DataAccessBase
    {
        public int OrderInsertData(SqlTransaction transaction, Orders order)
        {
            SqlParameter[] parameters =
                    {
                        new SqlParameter( "@EndUserID", order.EndUserID ) ,
                        new SqlParameter( "@ProductName" , order.TransactionID) ,  
                       
                    };
            DatabaseHelper dbhelper = new DatabaseHelper("Order_Insert");
            object Id = dbhelper.RunScalar(transaction, parameters);
            int orderid = int.Parse(Id.ToString());
            return orderid;
        }
        public DataSet OrderSelectByOrderID(int OrderId) {
            SqlParameter[] parameters =
                    {
                        new SqlParameter( "@OrderID", OrderId ) ,
                       
                    };
            DatabaseHelper dbhelper = new DatabaseHelper("OrderByOrderID_Select");
            DataSet ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }
        public DataSet OrderSearchSelectByOrderID(int OrderId)
        {
            SqlParameter[] parameters =
                    {
                        new SqlParameter( "@OrderID", OrderId ) ,
                       
                    };
            DatabaseHelper dbhelper = new DatabaseHelper("OrdersSearchByOrderId_Select");
            DataSet ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }
        public DataSet OrdersSelectByEndUserID(EndUser EndUser){
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
                    {
                        new SqlParameter( "@EndUserID", EndUser.EndUserID ) ,
                       
                    };
            DatabaseHelper dbhelper = new DatabaseHelper("Orders_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }
        public DataSet OrderSelectByIDData (Orders order){ 
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
                    {
                        new SqlParameter( "@OrderID", order.OrderID ) ,
                       
                    };
            DatabaseHelper dbhelper = new DatabaseHelper("OrdersByID_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }
        public Orders OrderSelectOrderByIDData(int orderid)
        {
            Orders orders = new Orders();
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
                    {
                        new SqlParameter( "@OrderID", orderid ) ,
                       
                    };
            DatabaseHelper dbhelper = new DatabaseHelper("OrdersByID_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["ShipDate"].ToString() != "")
                {
                    orders.ShipDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["ShipDate"].ToString());               
                }
                orders.TrackingNumber = ds.Tables[0].Rows[0]["TrackingNumber"].ToString();
                orders.OrderStatusID = int.Parse(ds.Tables[0].Rows[0]["OrderStatusID"].ToString());
            }
            return orders;
        }
        public DataSet OrderSearchOrderAndProductName(string search)
        {
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@SearchCriteria" , search)
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("OrdersSearchByCriteria_Selectv1");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;

        }
        public DataSet OrderSearchByProductName(string search)
        {
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@SearchCriteria" , search)
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("OrdersSearchByProduct_Selectv1");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;

        }
       
        public DataSet OrdersAllSelectData() {
            DataSet ds = new DataSet();
            DatabaseHelper dbhelper = new DatabaseHelper("OrdersAll_Select");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public DataSet OrdersSearchRecently() {
            DataSet ds = new DataSet();
            DatabaseHelper dbhelper = new DatabaseHelper("OrdersSearchRecent_Select");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public void OrderUpdateData(Orders orders) {
            SqlParameter[] parameters =
                    {
                    new SqlParameter( "@OrderID", orders.OrderID ) ,
                    new SqlParameter( "@OrderStatusID" ,orders.OrderStatusID ) ,
                    new SqlParameter( "@ShipDate", orders.ShipDate ) ,
                    new SqlParameter( "@TrackingNumber", orders.TrackingNumber )
                    };
            DatabaseHelper dbhelper = new DatabaseHelper("Orders_Update");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
            
        }
    }
}
