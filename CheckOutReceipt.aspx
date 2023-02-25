<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CheckOutReceipt.aspx.cs" Inherits="CheckOutReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .overlay {
            position: fixed;
            z-index: 99;
            top: 0px;
            left: 0px;
            background-color: #FFFFFF;
            width: 100%;
            height: 100%;
            filter: Alpha(Opacity=70);
            opacity: 0.70;
            -moz-opacity: 0.70;
        }

        * html .overlay {
            position: absolute;
            height: expression(document.body.scrollHeight > document.body.offsetHeight ? document.body.scrollHeight : document.body.offsetHeight + 'px');
            width: expression(document.body.scrollWidth > document.body.offsetWidth ? document.body.scrollWidth : document.body.offsetWidth + 'px');
        }

        .loader {
            z-index: 100;
            position: fixed;
            width: 120px;
            margin-left: -60px;
            top: 50%;
            left: 50%;
        }

        * html .loader {
            position: absolute;
            margin-top: expression((document.body.scrollHeight / 4) + (0 - parseInt(this.offsetParent.clientHeight / 2) + (document.documentElement && document.documentElement.scrollTop || document.body.scrollTop)) + 'px');
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
   <%-- <!-- Disable F5 key referesh -->
    <script type = "text/javascript">  
        window.onload = function () {  
            document.onkeydown = function (e) {  
                return (e.which || e.keyCode) != 116;  
            };  
        }  
    </script> --%>
    
    <div class="container">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="100%">
                            <asp:Panel ID="panelSuccess" runat="server" Height="100%" Visible="true" Width="100%">
                                <table border="1" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="23%" style="text-align:left;">
                                            <img src="Images/Success.gif" style="margin-left:32px" /></td>
                                        <td width="77%"><b>Đơn Hàng Của Bạn Đã Xử Lý Thành Công.&nbsp;  </b>
                                            <br />
                                            
                                            <b>Khoa Y cảm ơn sự quan tâm của bạn
                                            </b></td>
                                    </tr>

                                    <tr>
                                        <td width="23%" style="height: 18px">
                                            <img src="images/spacer.gif" width="10" />Hóa Đơn ID:</td>
                                        <td width="77%" style="height: 18px">
                                            <b><asp:Label ID="labelOrderID" runat="server"></b></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td width="23%">
                                            <img src="images/spacer.gif" width="10" />Tổng Cộng:</td>
                                        <td width="77%">
                                            <b><asp:Label ID="labelOrderTotal" runat="server"></b></asp:Label></td>
                                    </tr>

                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%">
                            <asp:Panel ID="panelFailure" runat="server" Height="100%" Visible="false" Width="100%">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="20%" style="text-align: center">
                                            <img src="images/error.gif" /></td>
                                        <td width="80%">
                                            <strong>Chúng tôi xin lỗi cho việc bất tiện này, nhưng lỗi đã xuất hiện trong suốt quá trình chi trả đơn hàng của bạn
                                    your order.<br />
                                                <br />
                                                Error Message:</strong></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td width="25%">
                                            <asp:Label ID="labelErrorMessage" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <asp:Panel ID="Panel1" CssClass="overlay" runat="server">
                    <asp:Panel ID="Panel2" CssClass="loader" runat="server">
                        <img src="images/ajax-loading-icon-19.jpg" width="60px" height="60px" />
                    </asp:Panel>
                </asp:Panel>
            </ProgressTemplate>
        </asp:UpdateProgress>
        
    </div>

</asp:Content>

