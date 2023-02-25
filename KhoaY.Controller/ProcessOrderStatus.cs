using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KhoaY.Controller
{
    public class ProcessOrderStatus: DataAccessBase
    {
        public DataSet OrderStatusSelectData(){
            DataSet ds = new DataSet();
            DatabaseHelper dbhelper = new DatabaseHelper("OrderStatus_Select");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
    }
}
