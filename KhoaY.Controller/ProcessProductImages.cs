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
    public class ProcessProductImages:DataAccessBase
    {
        public object ProductImageSelectByIDData(int productimageid)
        {
            SqlParameter[] parameters = 
            {
                new SqlParameter("@ProductImageID",productimageid)
            };
            object imagedata;
            DatabaseHelper dbhelpler = new DatabaseHelper("ProductImagesByID_Select");
            imagedata = dbhelpler.RunScalar(base.ConnectionString, parameters);

            return imagedata;
        }
        public bool ProductImageCheckDouble(int productimageid)
        {
            bool result = false;
            DataSet ds;
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@ProductImageID" , productimageid)
                   
            };
            KhoaY.Controller.DatabaseHelper dbhelper = new DatabaseHelper("ProductImageCheckDouble_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            if (ds.Tables[0].Rows.Count != 0)
            {
                result = false;
            }
            else
            {
               result = true;
            }

            return result;  

        }
    }
}
