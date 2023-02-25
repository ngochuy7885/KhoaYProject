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
    public class ProcessProduct : DataAccessBase
    {
        public void ProductInsertData(Product product) { 
            SqlParameter[] parameters =
                    {
                        new SqlParameter( "@ProductCategoryID",product.ProductCategoryID ) ,
                        new SqlParameter("@ProductUnitID", product.ProductUnitId),
                        new SqlParameter( "@ProductName" , product.ProductName ) ,  
                         new SqlParameter( "@SearchName" , product.SearchName ) ,
                          new SqlParameter("@QuotationName" , product.QuotationName ) ,
                        new SqlParameter("@ProductImage", product.ProductImage ) ,
                    
                        new SqlParameter( "@Description" , product.Description ) ,
                        new SqlParameter( "@DescriptionHTML" , product.DescriptionHTML ) ,
                        new SqlParameter( "@Price" , product.Price ),
                        new SqlParameter("@Location", product.Location)
                    };
            DatabaseHelper dbhelper = new DatabaseHelper("Product_Insert");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
        public void ProductUpdateData(Product product)
        { 
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@ProductCategoryID" , product.ProductCategoryID ) ,
                    new SqlParameter( "@ProductUnitID", product.ProductUnitId),
                    new SqlParameter( "@ProductName" , product.ProductName ) ,
                    new SqlParameter("@SearchName" , product.SearchName ) ,
                    new SqlParameter("@QuotationName" , product.QuotationName ) ,
                    new SqlParameter( "@ProductImageID", product.ProductImageID),
                    new SqlParameter( "@ProductImage" , product.ProductImage) ,
                    new SqlParameter( "@Description" , product.Description ) ,
                    new SqlParameter( "@DescriptionHTML" , product.DescriptionHTML ) ,
                    new SqlParameter( "@Price" , product.Price ) ,
                    new SqlParameter( "@Location", product.Location),
                    new SqlParameter( "@ProductID" , product.ProductID )
            };
            DatabaseHelper dbhelper = new DatabaseHelper("Product_Update");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
        public DataSet ProductSelectSearchData(string search) {
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@SearchCriteria" , search)
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("Products_SelectSearch");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }
        public DataSet ProductSearchOrderAndProductName( string search, EndUser enduser)
        {
            DataSet ds = new DataSet();
          
            SqlParameter[] parameters =
            {
                new SqlParameter( "@SearchCriteria" , search),
                    new SqlParameter("@EndUserID",enduser.EndUserID)
                    
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("Products_SelectSearchv2");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }
        public DataSet ProductSearchOrderAndProductNameUser(string search, EndUser enduser)
        {
            DataSet ds = new DataSet();

            SqlParameter[] parameters =
            {
                new SqlParameter( "@SearchCriteria" , search),
                    new SqlParameter("@EndUserID",enduser.EndUserID)
                    
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("Products_SelectSearchv2");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }

        public DataSet ProductSearchByProductName(string search)
        {
            DataSet ds = new DataSet();

            SqlParameter[] parameters =
            {
                new SqlParameter( "@SearchCriteria" , search)
                   
                    
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductsByProductName_SelectSearchv2");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }
        public DataSet ProductSearchByProductNameUser(string search)
        {
            DataSet ds = new DataSet();

            SqlParameter[] parameters =
            {
                new SqlParameter( "@SearchCriteria" , search)
                   
                    
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductsByProductNameUser_SelectSearchv2");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }

        public Product ProductSelectByIDData(int ProductID)
        {
            Product product = new Product();
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@ProductID" , ProductID)
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductByID_Select");
            DataSet ds = dbhelper.Run(base.ConnectionString,parameters);

            product.ProductID = int.Parse(ds.Tables[0].Rows[0]["ProductID"].ToString());
            product.ProductCategory.ProductCategoryID = int.Parse(ds.Tables[0].Rows[0]["ProductCategoryID"].ToString());
            product.ProductCategory.ProductCategoryName = ds.Tables[0].Rows[0]["ProductCategoryName"].ToString();
            
            product.ProductUnit.ProductuUnitId = int.Parse(ds.Tables[0].Rows[0]["ProductUnitID"].ToString());
            product.ProductUnit.ProductUnitName = ds.Tables[0].Rows[0]["ProductUnitName"].ToString();
           
            
            product.ProductName = ds.Tables[0].Rows[0]["ProductName"].ToString();
            product.SearchName = ds.Tables[0].Rows[0]["SearchName"].ToString();
            product.QuotationName = ds.Tables[0].Rows[0]["QuotationName"].ToString();
            product.Description = ds.Tables[0].Rows[0]["Description"].ToString();
            product.DescriptionHTML = ds.Tables[0].Rows[0]["DescriptionHTML"].ToString();
            product.Price = decimal.Parse(ds.Tables[0].Rows[0]["Price"].ToString());
            product.ProductImageID = int.Parse(ds.Tables[0].Rows[0]["ProductImageID"].ToString());
            product.ProductImage = (byte[])ds.Tables[0].Rows[0]["ProductImage"];
            product.Location = ds.Tables[0].Rows[0]["Location"].ToString();
            return product;
        }
        public DataSet ProductSelectByIDDataSet(int ProductID)
        {
            DataSet ds  = new DataSet();
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@ProductID" , ProductID)
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductByID_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);

            return ds;
        }
        public DataSet ProductSelectBySearchName(string SearchName)
        {
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@SearchName" , SearchName)
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductAutocompleteBySearchName_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);

            return ds;
        }
        public DataSet ProductDeletedSelectBySearchName(string SearchName)
        {
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@SearchName" , SearchName)
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductDeletedBySearchName_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);

            return ds;
        }
        public DataSet ProductSelectByCategoryID(int ProductCategoryID)
        {
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@ProductCategoryID" , ProductCategoryID)
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductByCategoryID_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);

            return ds;
        }

        public DataSet ProductSelectData() {
            DataSet ds;
            DatabaseHelper dbhelper = new DatabaseHelper("Product_Select");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public DataSet DeletedProductSelectData()
        {
            DataSet ds;
            DatabaseHelper dbhelper = new DatabaseHelper("ProductDeleted_Select");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public DataSet ProductAdminSelectData()
        {
            DataSet ds;
            DatabaseHelper dbhelper = new DatabaseHelper("ProductAdmin_Select");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public DataSet ProductSelectTop6BestSeller()
        {
            DataSet ds;
            DatabaseHelper dbhelper = new DatabaseHelper("Product_SelectTop6BestSeller");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public DataSet ProductQuote() {
            DataSet ds;
            DatabaseHelper dbhelper = new DatabaseHelper("Products_Quote");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public DataSet ProductQuotev1()
        {
            DataSet ds;
            DatabaseHelper dbhelper = new DatabaseHelper("Products_Quotev1");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public DataSet ProductLocation()
        {
            DataSet ds;
            DatabaseHelper dbhelper = new DatabaseHelper("Products_Location");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public DataSet ProductPrice()
        {
            DataSet ds;
            DatabaseHelper dbhelper = new DatabaseHelper("Products_Price");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
       
        public DataSet ProductPromotionSelectData(Product product) {
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
                {
                    new SqlParameter( "@ProductID" , product.ProductID )
                };
            DatabaseHelper dbhelper = new DatabaseHelper("ProductPromotion_Select");
            ds = dbhelper.Run(base.ConnectionString,parameters  );
            return ds;
        }
        public int ProductDeleteData(Product product)
        {
            int i = 0;
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SQLCONN"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("Product_Delete", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@ProductId", product.ProductID));
                conn.Open();
                i = cmd.ExecuteNonQuery();
                conn.Close();
            }
            //string conString = ConfigurationManager.ConnectionStrings["SQLCONN1"].ConnectionString;
            //string query = "DELETE FROM Products WHERE ProductId = @Id";
            //SqlCommand cmd = new SqlCommand(query);
            //SqlConnection con = new SqlConnection(conString);
            //cmd.Connection = con;
            //con.Open();
            //cmd.Parameters.AddWithValue("@Id", id);
            //int i = cmd.ExecuteNonQuery();
            return i;
        }
        public int ProductDeleteDataV1(Product product)
        {
            int i = 0;
            SqlParameter[] parameters =
                    {
                         new SqlParameter("@ProductID", product.ProductID),                      
                     };
            DatabaseHelper dbhelper = new DatabaseHelper("Product_DeleteV1");
            dbhelper.Parameters = parameters;
            i = dbhelper.RunReturn();
            return i;
            
        }
        public int ProductRecoverData(Product product)
        {
            int i = 0;
            SqlParameter[] parameters =
                    {
                         new SqlParameter("@ProductID", product.ProductID),                      
                     };
            DatabaseHelper dbhelper = new DatabaseHelper("Product_Recovery");
            dbhelper.Parameters = parameters;
            i = dbhelper.RunReturn();
            return i;

        }
        
        public bool ProductCheckDouble(string productname)
        {
            bool IsAuthenticated = false;
            DataSet ds;
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@ProductName" , productname)
                   
            };
            KhoaY.Controller.DatabaseHelper dbhelper = new DatabaseHelper("ProductCheckDouble_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            if (ds.Tables[0].Rows.Count != 0)
            {
                IsAuthenticated = false;
            }
            else
            {
                IsAuthenticated = true;
            }

            return IsAuthenticated;
        }
        public bool ProductCheckDelete(Product product) {
            bool IsDelete = false;
            DataSet ds;
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@ProductId" , product.ProductID)
                   
            };
            KhoaY.Controller.DatabaseHelper dbhelper = new DatabaseHelper("ProductCheckDelete_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            
            IsDelete = (bool)ds.Tables[0].Rows[0]["IsDelete"];
            

            return IsDelete;
        }
    }
}
