using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KhoaY.Model
{
    public class OrderStatus
    {
        public OrderStatus()
        { 
        }
        private int _orderstatusid;

        public int OrderStatusID
        {
            get { return _orderstatusid; }
            set { _orderstatusid = value; }
        }
        private int _orderstatusname;

        public int OrderStatusName
        {
            get { return _orderstatusname; }
            set { _orderstatusname = value; }
        }

    }
}
