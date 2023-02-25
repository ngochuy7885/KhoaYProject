<%@ Page Title="" Language="C#" Culture="vi-VN" UICulture="vi-VN" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="ReportOrder.aspx.cs" Inherits="Admin_ReportOrder" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
  <asp:Panel runat="server" ID="Panel1" DefaultButton="commandSearch" Width="100%">
          
         
              <div class="form-group row">
            <asp:TextBox ID="textOrderSearch" placeholder="Search..." CssClass="form-control col-lg-3 ml-3" AccessKey="s" TabIndex="1" runat="server"></asp:TextBox>
            <asp:Button ID="commandSearch" runat="server" class="btn btn-sm btn-primary" Text="Tìm Kiếm"  OnClick="commandSearch_Click" TabIndex="2" /> &nbsp; 
            <asp:Button ID="commandExportPDF" runat="server" class="btn btn-sm btn-primary" Text="Xuất PDF"  OnClick="commandExportPDF_Click" TabIndex="3" /> &nbsp; 
              <asp:Button ID="commandExportPDFA5" runat="server" class="btn btn-sm btn-primary" Text="Xuất PDF A5 Size"  OnClick="commandExportPDFA5_Click" TabIndex="3" /> &nbsp; 
          
                  <asp:Button ID="commandSendEmail" runat="server" class="btn btn-sm btn-primary" Text="Send Email"  OnClick="commandSendEmail_Click" TabIndex="3" /> &nbsp; 
           
                     </div>
                  <div class="col-md-12">
                <p style="width:200px;white-space: normal;word-break: break-all"></p>
            </div>

      
            <asp:Panel runat="server" ID="PanelReport" DefaultButton="commandSearch" Width="100%">
    
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%">
                    </rsweb:ReportViewer>
                    
                </asp:Panel>
           
        </div>
    </asp:Panel>
    
    <asp:Panel ID="panelResults" runat="Server" Visible="false" Height="24px">
           
                <table border="0" width="100%">
                    <tr>           
                        <td valign="top"  style="color:red">
                            <asp:Label ID="labelMessage" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                </table>
          
        </asp:Panel>
    </ContentTemplate>
            <Triggers>
                <%--<asp:AsyncPostBackTrigger ControlID="commandSearch" EventName="Click" />--%>
               <asp:PostBackTrigger ControlID="commandSearch" />
                <asp:PostBackTrigger ControlID="commandExportPDF" />
                <asp:PostBackTrigger ControlID="commandExportPDFA5" />
            </Triggers>
        </asp:UpdatePanel>
</asp:Content>

