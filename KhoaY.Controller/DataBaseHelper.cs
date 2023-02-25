using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

using Microsoft.ApplicationBlocks.Data;
/// <summary>
/// Summary description for DataBaseHelper
/// </summary>
/// 

namespace KhoaY.Controller
{
    public class DatabaseHelper : DataAccessBase
    {
        public DatabaseHelper()
        {


        }
        //
        // TODO: Add constructor logic here
        //
        public DatabaseHelper(string storeprocedurename)
        {
            StoreProcedureName = storeprocedurename;
        }
        private SqlParameter[] _parameters;

        public SqlParameter[] Parameters
        {
            get { return _parameters; }
            set { _parameters = value; }
        }
        public void Run(SqlTransaction transaction)
        {
            SqlHelper.ExecuteNonQuery(transaction, CommandType.StoredProcedure, StoreProcedureName, Parameters);
        }
        public void Run(SqlTransaction transaction, SqlParameter[] parameters)
        {
            SqlHelper.ExecuteNonQuery(transaction, CommandType.StoredProcedure, StoreProcedureName, parameters);
        }
        public DataSet Run(string connectionstring, SqlParameter[] parameters)
        {
            DataSet ds;
            ds = SqlHelper.ExecuteDataset(connectionstring, StoreProcedureName, parameters);
            return ds;
        }
        public object RunScalar(string connectionstring, SqlParameter[] parameters)
        {
            object obj;
            obj = SqlHelper.ExecuteScalar(connectionstring, StoreProcedureName, parameters);
            return obj;
        }
        public object RunScalar(SqlTransaction transaction, SqlParameter[] parameters)
        {
            Object obj;
            obj = SqlHelper.ExecuteScalar(transaction, StoreProcedureName, parameters);
            return obj;
        }
        public DataSet Run(String connectionstring)
        {
            DataSet ds;
            ds = SqlHelper.ExecuteDataset(connectionstring, CommandType.StoredProcedure, StoreProcedureName);
            return ds;
        }
        public void Run()
        {
            SqlHelper.ExecuteNonQuery(base.ConnectionString, CommandType.StoredProcedure, StoreProcedureName, Parameters);
        }
        public int RunReturn()
        {
            int i = 0;
            i = SqlHelper.ExecuteNonQuery(base.ConnectionString, CommandType.StoredProcedure, StoreProcedureName, Parameters);
            return i;
        }
        public SqlDataReader Run(SqlParameter[] parameters)
        {
            SqlDataReader dr;
            dr = SqlHelper.ExecuteReader(base.ConnectionString, CommandType.StoredProcedure, StoreProcedureName, parameters);
            return dr;
        }
        
    }
}
