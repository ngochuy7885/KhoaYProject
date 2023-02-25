using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KhoaY.Model
{
    public class OrderDetails
    {
        private int _orderdetailid;
		private int _orderid;
		private int _productid;
		private int _quantity;
		private Product[ ] _products;
        private decimal _price;
        private string _productname;
        private string _productunitname;

        public string ProductUnitName
        {
            get { return _productunitname; }
            set { _productunitname = value; }
        }

        public string ProductName
        {
            get { return _productname; }
            set { _productname = value; }
        }


        public decimal Price
        {
            get { return _price; }
            set { _price = value; }
        }
		public OrderDetails()
		{
			
		}

		public int OrderDetailID
		{
			get { return _orderdetailid; }
			set { _orderdetailid = value; }
		}
		
		public int OrderID
		{
			get { return _orderid; }
			set { _orderid = value; }
		}
		
		public int ProductID
		{
			get { return _productid; }
			set { _productid = value; }
		}

		public Product[ ] Products
		{
			get { return _products; }
			set { _products = value; }
		}
		
		public int Quantity
		{
			get { return _quantity; }
			set { _quantity = value; }
		}
	}
}
