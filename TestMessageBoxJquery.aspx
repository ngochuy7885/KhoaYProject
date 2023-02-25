<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestMessageBoxJquery.aspx.cs" Inherits="TestCase3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/jquery-ui.min.js"></script>
    <link href="CSS/alert.css" rel="stylesheet" />
    <link href="CSS/theme/light/theme.css" rel="stylesheet" />
    <script src="Scripts/alert.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
     

    <script >
                function ConfirmRemoveDialog(test) {
                    //If validation failed    
                    $.alert.open('Cảnh Báo', test);
                    return false;

                    //If validation passed in that case return true.
                   
                }
    </script>
    <asp:Button ID="Button1" runat="server" Text="Button"  OnClick="Button1_Click"  />
    <asp:Button ID="Button2" runat="server" Text="Button Exception" OnClick="Button2_Click"/>
</asp:Content>

