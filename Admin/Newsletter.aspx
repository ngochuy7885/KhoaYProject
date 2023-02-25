<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Newsletter.aspx.cs" Inherits="Admin_Newsletter" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">


    <div class="container">
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        --%>
        <table border="0" cellpadding="0" cellspacing="0"
            width="100%">
            <tr>
                <td>
                    <strong>Soạn Tin</strong></td>
            </tr>
            <tr>
                <td>&nbsp; </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox runat="server"
                        ID="textMessage"
                        TextMode="MultiLine"
                        Width="100%"
                        Columns="50"
                        Rows="10" />

                    <asp:HtmlEditorExtender
                        ID="htmlEditorExtender1"
                        TargetControlID="textMessage"
                        DisplaySourceTab="true"
                        EnableSanitization="false"
                        runat="server">
                    </asp:HtmlEditorExtender>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr style="text-align: center">
                <td>
                    <asp:Button ID="commandSend" runat="server" CssClass="btn btn-primary"
                        OnClick="commandSend_Click" OnClientClick="return postbackButtonClick();"
                        Text="Send Newsletter" /></td>
            </tr>
        </table>
        </ContentTemplate>
            <Triggers>
               <asp:PostBackTrigger ControlID="commandSend" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <asp:Panel ID="Panel1" CssClass="overlay" runat="server">
                    <asp:Panel ID="Panel2" CssClass="loader" runat="server">
                        <img src="Images/ajax-loading-icon-19.jpg" width="60px" height="60px" />                       
                    </asp:Panel>
                </asp:Panel>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <script type="text/javascript">
            //update panel and postback trigger with fileupload control upadteprogressbar code
            var updateProgress = null;
            function postbackButtonClick() {
                updateProgress = $find("<%= UpdateProgress1.ClientID %>");
                window.setTimeout("updateProgress.set_visible(true)", updateProgress.get_displayAfter());
                return true;
            }
        </script>
    </div>

</asp:Content>

