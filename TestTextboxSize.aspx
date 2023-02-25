<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestTextboxSize.aspx.cs" Inherits="TestTextboxSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <style>.content { width: 400px }</style>
<asp:TextBox id="ShortDescription" runat="server" CssClass=" form-control content"  />
</asp:Content>

