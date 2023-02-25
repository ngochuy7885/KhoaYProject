using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KhoaY.Model
{
    public class EndUserType
    {
        private int _endusertypeid;
        private string _typename;
        public string TypeName
        {
            get { return _typename; }
            set { _typename = value; }
        }
        public int EndUserTypeID
        {
          get { return _endusertypeid; }
          set { _endusertypeid = value; }
        }
        public EndUserType() { }
    }
}
