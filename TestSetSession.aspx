<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="TestSetSession.aspx.cs" Inherits="TestSetSession" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    Your Name :
    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
    <input id="btSet" type="button" value="Set Session" onclick="SetSession()" />
    <script type="text/javascript">
        function SetSession() {
            <%--var name = document.getElementById("<%=txtUserName.ClientID%>").value;--%>
            var name = "close";
            var request;
            if (window.XMLHttpRequest) {
                //New browsers.
                request = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                //Old IE Browsers.
                request = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (request != null) {
                var url = "TestSetSession.aspx/SetSession";
                request.open("POST", url, false);
                var params = "{name: '" + name + "'}";
                request.setRequestHeader("Content-Type", "application/json");
                request.onreadystatechange = function () {
                    if (request.readyState == 4 && request.status == 200) {
                        alert(JSON.parse(request.responseText).d);
                    }
                };
                request.send(params);
            }
        }
    </script>
</asp:Content>

