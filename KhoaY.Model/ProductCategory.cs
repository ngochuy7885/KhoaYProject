using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KhoaY.Model
{
    public class ProductCategory
    {
        private int _productcategoryid;
        private string _productcategoryname;

        public ProductCategory()
        {

        }

        public int ProductCategoryID
        {
            get { return _productcategoryid; }
            set { _productcategoryid = value; }
        }

        public string ProductCategoryName
        {
            get { return _productcategoryname; }
            set { _productcategoryname = value; }
        }
    }
}
