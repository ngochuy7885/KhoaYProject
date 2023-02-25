using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KhoaY.Model
{
    public class ContactInformation
    {
        private int _contactinformationid;
        private string _phone;
        private string _phone2;
        private string _fax;
        private string _email;

        public ContactInformation()
        {

        }

        public int ContactInformationID
        {
            get { return _contactinformationid; }
            set { _contactinformationid = value; }
        }

        public string Phone
        {
            get { return _phone; }
            set { _phone = value; }
        }

        public string Phone2
        {
            get { return _phone2; }
            set { _phone2 = value; }
        }

        public string Fax
        {
            get { return _fax; }
            set { _fax = value; }
        }

        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }

        public string Phone1 { get; set; }
    }
}
