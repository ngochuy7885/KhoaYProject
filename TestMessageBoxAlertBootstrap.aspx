<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestMessageBoxAlertBootstrap.aspx.cs" Inherits="TestMessageBoxAlertBootstrap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <link href="CSS/bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.8.3.min.js"></script>    
    <script src="CSS/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>

   
 
    <style type="text/css">
        .messagealert {
            width: 30%;
                      
            /*position:fixed;*/
            position: fixed;
            bottom: 0; 
            right: 0;
            /*top:0px;*/
            left:70%;
            z-index: 100000;
            padding: 0;
            font-size: 15px;
        }
    </style>
    <script type="text/javascript">
        function ShowMessage(message, messagetype) {
            var cssclass;
            switch (messagetype) {
                case 'Success':
                    cssclass = 'alert-success'
                    break;
                case 'Error':
                    cssclass = 'alert-danger'
                    break;
                case 'Warning':
                    cssclass = 'alert-warning'
                    break;
                default:
                    cssclass = 'alert-info'
            }
            $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert alert-info"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' + messagetype + '</strong> <span>' + message + '</span></div>');
        }
    </script>
</head>
<body onload="ShowMessage('Còn Tồn Coltramyl Giá Rẽ 1.200.000 VNĐ 1 Thùng 120 Hộp Mai Vô','')">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text="Hello World !!!!"></asp:Label><asp:Button ID="Button17" runat="server" Text="Button" OnClick="Button17_Click" />
             </ContentTemplate>
                <Triggers>
                <asp:AsyncPostBackTrigger ControlID="button17" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    <div>
            <div class="messagealert" id="alert_container">
            </div>
 
             <div style="margin-top: 100px; text-align:center;">
            <asp:Button ID="btnSuccess" runat="server" Text="Submit" CssClass="btn btn-success"
                OnClick="btnSuccess_Click" />
            <asp:Button ID="btnDanger" runat="server" Text="Danger" CssClass="btn btn-danger"
                OnClick="btnDanger_Click" />
            <asp:Button ID="btnWarning" runat="server" Text="Warning" CssClass="btn btn-warning"
                OnClick="btnWarning_Click" />
            <asp:Button ID="btnInfo" runat="server" Text="Info" CssClass="btn btn-info"
                OnClick="btnInfo_Click" />
            </div>

         <div style="margin-top: 100px; text-align:center;">
            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success"
                OnClick="btnSuccess_Click" />
            <asp:Button ID="Button2" runat="server" Text="Danger" CssClass="btn btn-danger"
                OnClick="btnDanger_Click" />
            <asp:Button ID="Button3" runat="server" Text="Warning" CssClass="btn btn-warning"
                OnClick="btnWarning_Click" />
            <asp:Button ID="Button4" runat="server" Text="Info" CssClass="btn btn-info"
                OnClick="btnInfo_Click" />
            </div>

         <div style="margin-top: 100px; text-align:center;">
            <asp:Button ID="Button5" runat="server" Text="Submit" CssClass="btn btn-success"
                OnClick="btnSuccess_Click" />
            <asp:Button ID="Button6" runat="server" Text="Danger" CssClass="btn btn-danger"
                OnClick="btnDanger_Click" />
            <asp:Button ID="Button7" runat="server" Text="Warning" CssClass="btn btn-warning"
                OnClick="btnWarning_Click" />
            <asp:Button ID="Button8" runat="server" Text="Info" CssClass="btn btn-info"
                OnClick="btnInfo_Click" />
            </div>
         <div style="margin-top: 100px; text-align:center;">
            <asp:Button ID="Button9" runat="server" Text="Submit" CssClass="btn btn-success"
                OnClick="btnSuccess_Click" />
            <asp:Button ID="Button10" runat="server" Text="Danger" CssClass="btn btn-danger"
                OnClick="btnDanger_Click" />
            <asp:Button ID="Button11" runat="server" Text="Warning" CssClass="btn btn-warning"
                OnClick="btnWarning_Click" />
            <asp:Button ID="Button12" runat="server" Text="Info" CssClass="btn btn-info"
                OnClick="btnInfo_Click" />
            </div>
         <div style="margin-top: 100px; text-align:center;">
            <asp:Button ID="Button13" runat="server" Text="Submit" CssClass="btn btn-success"
                OnClick="btnSuccess_Click" />
            <asp:Button ID="Button14" runat="server" Text="Danger" CssClass="btn btn-danger"
                OnClick="btnDanger_Click" />
            <asp:Button ID="Button15" runat="server" Text="Warning" CssClass="btn btn-warning"
                OnClick="btnWarning_Click" />
            <asp:Button ID="Button16" runat="server" Text="Info" CssClass="btn btn-info"
                OnClick="btnInfo_Click" />
            </div>
        </div>
    </form>
</body>
</html>
