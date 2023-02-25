using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KhoaY.Model;
using System.Data.SqlClient;
namespace KhoaY.Controller
{
    public class ProcessProductCategory:DataAccessBase
    {
        public DataSet ProductCategorySelectData()
        {
            DataSet ds;
            DatabaseHelper dbhelper = new DatabaseHelper("ProductCategory_Select");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public DataSet ProductCategorySelectByIDDataSet(int ProductCategoryID)
        {
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@ProductCategoryID" , ProductCategoryID)
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductCategoryByID_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);

            return ds;
        }
        public void ProductCategoryInsertData(ProductCategory productcategory)
        {
            SqlParameter[] parameters =
                    {
                        new SqlParameter( "@ProductCategoryName",productcategory.ProductCategoryName) ,
                        
                    };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductCategory_Insert");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
        public void ProductCategoryUpdateData(ProductCategory productcategory)
        {
            SqlParameter[] parameters =
                    {
                         new SqlParameter("@ProductCategoryID", productcategory.ProductCategoryID),
                 
                        new SqlParameter( "@ProductCategoryName",productcategory.ProductCategoryName)
                     };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductCategory_Update");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
        public void ProductCategoryDeleteData(ProductCategory productcategory)
        {
            SqlParameter[] parameters =
                    {
                         new SqlParameter("@ProductCategoryID", productcategory.ProductCategoryID),                      
                     };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductCategory_Delete");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
    }
}
