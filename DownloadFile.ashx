<%@ WebHandler Language="C#" Class="DownloadFile" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class DownloadFile : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        System.Web.HttpRequest request = System.Web.HttpContext.Current.Request;
        string FileName = request.QueryString["yourVariable"];
            //string FileName = "Hướng dẫn bật Less secure apps để gửi gmail thông qua SMTP.pdf"; // It's a file name displayed on downloaded file on client side.

            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            response.ClearContent();
            response.Clear();
            response.ContentType = "Files/pdf";
            response.AddHeader("Content-Disposition", "attachment; filename=" + FileName + ";");
            response.TransmitFile(HttpContext.Current.Server.MapPath("~/Files/" + FileName));
            response.Flush();
            response.End();
       
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}