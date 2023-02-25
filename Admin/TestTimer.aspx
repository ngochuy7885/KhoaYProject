<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="TestTimer.aspx.cs" Inherits="Admin_TestTimer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick">
    </asp:Timer> // For one minute
    
<asp:UpdatePanel ID="UpdatePanel1"
    runat="server">
    <ContentTemplate>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick">
        </asp:AsyncPostBackTrigger>
    </Triggers>
</asp:UpdatePanel>
</asp:Content>

