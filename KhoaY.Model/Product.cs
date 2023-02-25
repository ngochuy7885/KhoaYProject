using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KhoaY.Model
{
    public class Product
    {
        private int _productid;
        private int _productcategoryid;
        private ProductCategory _productcategory;
        //private ProductImages _productimages;
        private string _productname;
        private int _productimageid;         
        private byte[] _productimage;       
        private string _description;
        private string _descriptionhtml;
        private decimal _price;
        private string _location;
        private int _quantity;
        private int _productunitid;
        private ProductUnit _productunit;
        private string searchname;
        private string _quotationname;
        private bool _isdelete;

        public bool IsDelete
        {
            get { return _isdelete; }
            set { _isdelete = value; }
        }
    

        public string QuotationName
        {
            get { return _quotationname; }
            set { _quotationname = value; }
        }

        public string SearchName
        {
            get { return searchname; }
            set { searchname = value; }
        }

        public Product()
        {
            _productcategory = new ProductCategory();
            _productunit = new ProductUnit();
            //_productimages = new ProductImages();
        }
        public ProductUnit ProductUnit
        {
            get { return _productunit; }
            set { _productunit = value; }
        }

        public int ProductUnitId
        {
            get { return _productunitid; }
            set { _productunitid = value; }
        }

        public int Quantity
        {
            get { return _quantity; }
            set { _quantity = value; }
        }
        
        public int ProductID
        {
            get { return _productid; }
            set { _productid = value; }
        }
        //public ProductImages ProductImages
        //{
        //    get { return _productimages; }
        //    set { _productimages = value; }
        //}
        public int ProductCategoryID
        {
            get { return _productcategoryid; }
            set { _productcategoryid = value; }
        }
        public int ProductImageID
        {
            get { return _productimageid; }
            set { _productimageid = value; }
        }
        public ProductCategory ProductCategory
        {
            get { return _productcategory; }
            set { _productcategory = value; }
        }
        public string ProductName
        {
            get { return _productname; }
            set { _productname = value; }
        }

        
        public byte[] ProductImage
        {
            get { return _productimage; }
            set { _productimage = value; }
        }
        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        public string DescriptionHTML
        {
            get { return _descriptionhtml; }
            set { _descriptionhtml = value; }
        }
        public decimal Price
        {
            get { return _price; }
            set { _price = value; }
        }
        public string Location
        {
            get { return _location; }
            set { _location = value; }
        }
    }
}
