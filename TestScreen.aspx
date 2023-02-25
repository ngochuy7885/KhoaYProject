<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestScreen.aspx.cs" Inherits="TestScreen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        window.onload = function () {
            //getResolution();
        };

        
    </script>
    <script>
        function getResolution() {
            var txtwidth = document.getElementById("clientScreenWidth");
            var txtheight = document.getElementById("clientScreenHeight");
            txtwidth.value = screen.width;
            txtheight.value = screen.height;
            var str = "value";
            var hdf1 = document.getElementById("Hdf1").value;
            hdf1.value = str;
            alert(hdf1.value);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <input type="hidden" value=""name="clientScreenHeight" id="clientScreenHeight" />
    <input type="hidden" value="" name="clientScreenWidth" id="clientScreenWidth" />
    <input id="hdf1" type="hidden" runat="server" />
    <asp:Label ID="lblMessage" runat="server" Text="Label">test</asp:Label>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="getResolution()" OnClick="Button1_Click" />
</asp:Content>

