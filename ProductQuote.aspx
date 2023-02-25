<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ProductQuote.aspx.cs" Inherits="ProductQuote" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
          
       <asp:Button ID="commandProductQuote" CssClass="btn btn-primary text-lg-left" runat="server" Text="Báo Giá" OnClick="commandProductQuote_Click" />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Panel runat="server" ID="PanelReport"  Width="100%">
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%">
                    </rsweb:ReportViewer>
            
                </asp:Panel>
                </ContentTemplate>
            <Triggers>
                 <asp:PostBackTrigger ControlID="commandProductQuote" />
               
            </Triggers>
        </asp:UpdatePanel>
                            
</asp:Content>

