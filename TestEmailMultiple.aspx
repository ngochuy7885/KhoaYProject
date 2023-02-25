<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestEmailMultiple.aspx.cs" Inherits="TestCase2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
   <asp:Label ID="labelMessage" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="CommandSendEmailMultiple" runat="server" Text="Send Email Multiple" OnClick="CommandSendEmailMultiple_Click" />
    <img src="https://dm2304files.storage.live.com/y4mXm84CpaOdlz67WNVBzqZ4XiWxPcERZ4V3ZONz7hjWcSnKgNgBKU_bqsLV4njMwlL4viF5z-gY7ocQM9y33vq_q1ICrDGsf7BrwIbnRNHuyFWQjKmoTKqTpdwlbUraCn1J-OvrGeM4uXq9LhDJIWZYMC2FSZ4pVeUzbUrTktvG_F0gJ3s6EGmItNzuRKYbwfg?width=155&height=63&cropmode=none" width="155" height="63" />
            <asp:Button ID="commandThread" runat="server" OnClientClick="return postbackButtonClick();" Text="Button" OnClick="commandThread_Click" />
         </ContentTemplate>
        <Triggers>
             <%--<asp:AsyncPostBackTrigger ControlID="commandThread" EventName="Click" />--%>
              <asp:PostBackTrigger ControlID="commandThread" />
            
        </Triggers>



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
       <script type="text/javascript">
             //update panel and postback trigger with fileupload control upadteprogressbar code
             var updateProgress = null;
             function postbackButtonClick() {

                 updateProgress = $find("<%= UpdateProgress1.ClientID %>");
            window.setTimeout("updateProgress.set_visible(true)", updateProgress.get_displayAfter());
            return true;
        }
        </script>
</asp:Content>

