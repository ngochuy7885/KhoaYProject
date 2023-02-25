d
<%@ WebHandler Language="C#" Class="ImageViewer" %>

using System;
using System.Web;
using KhoaY.Controller;
using KhoaY.Model;
public class ImageViewer : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) 
    {
        // Check Number and ProductImageId is null
        if (!KhoaY.Controller.Utilities.CheckNumeric(context.Request.QueryString["ProductImageID"].ToString()))
        {
            return;
        }
        //ProcessProductImages processimage  = new ProcessProductImages();
        //if (processimage.ProductImageCheckDouble(int.Parse(context.Request.QueryString["ProductImageID"].ToString())))
        //{
        //    return;
        //}


        try
        {
            ProcessProductImages objproductimage = new ProcessProductImages();
            ProductImages productimages = new ProductImages();
            productimages.ProductImageID = int.Parse(context.Request.QueryString["ProductImageID"].ToString());
            System.IO.Stream ImageStream = null;


            productimages.ProductImage = (byte[])objproductimage.ProductImageSelectByIDData(productimages.ProductImageID);
            ImageStream = new System.IO.MemoryStream((byte[])productimages.ProductImage);

            System.IO.Stream stream = null;
            context.Response.ContentType = "images/jpeg";
            context.Response.Cache.SetCacheability(HttpCacheability.Public);
            context.Response.BufferOutput = false;
            int buffersize = 1024 * 16;
            byte[] buffer = new byte[buffersize];
            stream = ImageStream;
            
            int count = stream.Read(buffer, 0, buffersize);
            while (count > 0)
            {
                context.Response.OutputStream.Write(buffer, 0, count);
                count = stream.Read(buffer, 0, buffersize);
            }
        }
        catch (HttpException ex)
        {
            if (ex.Message.StartsWith("The remote host closed the connection.")) {
            }
            //do nothing
            else
            {
            }
            //handle other errors
        }
        catch (Exception e)
        {
            //handle other errors
        }
        finally
        {//close streams etc..
        }
        
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}