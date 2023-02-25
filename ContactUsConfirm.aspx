<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ContactUsConfirm.aspx.cs" Inherits="ContactUsConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <asp:Panel ID="panelResults" runat="Server" CssClass="panelResult"
                     Height="50px">
                    <div class="container">
                        <table border="0" cellpadding="1" cellspacing="0" width="100%">
                            <tr>
                                <td valign="top">
                            Cảm ơn đã liên hệ công ty KhoaY.&nbsp;<br />
                                Chúng tôi sẽ liên lạc lại với bạn sớm như có thể.
                                 </tr>
                           
                            
                        </table>
                    </div>
                </asp:Panel>
     
</asp:Content>

