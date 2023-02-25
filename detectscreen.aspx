<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detectscreen.aspx.cs" Inherits="detectscreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <script language="javascript"> 
res = "&res="+screen.width 
top.location.href="detectscreen.aspx?action=set"+res 
</script>
    </div>
    </form>
</body>
</html>
