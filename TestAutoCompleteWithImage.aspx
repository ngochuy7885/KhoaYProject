<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestAutoCompleteWithImage.aspx.cs" Inherits="AutoCompleteWithImage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/jquery.autocomplete.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.4.1.min.js"></script>
    
    <script src="Scripts/jquery.autocomplete.js"></script>
    <link href="CSS/bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" />
               

</head>
<body>
    <form id="form1" runat="server">
         <script type="text/javascript">
             

             $(document).ready(function () {
                 //On Page Load.
                 $(function () {
                     SetAutoComplete();
                 });

                 //On UpdatePanel Refresh.
                 var prm = Sys.WebForms.PageRequestManager.getInstance();
                 if (prm != null) {
                     prm.add_endRequest(function (sender, e) {
                         if (sender._postBackSettings.panelsToUpdate != null) {
                             SetAutoComplete();
                         }
                     });
                 };
                 function SetAutoComplete() {
                     $("#<%=txtSearch.ClientID%>").autocomplete("SearchProduct.ashx", {

                         width: 300,
                         formatItem: function (data, i, n, value) {
                             return "<div style='margin:0px;background-color:#f4f8fb;color:black'> <img style = 'width:50px;height:50px;' src='../ImageViewer.ashx?ProductImageId=" + value.split(";")[1] + "'/> " + value.split(";")[0] + "</div>";

                         },
                         formatResult: function (data, value) {
                             return value.split(";")[0];
                         }
                     });
                 }

                
     });
</script>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="txtSearch" CssClass="form-control col-lg-7" runat="server"></asp:TextBox>
               
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <span onmouseover='this.style.color="aqua";'>Test </span>
            </ContentTemplate>
            <Triggers>
               <%-- <asp:PostBackTrigger ControlID="Button1" />--%>
                <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
         

    </div>
    </form>
</body>
</html>
