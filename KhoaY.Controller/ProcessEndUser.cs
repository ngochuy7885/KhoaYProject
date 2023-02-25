using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KhoaY.Model;
using System.Data;
using System.Data.SqlClient;

namespace KhoaY.Controller
{
    public class ProcessEndUser:DataAccessBase
    {
        public bool AdminLoginSelectData(EndUser EndUser)
        {
            bool IsAuthenticated = false;
            DataSet ds;
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@Email" ,EndUser.ContactInformation.Email ) ,
                    new SqlParameter( "@Password" , EndUser.Password )
            };
            KhoaY.Controller.DatabaseHelper dbhelper = new DatabaseHelper("AdminLogin_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            if (ds.Tables[0].Rows.Count != 0)
            {
                IsAuthenticated = true;
            }
            else
            {
                IsAuthenticated = false;
            }

            return IsAuthenticated;  
        }
        public bool EndUserCheckDouble(string email)
        {
            bool IsAuthenticated = false;
            DataSet ds;
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@Email" , email)
                   
            };
            KhoaY.Controller.DatabaseHelper dbhelper = new DatabaseHelper("EndUserCheckDouble_Select");
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
        //public void EndUserInsertData1(EndUser enduser) {
        //    SqlParameter[] parameters =
        //        {
        //            new SqlParameter( "@FirstName" , enduser.FirstName ) ,
        //            new SqlParameter( "@LastName" , enduser.LastName ) ,
        //            new SqlParameter( "@AddressLine", enduser.Address.AddressLine ) ,
        //            new SqlParameter( "@AddressLine2" , enduser.Address.AddressLine2 ) ,
        //            new SqlParameter( "@City" , enduser.Address.City ) ,
        //            new SqlParameter( "@State" , enduser.Address.State ) ,
        //            new SqlParameter( "@PostalCode" , enduser.Address.PostalCode ) ,
        //            new SqlParameter( "@Phone" , enduser.ContactInformation.Phone ) ,
        //            new SqlParameter( "@Phone2" , enduser.ContactInformation.Phone2 ) ,
        //            new SqlParameter( "@Fax" , enduser.ContactInformation.Fax ) ,
        //            new SqlParameter( "@Email" , enduser.ContactInformation.Email ) ,
        //            new SqlParameter( "@EndUserTypeID" , enduser.EndUserTypeID ) ,
        //            new SqlParameter( "@Password" ,enduser.Password ) ,
        //            new SqlParameter( "@IsSubscribed" , enduser.IsSubscribed )
        //    };
        //    SqlConnection con = new SqlConnection(@"Server=VPC2K8\SQL2K8DB; Database=KhoaY; Integrated Security=True;");
        //    SqlCommand cmd = new SqlCommand();
        //    con.Open();
        //    cmd.Connection = con;
        //    cmd.CommandText = "EndUser_Insert";
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    //cmd.Parameters.AddRange(parameters);
        //    cmd.Parameters.AddWithValue("@FirstName", enduser.FirstName);
        //    cmd.Parameters.AddWithValue("@LastName", enduser.LastName);
        //    cmd.Parameters.AddWithValue("@AddressLine", enduser.Address.AddressLine);
        //    cmd.Parameters.AddWithValue("@AddressLine2", enduser.Address.AddressLine2);
        //    cmd.Parameters.AddWithValue("@City", enduser.Address.City);
        //    cmd.Parameters.AddWithValue("@State", enduser.Address.State);
        //    cmd.Parameters.AddWithValue("@PostalCode", enduser.Address.PostalCode);
        //    cmd.Parameters.AddWithValue("@Phone", enduser.ContactInformation.Phone);
        //    cmd.Parameters.AddWithValue("@Phone2", enduser.ContactInformation.Phone2);
        //    cmd.Parameters.AddWithValue("@Email", enduser.ContactInformation.Email);
        //    cmd.Parameters.AddWithValue("@Password", enduser.Password);
        //    cmd.Parameters.AddWithValue("@IsSubscribed", enduser.IsSubscribed);

        //    //cmd.Parameters.AddWithValue("@PID", 3);
        //    //cmd.Parameters.AddWithValue("@PName", TextBox1.Text);
        //    cmd.ExecuteNonQuery();
        //    con.Close();

        //}
        public int EndUserInsertData(EndUser enduser) { 
            SqlParameter[ ] parameters =
                {
                    new SqlParameter( "@FirstName" , enduser.FirstName ) ,
                    new SqlParameter( "@LastName" , enduser.LastName ) ,
                    new SqlParameter( "@AddressLine", enduser.Address.AddressLine ) ,
                    new SqlParameter( "@AddressLine2" , enduser.Address.AddressLine2 ) ,
                    new SqlParameter( "@City" , enduser.Address.City ) ,
                    new SqlParameter( "@State" , enduser.Address.State ) ,
                    new SqlParameter( "@PostalCode" , enduser.Address.PostalCode ) ,
                    new SqlParameter( "@Phone" , enduser.ContactInformation.Phone ) ,
                    new SqlParameter( "@Phone2" , enduser.ContactInformation.Phone2 ) ,
                    new SqlParameter( "@Fax" , enduser.ContactInformation.Fax ) ,
                    new SqlParameter( "@Email" , enduser.ContactInformation.Email ) ,
                    new SqlParameter( "@EndUserTypeID" , enduser.EndUserTypeID ) ,
                    new SqlParameter( "@Password" ,enduser.Password ) ,
                    new SqlParameter( "@IsSubscribed" , enduser.IsSubscribed )
            };
            KhoaY.Controller.DatabaseHelper dbhelper = new KhoaY.Controller.DatabaseHelper("EndUser_Insert");
            object id = new object();
            id = dbhelper.RunScalar(base.ConnectionString, parameters);
            return int.Parse(id.ToString());
            
        }
        public void EndUserUpdateData(EndUser enduser)
        {
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@AddressID" , enduser.Address.AddressID ) ,
                    new SqlParameter( "@AddressLine" , enduser.Address.AddressLine ) ,
                    new SqlParameter( "@AddressLine2", enduser.Address.AddressLine2),
                    new SqlParameter( "@City" , enduser.Address.City) ,
                    new SqlParameter( "@State" , enduser.Address.State ) ,
                    new SqlParameter( "@PostalCode" , enduser.Address.PostalCode ) ,
                    
                    new SqlParameter( "@ContactInformationID" , enduser.ContactInformation.ContactInformationID) ,
                    new SqlParameter("@Phone", enduser.ContactInformation.Phone),
                    new SqlParameter("@Phone2", enduser.ContactInformation.Phone2),
                    new SqlParameter("@Fax", enduser.ContactInformation.Fax),
                    
                    new SqlParameter("@EndUserID", enduser.EndUserID),
                    new SqlParameter("@EndUserTypeID", enduser.EndUserTypeID),
                    new SqlParameter("@FirstName", enduser.FirstName),
                    new SqlParameter("@LastName", enduser.LastName),
                  
            };
            DatabaseHelper dbhelper = new DatabaseHelper("EndUser_Update");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
        public DataSet EndUserLoginSelectData(EndUser enduser)
        {
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
                {
                new SqlParameter( "@Email" , enduser.ContactInformation.Email ) ,
                new SqlParameter( "@Password" , enduser.Password )
                };
            DatabaseHelper dbhelper = new DatabaseHelper("EndUserLogin_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);
            return ds;
        }
        public DataSet NewsletterSelectData() {
            DataSet ds = new DataSet();
            DatabaseHelper dbhelper = new DatabaseHelper("Newsletter_Select");
            ds = dbhelper.Run(base.ConnectionString);
            return ds;
        }
        public void NewsletterUpdateData(EndUser enduser) {
            SqlParameter[] parameters =
                {
                new SqlParameter( "@EndUserID" , enduser.EndUserID ) ,
               
                };
            DatabaseHelper dbhelper = new DatabaseHelper("NewsletterUnsubscribe_Update");
            dbhelper.Parameters = parameters;
            dbhelper.Run();
        }
        public DataSet EndUserSelectByEndUserID(EndUser enduser) {
            DataSet ds = new DataSet();
            SqlParameter[] parameters =
            {
                    new SqlParameter( "@EndUserID" , enduser.EndUserID)
                    
            };
            DatabaseHelper dbhelper = new DatabaseHelper("EndUserByEndUserID_Select");
            ds = dbhelper.Run(base.ConnectionString, parameters);

            return ds;
        }

    }
}
