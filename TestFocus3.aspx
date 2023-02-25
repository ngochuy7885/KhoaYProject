<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestFocus3.aspx.cs" Inherits="TestFocus3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>  
        function funfordefautenterkey1(btn, event) {  
            if (document.all) {  
                if (event.keyCode == 13) {  
                    alert("test");
                    event.returnValue = false;  
                    event.cancel = true;  
                    btn.click();  
                }  
            }            
       </script>  
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>  
        <asp:TextBox ID="TextBox1" runat="server" Width="230px" MaxLength="50"  
            Height="20px"></asp:TextBox>  
        <asp:Button ID="Button1" runat="server" Text="Submit1" OnClick="Button1_Click">  
        </asp:Button>       
        <br />  
        <br />  
        <asp:Label ID="message" runat="server"></asp:Label>  
    </div>  
</asp:Content>

