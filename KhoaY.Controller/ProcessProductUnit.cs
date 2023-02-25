using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KhoaY.Model;
namespace KhoaY.Controller
{
    public class ProcessProductUnit:DataAccessBase
    {
        public DataSet ProductUnitSelectData()
        {
            DataSet ds;
            DatabaseHelper dbhelper = new DatabaseHelper("ProductUnit_Select");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public void ProductUnitInsertData(ProductUnit productunit)
        {
            SqlParameter[] parameters =
                    {
                        new SqlParameter( "@ProductUnitName",productunit.ProductUnitName) ,
                        
                    };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductUnit_Insert");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
        public void ProductUnitUpdateData(ProductUnit productunit)
        {
            SqlParameter[] parameters =
                    {
                         new SqlParameter("@ProductUnitID", productunit.ProductuUnitId),
                 
                        new SqlParameter( "@ProductUnitName",productunit.ProductUnitName)
                     };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductUnit_Update");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
        public void ProductCategoryDeleteData(ProductUnit productunit)
        {
            SqlParameter[] parameters =
                    {
                         new SqlParameter("@ProductUnitID", productunit.ProductuUnitId),                      
                     };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductUnit_Delete");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
    }
}
