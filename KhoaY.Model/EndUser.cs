using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KhoaY.Model
{
    public class EndUser
    {
        public EndUser()
        {
            _address = new Address();
            _contactinformation = new ContactInformation();
        }
        private int _enduserid;
        private int _endusertypeid;
        private string _firstname;
        private string _lastname;
        private Address _address;
        private int _addressid;
        private ContactInformation _contactinformation;
        private int _contactinformtationid;
        private string _password;
        private bool _issubscribed;

        public int EndUserID
        {
            get { return _enduserid; }
            set { _enduserid = value; }
        }
        public int EndUserTypeID
        {
            get { return _endusertypeid; }
            set { _endusertypeid = value; }
        }
        public string FirstName
        {
            get { return _firstname; }
            set { _firstname = value; }
        }
        public string LastName
        {
            get { return _lastname; }
            set { _lastname = value; }
        }
        public Address Address
        {
            get { return _address; }
            set { _address = value; }
        }
        public int AddressID
        {
            get { return _addressid; }
            set { _addressid = value; }
        }
        public ContactInformation ContactInformation
        {
            get { return _contactinformation; }
            set { _contactinformation = value; }
        }
        public int ContactInformtationID
        {
            get { return _contactinformtationid; }
            set { _contactinformtationid = value; }
        }
        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }
        public bool IsSubscribed
        {
            get { return _issubscribed; }
            set { _issubscribed = value; }
        }
    }
}
