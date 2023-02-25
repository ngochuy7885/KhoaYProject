<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestCheckbox.aspx.cs" Inherits="TestCheckbox" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="form-group form-inline">
                <asp:CheckBox ID="checkboxVerify" AutoPostBack="true" OnCheckedChanged="checkboxVerify_CheckedChanged" CssClass=" mlNewsLetter" runat="server" /> &nbsp; <label for="txtSubscribe">Tôi đủ tuổi để thực hiện mua bán này </label>
                
    </div>
    <div class="form-group ml-button">

                <asp:Button ID="commandSubmit" CausesValidation="true" runat="server" CssClass="btn btn-primary"  Text="Tiếp Tục" OnClick="commandSubmit_Click" Enabled="false" />
                &nbsp;<asp:LinkButton ID="lnkEmail" CssClass="linkCss"  OnClick="lnkEmail_Click" Visible="false" runat="server">Tải File hướng dẫn</asp:LinkButton>   
         </div>
             <Triggers>
                <asp:PostBackTrigger ControlID="lnkEmail" />       
                <asp:AsyncPostBackTrigger ControlID="checkboxVerify" EventName="CheckedChanged" />
        </Triggers>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

