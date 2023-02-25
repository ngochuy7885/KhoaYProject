<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestFocus.aspx.cs" Inherits="TestFocus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function SetFocus()
        {
            
            document.getElementById('<%=  Button1.ClientID %>').focus();
        }
         function txtOnKeyPress(txt1) {
             txt2 = document.getElementById('<%=TextBox1.ClientID%>');
             txt2.value = ""
         }
         
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:TextBox ID="TextBox1"  onchange="javascript: SetFocus();" TabIndex="1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" TabIndex="2" runat="server" Text="Button click 1" OnClick="Button1_Click" />
    <asp:Button ID="Button2" TabIndex="3" runat="server" Text="Button click 2" />
</asp:Content>

