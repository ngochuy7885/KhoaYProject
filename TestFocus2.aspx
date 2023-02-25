<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestFocus2.aspx.cs" Inherits="TestFocus2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <script>
        function SetFocus()
        {
            document.getElementById('<%=  Button2.ClientID %>').focus();
        }
         function txtOnKeyPress(txt1) {
             txt2 = document.getElementById('<%=TextBox1.ClientID%>');
             txt2.value = ""
         }
         
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1"   onchange="javascript: SetFocus();" TabIndex="1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" TabIndex="3" runat="server" Text="Button click 1" OnClick="Button1_Click" />
    <asp:Button ID="Button2" TabIndex="2" runat="server" Text="Button click 2" />
    </div>
    </form>
</body>
</html>
