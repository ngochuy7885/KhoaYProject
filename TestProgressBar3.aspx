<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestProgressBar3.aspx.cs" Inherits="TestProgressBar3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <style type="text/css">
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
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        /*border: 5px solid #67CFF5;*/
        width: 200px;
        height: 100px;
        display: none;
        position: fixed;
        background-color: #ffffff;
        z-index: 999;
        filter: Alpha(Opacity=10);
            opacity: 0.10;
            -moz-opacity: 0.10;
       
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    
        Country: <asp:DropDownList ID="ddlCountries" runat="server">
    <asp:ListItem Text="All" Value="" />
    <asp:ListItem Text="USA" Value="USA" />
    <asp:ListItem Text="Brazil" Value="Brazil" />
    <asp:ListItem Text="France" Value="France" />
    <asp:ListItem Text="Germany" Value="Germany" />
</asp:DropDownList>
<asp:Button ID="btnSubmit" runat="server" Text="Load Customers"
    OnClick="btnSubmit_Click" />
<hr />
<asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="CustomerId" HeaderText="Customer Id" />
        <asp:BoundField DataField="ContactName" HeaderText="Contact Name" />
        <asp:BoundField DataField="City" HeaderText="City" />
    </Columns>
</asp:GridView>
<div class="loading" align="center">
    
    <img src="Images/ajax-loading-icon-19.jpg" width="50px" height="50px" alt="" />
</div>

    <script type="text/javascript" src="Scripts/jquery1.8.3.min.js"></script>
<script type="text/javascript">
    function ShowProgress() {
        setTimeout(function () {
            var modal = $('<div />');
            modal.addClass("overlay");
            $('body').append(modal);
            var loading = $(".loading");
            loading.show();
            var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
            var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
            loading.css({ top: top, left: left });
        }, 200);
    }
    $('form').live("submit", function () {
        ShowProgress();
    });
</script>

</asp:Content>

