// (c) Copyright Microsoft Corporation.
// This source is subject to the Microsoft Permissive License.
// See http://www.microsoft.com/resources/sharedsource/licensingbasics/sharedsourcelicenses.mspx.
// All other rights reserved.

using System;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.ComponentModel;
using System.ComponentModel.Design;
using AjaxControlToolkit;


[assembly: System.Web.UI.WebResource("../Scripts/DelayedSubmitBehavior.js", "text/javascript")]

namespace DelayedSubmit
{
    [Designer(typeof(DelayedSubmitDesigner))]
    [ClientScriptResource("../Scripts/DelayedSubmitBehavior.js", "../Scripts/DelayedSubmitBehavior.js")]
    [RequiredScript(typeof(TimerScript))]
    [TargetControlType(typeof(Control))]
    public class DelayedSubmitExtender : ExtenderControlBase
    {
        // TODO: Add your property accessors here.
        //
        [ExtenderControlProperty]
        [DefaultValue("200")]
        public string Timeout
        {
            get
            {
                return GetPropertyValue<string>("Timeout", "");
            }
            set
            {
                SetPropertyValue<string>("Timeout", value);
            }
        }
    }
}
