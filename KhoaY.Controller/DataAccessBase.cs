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
using System.Web.Configuration;
/// <summary>
/// Summary description for DataAccessBase
/// </summary>
/// 
public class DataAccessBase
{
	public DataAccessBase()
	{        
	}
    private string _storeprocedureName;

    public string StoreProcedureName
    {
        get { return _storeprocedureName; }
        set { _storeprocedureName = value; }
    }
    protected string ConnectionString
    {
        get
        {
            return ConfigurationManager.ConnectionStrings["SQLCONN"].ToString();
        }
    }
}
