using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KhoaY.Model
{
    public class ProductUnit
    {
        public ProductUnit()
        {

        }
        private int _productunitid;

        public int ProductuUnitId
        {
            get { return _productunitid; }
            set { _productunitid = value; }
        }
        private string _productunitname;

        public string ProductUnitName
        {
            get { return _productunitname; }
            set { _productunitname = value; }
        }

       
        
    }
}
