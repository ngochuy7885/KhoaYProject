<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="UnSubscribeV1.aspx.cs" Inherits="Admin_UnSubscribeV1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <strong>Không Đăng Ký Nhận Tin Nhắn Từ Phía KhoaY</strong>
        <br />
        <br />
        <table border="0" cellpadding="3" cellspacing="0">
            <tr>
                <td>Dear
                    <asp:Label ID="labelName" runat="server"></asp:Label>,
                    <br /> 
                    Bạn đã thành công trong việc gỡ bỏ chức năng nhận tin nhắn email từ phía công ty KhoaY của chúng tôi.  

                </td>
            </tr>
        </table>
    </div>
</asp:Content>

