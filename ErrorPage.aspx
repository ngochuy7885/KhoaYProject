<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
      <asp:Panel ID="panelResults" runat="Server" CssClass="panelResult"
                     Height="24px">
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <div class="container">
                        <table border="0" cellpadding="1" cellspacing="0" width="100%">
                            <tr>
                                <td valign="top" style="color: red">
                                    <asp:Label ID="labelMessage" runat="server" Text="Website đã phát sinh lỗi xin vui lòng nhập đúng dữ liệu."></asp:Label></td>
                            </tr>
                           
                            
                        </table>
                    </div>
                </asp:Panel>
</asp:Content>

