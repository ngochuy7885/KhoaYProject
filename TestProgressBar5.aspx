<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestProgressBar5.aspx.cs" Inherits="TestProgressBar5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"/>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
 
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Show Records" />
           

           
<asp:UpdateProgress ID="UpdateProgress1" runat="server">
<ProgressTemplate>
<div id="Background"></div>
<div id="Progress">
<img src="loading.gif" style="vertical-align:middle"/>
Fetching Records Please Wait...
</div>
</ProgressTemplate>
</asp:UpdateProgress>
</ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="Button1" />
    </Triggers>
</asp:UpdatePanel>
    </form>
</body>
</html>
