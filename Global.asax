<%@ Application Language="C#" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

   
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        Application["Hits"] = 0;
        Application["Sessions"] = 0;
        Application["TerminatedSessions"] = 0;
        Application["OnlineUsers"] = 0;

        Application.Lock();
        System.IO.StreamReader rd = new System.IO.StreamReader(Server.MapPath("sl.txt"));
        string s = rd.ReadLine();
        rd.Close();
        Application.UnLock();
        Application.Add("HitCounters", s);

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

        Exception ex = Server.GetLastError();
        KhoaY.Controller.Utilities.LogException(ex);


    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        Application.Lock();
        Application["OnlineUsers"] = (int)Application["OnlineUsers"] + 1;
        Application.UnLock();
        
        Application.Lock();
        Application["Sessions"] = (int)Application["Sessions"] + 1;
        Application.UnLock();

        Application["HitCounters"] = int.Parse(Application["HitCounters"].ToString()) + 1;
        System.IO.StreamWriter wr = new System.IO.StreamWriter(Server.MapPath("sl.txt"));
        wr.Write(Application["HitCounters"]);
        wr.Close();
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        Application.Lock();
        Application["OnlineUsers"] = (int)Application["OnlineUsers"] - 1;
        Application.UnLock();
        Application.Lock();
        Application["Sessions"] = (int)Application["Sessions"] - 1;
        Application["TerminatedSessions"] = (int)Application["TerminatedSessions"] + 1;
        Application.UnLock();
    }
       
</script>
