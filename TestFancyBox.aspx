<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestFancyBox.aspx.cs" Inherits="TestFancyBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="Scripts/js/fancybox.umd.js"></script>
   
    <link href="CSS/fancybox.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <a
  href="ImageViewer.ashx?ProductImageID=31"
  data-fancybox="gallery"
  data-caption="Optional caption">
  Image
</a>
</asp:Content>

