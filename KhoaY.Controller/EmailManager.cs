using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Configuration;
using System.IO;
using System.Web;
using System.Data;

namespace KhoaY.Controller
{
	public class EmailManager
	{
		private bool _issent;

		public EmailManager()
		{

		}

		public void Send(EmailContents emailcontents)
		{

            SmtpClient client = new SmtpClient();
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = true;
            client.Host = SMTPServerName;
            client.Port = 587;

            // setup Smtp authentication
            System.Net.NetworkCredential credentials =
                new System.Net.NetworkCredential("huy7885@gmail.com", "Huy1q2w3e4r5t");
            client.UseDefaultCredentials = false;
            client.Credentials = credentials;


            MailAddress from = new MailAddress(emailcontents.FromEmailAddress, emailcontents.FromName);
            MailAddress to = new MailAddress(ToAddress);

            MailMessage msg = new MailMessage(from, to);           

            msg.Subject = emailcontents.Subject;
            msg.IsBodyHtml = true;
            msg.Body = emailcontents.Body;

            try
            {
                client.Send(msg);
            }
            catch (Exception ex)
            {
                throw ex;
            }
		}

		public bool IsSent
		{
			get { return _issent; }
			set { _issent = value; }
		}

		private string SMTPServerName
		{
            get { return ConfigurationManager.AppSettings["SMTPServerName"]; }
		}

		private string ToAddress
		{
			get { return ConfigurationManager.AppSettings[ "ToAddress" ]; }
		}
	}

	public class EmailContents
	{
		public string To;
		public string FromName;
		public string FromEmailAddress;
		public string Subject;
		public string Body;
        public EmailContents()
        {
            FromName = "Khoa Y Company";
            FromEmailAddress = "huy7885@gmail.com";
        }
	}

	
}
