using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KhoaY.Model
{
    public class ProductImages
    {
        private int _productimageid;

        public int ProductImageID
        {
            get { return _productimageid; }
            set { _productimageid = value; }
        }
        private byte[] _productimage;

        public byte[] ProductImage
        {
            get { return _productimage; }
            set { _productimage = value; }
        }
    }
}
