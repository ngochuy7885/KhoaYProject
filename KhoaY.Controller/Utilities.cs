using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Text.RegularExpressions;

namespace KhoaY.Controller
{
    public class Utilities
    {
        public static string GetCartGUID()
        {
            if (HttpContext.Current.Request.Cookies["KhoaY"] != null)
            {
                return HttpContext.Current.Request.Cookies["KhoaY"]["CartID"].ToString();
            }
            else
            {
                Guid CartGUID = Guid.NewGuid();
                HttpCookie cookie = new HttpCookie("KhoaY");
                cookie.Values.Add("CartID", CartGUID.ToString());
                cookie.Expires = DateTime.Now.AddDays(30);
                HttpContext.Current.Response.AppendCookie(cookie);

                return CartGUID.ToString();
            }
        }

        public static string FormatText(string text, bool allow)
        {
            string formatted = "";

            StringBuilder sb = new StringBuilder(text);
            sb.Replace("  ", " &nbsp;");

            if (!allow)
            {
                sb.Replace("<br>", Environment.NewLine);
                sb.Replace("&nbsp;", " ");
                formatted = sb.ToString();
            }
            else
            {
                StringReader sr = new StringReader(sb.ToString());
                StringWriter sw = new StringWriter();

                while (sr.Peek() > -1)
                {
                    string temp = sr.ReadLine();
                    sw.Write(temp + "<br>");
                }

                formatted = sw.GetStringBuilder().ToString();
            }

            return formatted;
        }
        public static string FormatMoney(string str)
        {
            //var charsToRemove = new string[] { "@", ",", ".", ";", "'" };
            //foreach (var c in charsToRemove)
            //{
            //    str = str.Replace(c, string.Empty);
            //}
            //return str;
            StringBuilder sb = new StringBuilder();
            foreach (char c in str)
            {
                if (c.ToString() == ".")
                {

                }
                else if (c.ToString() == ",")
                {
                    break;
                }
                else
                    sb.Append(c);
            }
            //Xu ly chuoi bo''''

            return sb.ToString();
        }
        public static void LogException(Exception ex)
        {
            using (StreamWriter sw = new StreamWriter(HttpContext.Current.Server.MapPath("~/ExceptionLog/LogFile.txt"), true))
            {
                sw.WriteLine(DateTime.Now.ToString("dd/MM/yyyy") + Environment.NewLine + ex.Message + Environment.NewLine + ex.ToString() + Environment.NewLine + Environment.NewLine);
            }
        }
        public static bool CheckNumeric(string input)
        {
            int outPut;
            if (int.TryParse(input, out outPut))
                return true;

            else
                return false;
        }
        public static Boolean IsNumber(String s)
        {
            Boolean value = true;
            if (s == String.Empty || s == null)
            {
                value = false;
            }
            else
            {
                foreach (Char c in s.ToCharArray())
                {
                    value = value && Char.IsDigit(c);
                }
            } return value;
        }
        
        public static DataTable RemoveDuplicateRows(DataTable dTable, string colName)
        {
            Hashtable hTable = new Hashtable();
            ArrayList duplicateList = new ArrayList();

            //Add list of all the unique item value to hashtable, which stores combination of key, value pair.
            //And add duplicate item value in arraylist.
            foreach (DataRow drow in dTable.Rows)
            {
                if (hTable.Contains(drow[colName]))
                    duplicateList.Add(drow);
                else
                    hTable.Add(drow[colName], string.Empty);
            }

            //Removing a list of duplicate items from datatable.
            foreach (DataRow dRow in duplicateList)
                dTable.Rows.Remove(dRow);

            //Datatable which contains unique records will be return as output.
            return dTable;
        }
        public static void SendMessageNewsLetter(string ToEmail, string EmailHead, string subjectmessage, string bodymesssage) {
            var fromAddress = new MailAddress("huy7885@gmail.com", "Nguyen Ngoc Huy");
            var toAddress = new MailAddress(ToEmail, "To Name");
            const string fromPassword = "gbflocpmxegzomhq";
            string subject = subjectmessage;
            string body = bodymesssage.ToString();

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword),
                Timeout = 20000
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                message.Body = bodymesssage;
                message.BodyEncoding = System.Text.Encoding.UTF8;
                message.IsBodyHtml = true;
                smtp.Send(message);
            }
        }
        public static void SendMessageWithAttachment(string ToEmail, byte[] bytes,string NameOfFile, string subjectmessage, string bodymesssage)
        {
            //System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();

            //mail.To.Add(new MailAddress(ToEmail));



            //mail.From = new MailAddress(FromEmail, EmailHead, System.Text.Encoding.UTF8);
            ////mail.ReplyTo = new MailAddress(FromEmail);
            //mail.Subject = subjectmessage;
            //mail.SubjectEncoding = System.Text.Encoding.UTF8;
            //mail.Body = bodymesssage;
            //mail.BodyEncoding = System.Text.Encoding.UTF8;
            //mail.IsBodyHtml = true;
            //mail.Priority = MailPriority.High;

            //SmtpClient client = new SmtpClient();
            //client.Credentials = new System.Net.NetworkCredential(ToEmail, "oddgivppixozitcy");
            //client.Credentials = new System.Net.NetworkCredential(ToEmail, "Huy1q2w3e4r5t");
            //client.Port = 587;
            //client.Host = "smtp.gmail.com";
            //client.EnableSsl = true;
            //try
            //{
            //    mail.Attachments.Add(new Attachment(new MemoryStream(bytes), "HoaDon.pdf"));

            //    client.Send(mail);
            //}
            //catch (Exception ex)
            //{
            //    Exception ex2 = ex;
            //    string errorMessage = string.Empty;
            //    while (ex2 != null)
            //    {
            //        errorMessage += ex2.ToString();
            //        ex2 = ex2.InnerException;
            //    }
            //}

            //Reading sender Email credential from web.config file
            HostAdd = "smtp.gmail.com";
            FromEmailid = "huy7885@gmail.com";
            Pass = "gbflocpmxegzomhq";

            


            //creating the object of MailMessage
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(FromEmailid,"Cong Ty KhoaY"); //From Email Id
            mailMessage.Subject = subjectmessage; //Subject of Email
            mailMessage.Body = bodymesssage; //body or message of Email
            mailMessage.IsBodyHtml = true;
            //Adding Multiple recipient email id logic
            string[] Multi = ToEmail.Split(','); //spiliting input Email id string with comma(,)
            foreach (string Multiemailid in Multi)
            {
                mailMessage.To.Add(new MailAddress(Multiemailid)); //adding multi reciver's Email Id
            }
            SmtpClient smtp = new SmtpClient(); // creating object of smptpclient
            smtp.Host = HostAdd; //host of emailaddress for example smtp.gmail.com etc

            //network and security related credentials
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = mailMessage.From.Address;
            NetworkCred.Password = Pass;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            mailMessage.Attachments.Add(new Attachment(new MemoryStream(bytes), NameOfFile));
        
            smtp.Send(mailMessage); //sending Email
           
        }
        public static void SendMessageWithMultipleAttachment(string ToEmail, byte[] bytes, byte[] bytes1, string NameOfFile,string NameOfFile1, string subjectmessage, string bodymesssage)
        {
            

            //Reading sender Email credential from web.config file
            HostAdd = "smtp.gmail.com";
            FromEmailid = "huy7885@gmail.com";
            Pass = "gbflocpmxegzomhq";


            //creating the object of MailMessage
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(FromEmailid, "Cong Ty KhoaY"); //From Email Id
            mailMessage.Subject = subjectmessage; //Subject of Email
            mailMessage.Body = bodymesssage; //body or message of Email
            mailMessage.IsBodyHtml = true;
            //Adding Multiple recipient email id logic
            string[] Multi = ToEmail.Split(','); //spiliting input Email id string with comma(,)
            foreach (string Multiemailid in Multi)
            {
                mailMessage.To.Add(new MailAddress(Multiemailid)); //adding multi reciver's Email Id
            }
            SmtpClient smtp = new SmtpClient(); // creating object of smptpclient
            smtp.Host = HostAdd; //host of emailaddress for example smtp.gmail.com etc

            //network and security related credentials
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = mailMessage.From.Address;
            NetworkCred.Password = Pass;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            mailMessage.Attachments.Add(new Attachment(new MemoryStream(bytes), NameOfFile));
            mailMessage.Attachments.Add(new Attachment(new MemoryStream(bytes1), NameOfFile1));

            smtp.Send(mailMessage); //sending Email

        }
        public static void SendMessageV1(string ToEmail, string FromEmail, string EmailHead, string subjectmessage, string bodymesssage)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();

            mail.To.Add(new MailAddress(ToEmail));

            // mail.To.Add("ngochuy7885@gmail.com");

            mail.From = new MailAddress(FromEmail, EmailHead, System.Text.Encoding.UTF8);
            mail.ReplyTo = new MailAddress(FromEmail);
            mail.Subject = subjectmessage;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = bodymesssage;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;

            SmtpClient client = new SmtpClient();

            client.Credentials = new System.Net.NetworkCredential(ToEmail, "gbflocpmxegzomhq");
           
            //client.Credentials = new System.Net.NetworkCredential(ToEmail, "Huy1q2w3e4r5t6y");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
            }
        }
        public static string Pass, FromEmailid, HostAdd;
        public static void MultipleEmail_Without_Attachment(String ToEmail, String Subj, string Message)
        {
            //Reading sender Email credential from web.config file
            HostAdd = "smtp.gmail.com";
            FromEmailid = "huy7885@gmail.com";
            Pass = "gbflocpmxegzomhq";

            //creating the object of MailMessage
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress(FromEmailid); //From Email Id
            mailMessage.Subject = Subj; //Subject of Email
            mailMessage.Body = Message; //body or message of Email
            mailMessage.IsBodyHtml = true;
            //Adding Multiple recipient email id logic
            string[] Multi = ToEmail.Split(','); //spiliting input Email id string with comma(,)
            foreach (string Multiemailid in Multi)
            {
                mailMessage.To.Add(new MailAddress(Multiemailid)); //adding multi reciver's Email Id
            }
            SmtpClient smtp = new SmtpClient(); // creating object of smptpclient
            smtp.Host = HostAdd; //host of emailaddress for example smtp.gmail.com etc

            //network and security related credentials
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = mailMessage.From.Address;
            NetworkCred.Password = Pass;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mailMessage); //sending Email
        }
        public static void SendMessageMultipleEmail(string ToEmail, string EmailHead, string subjectmessage, string bodymesssage)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();

            //ToEmail = ToEmail;
            string[] ToMuliId = ToEmail.Split(',');
            foreach (string ToEMailId in ToMuliId)
            {
                mail.To.Add(new MailAddress(ToEMailId)); //adding multiple To Email Id  
            }

            // mail.To.Add("ngochuy7885@gmail.com");

            mail.From = new MailAddress("huy7885@gmail.com", EmailHead, System.Text.Encoding.UTF8);
            mail.Subject = subjectmessage;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = bodymesssage;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();
            //client.Credentials = new System.Net.NetworkCredential("huy7885@gmail.com", "Huy1q2w3e4r5t");
            client.Credentials = new System.Net.NetworkCredential("huy7885@gmail.com", "gbflocpmxegzomhq");        
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
            }
        }
    }
}
