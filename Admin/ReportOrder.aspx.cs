using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhoaY.Controller;
using Microsoft.Reporting.WebForms;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;
using System.Collections.Generic;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Drawing.Printing;
using System.Drawing.Imaging;
using System.Drawing;
using KhoaY.Controller;
using System.Diagnostics;
using System.IO;

public partial class Admin_ReportOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            GetData();
            LoadNavigation();
        }
        
    }
    public void LoadNavigation()
    {
        //Navigation
        HyperLink hpl1 = (HyperLink)Page.Master.FindControl("hpl1");
        HyperLink hpl2 = (HyperLink)Page.Master.FindControl("hpl2");
        HyperLink hpl3 = (HyperLink)Page.Master.FindControl("hpl3");
        HyperLink hpl4 = (HyperLink)Page.Master.FindControl("hpl4");
        HyperLink hpl5 = (HyperLink)Page.Master.FindControl("hpl5");
        HyperLink hpl6 = (HyperLink)Page.Master.FindControl("hpl6");

        HtmlGenericControl li1 = (HtmlGenericControl)Page.Master.FindControl("li1");
        HtmlGenericControl li2 = (HtmlGenericControl)Page.Master.FindControl("li2");
        HtmlGenericControl li3 = (HtmlGenericControl)Page.Master.FindControl("li3");
        HtmlGenericControl li4 = (HtmlGenericControl)Page.Master.FindControl("li4");
        HtmlGenericControl li5 = (HtmlGenericControl)Page.Master.FindControl("li5");
        HtmlGenericControl li6 = (HtmlGenericControl)Page.Master.FindControl("li6");


        hpl1.Text = "Trang Chủ";
        hpl1.NavigateUrl = "Products.aspx";

        hpl2.Text = "Báo Cáo Hóa Đơn";
        hpl2.Style.Add("Color", "silver");
        hpl2.Enabled = false;

        hpl3.Text = "";
        hpl4.Text = "";
        hpl5.Text = "";
        hpl6.Text = "";

        li1.Attributes["class"] = "breadcrumb-item";
        li2.Attributes["class"] = "breadcrumb-item";
        li3.Attributes["class"] = "";
        li4.Attributes["class"] = "";
        li5.Attributes["class"] = "";
        li6.Attributes["class"] = "";

    }
    public void GetData()
    {
        ProcesssOrders processorders = new KhoaY.Controller.ProcesssOrders();
        DataSet ds = processorders.OrdersSearchRecently();
        

        ReportViewer1.ProcessingMode = ProcessingMode.Local;
        ReportViewer1.LocalReport.ReportPath = Server.MapPath("ReportOrderKhoaY3.rdlc");
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DSOrderKhoaY2", ds.Tables[0]));
        ReportViewer1.LocalReport.Refresh();

    }
    protected void commandSearch_Click(object sender, EventArgs e)
    {
        try {
            if (textOrderSearch.Text.Length != 0 && KhoaY.Controller.Utilities.CheckNumeric(textOrderSearch.Text))
            {
                int orderId = int.Parse(textOrderSearch.Text);
                ProcesssOrders processorders = new KhoaY.Controller.ProcesssOrders();
                DataSet ds = processorders.OrderSelectByOrderID(orderId);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    panelResults.Visible = false;
                    ReportViewer1.Visible = true;
                    labelMessage.Visible = false;
                    ReportViewer1.ProcessingMode = ProcessingMode.Local;
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath("ReportOrderKhoaY3.rdlc");
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DSOrderKhoaY2", ds.Tables[0]));
                    ReportViewer1.LocalReport.Refresh();
                }
                else
                {
                    ReportViewer1.Visible = false;
                    panelResults.Visible = true;
                    labelMessage.Visible = true;
                    labelMessage.Text = "Không Có Dữ Liệu";
                }
            }
            else {
                ReportViewer1.Visible = false;
                panelResults.Visible = true;
                labelMessage.Visible = true;
                labelMessage.Text = "Không Có Dữ Liệu";
            }
        }
        catch (Exception ex) {
            labelMessage.Visible = true;
            labelMessage.Text = ex.ToString();
            ReportViewer1.Visible = false;
            KhoaY.Controller.Utilities.LogException(ex);
            //Response.Write(ex.ToString());
        }
        

       
    }
    protected void commandExportPDFA5_Click(object sender, EventArgs e)
    {
        try
        {
            if (textOrderSearch.Text.Length != 0 && KhoaY.Controller.Utilities.CheckNumeric(textOrderSearch.Text))
            {
                string orderid = textOrderSearch.Text.Trim();
                CreatePDFA5Size("HoaDon_" + orderid);
            }
            else
            {
                ReportViewer1.Visible = false;
                panelResults.Visible = true;
                labelMessage.Visible = true;
                labelMessage.Text = "Không Có Dữ Liệu";
            }

        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
        }
    }
    protected void commandExportPDF_Click(object sender, EventArgs e)
    {
        try {
            if (textOrderSearch.Text.Length != 0 && KhoaY.Controller.Utilities.CheckNumeric(textOrderSearch.Text))
            {
                string orderid = textOrderSearch.Text.Trim(); 
                CreatePDF("HoaDon_" + orderid);
            }
            else {
                ReportViewer1.Visible = false;
                panelResults.Visible = true;
                labelMessage.Visible = true;
                labelMessage.Text = "Không Có Dữ Liệu";
            }
            
        }
        catch (Exception ex) {
            KhoaY.Controller.Utilities.LogException(ex);       
        }
    }
    private void CreatePDF(string fileName)
    {
        //// Setup DataSet
        //MyDataSetTableAdapters.YourTableAdapterHere ds = new MyDataSetTableAdapters.YourTableAdapterHere();
        ProcesssOrders processorders = new KhoaY.Controller.ProcesssOrders();
        DataSet ds = processorders.OrderSelectByOrderID(int.Parse(textOrderSearch.Text));

        if (ds.Tables[0].Rows.Count > 0)
        {


            //// Create Report DataSource
            ReportDataSource rds = new ReportDataSource("DSOrderKhoaY2", ds.Tables[0]);

            // Variables   
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;

            // Setup the report viewer object and get the array of bytes   
            ReportViewer viewer = new ReportViewer();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.ReportPath = "Admin/ReportOrderKhoaY3.rdlc";
            viewer.LocalReport.DataSources.Add(rds); // Add datasource here

            byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.   
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
            Response.BinaryWrite(bytes); // create the file

            string FileNameSave = Server.MapPath("HoaDon.pdf");
            //File.WriteAllBytes("c:\\myfile.pdf", bytes);
            File.WriteAllBytes(FileNameSave, bytes);

            Response.Flush(); // send it to the client to download   
        }
        else
        {
            ReportViewer1.Visible = false;
            panelResults.Visible = true;
            labelMessage.Visible = true;
            labelMessage.Text = "Không Có Dữ Liệu";
        }


    }

    private void CreatePDFA5Size(string fileName)
    {
        //// Setup DataSet
        //MyDataSetTableAdapters.YourTableAdapterHere ds = new MyDataSetTableAdapters.YourTableAdapterHere();
        ProcesssOrders processorders = new KhoaY.Controller.ProcesssOrders();
        DataSet ds = processorders.OrderSelectByOrderID(int.Parse(textOrderSearch.Text));

        if (ds.Tables[0].Rows.Count > 0)
        {


            //// Create Report DataSource
            ReportDataSource rds = new ReportDataSource("DSOrderKhoaY2", ds.Tables[0]);

            // Variables   
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;

            // Setup the report viewer object and get the array of bytes   
            ReportViewer viewer = new ReportViewer();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.ReportPath = "Admin/ReportOrderKhoaY3A5Size.rdlc";
            viewer.LocalReport.DataSources.Add(rds); // Add datasource here

            byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.   
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
            Response.BinaryWrite(bytes); // create the file

            string FileNameSave = Server.MapPath("HoaDon.pdf");
            //File.WriteAllBytes("c:\\myfile.pdf", bytes);
            File.WriteAllBytes(FileNameSave, bytes);

            Response.Flush(); // send it to the client to download   
        }
        else
        {
            ReportViewer1.Visible = false;
            panelResults.Visible = true;
            labelMessage.Visible = true;
            labelMessage.Text = "Không Có Dữ Liệu";
        }

        
    }


    protected void commandSendEmail_Click(object sender, EventArgs e)
    {
    
                   
        try
        {
            if (textOrderSearch.Text.Length != 0 && KhoaY.Controller.Utilities.CheckNumeric(textOrderSearch.Text))
            {
                //// Setup DataSet
                //MyDataSetTableAdapters.YourTableAdapterHere ds = new MyDataSetTableAdapters.YourTableAdapterHere();
                ProcesssOrders processorders = new KhoaY.Controller.ProcesssOrders();
                DataSet ds = processorders.OrderSelectByOrderID(int.Parse(textOrderSearch.Text));

                if (ds.Tables[0].Rows.Count > 0)
                {

                    panelResults.Visible = false;
                    ReportViewer1.Visible = true;
                    labelMessage.Visible = false;
                    ReportViewer1.ProcessingMode = ProcessingMode.Local;
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath("ReportOrderKhoaY3.rdlc");
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DSOrderKhoaY2", ds.Tables[0]));
                    ReportViewer1.LocalReport.Refresh();

                    //// Create Report DataSource
                    ReportDataSource rds = new ReportDataSource("DSOrderKhoaY2", ds.Tables[0]);

                    // Variables   
                    Warning[] warnings;
                    string[] streamIds;
                    string mimeType = string.Empty;
                    string encoding = string.Empty;
                    string extension = string.Empty;

                    // Setup the report viewer object and get the array of bytes   
                    ReportViewer viewer = new ReportViewer();
                    viewer.ProcessingMode = ProcessingMode.Local;
                    viewer.LocalReport.ReportPath = "Admin/ReportOrderKhoaY3.rdlc";
                    viewer.LocalReport.DataSources.Add(rds); // Add datasource here

                    byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

                    // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.   
                    Response.Buffer = true;
                    Response.Clear();
                    Response.ContentType = mimeType;
                    string fileName = "HoaDon";
                    Response.AddHeader("content-disposition", "attachment; filename=" + fileName + "." + extension);
                    //Response.BinaryWrite(bytes); // create the file

                    string FileNameSave = Server.MapPath("HoaDon.pdf");
                    string NameOfFile = "HoaDon_" + textOrderSearch.Text + ".pdf";
               
                    KhoaY.Controller.Utilities.SendMessageWithAttachment("huy7885@gmail.com", bytes,NameOfFile, "Hóa Đơn", "Xin Vui Long Tải Xuống Hóa Đơn");
                    System.GC.Collect();
                    System.GC.WaitForPendingFinalizers();

                }
                else
                {
                    ReportViewer1.Visible = false;
                    panelResults.Visible = true;
                    labelMessage.Visible = true;
                    labelMessage.Text = "Không Có Dữ Liệu";
                }

            }

           
        }
        catch (Exception ex)
        {
            KhoaY.Controller.Utilities.LogException(ex);
        }
        //finally {
        //    File.Delete(filenamesave);
        //}
   
     }
}