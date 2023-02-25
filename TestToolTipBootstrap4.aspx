<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestToolTipBootstrap4.aspx.cs" Inherits="TestToolTipBootstrap4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <!-- Tooltip Bootstrap 4 -->
<!-- jQuery library -->
  <script src="CSS/bootstrap-4.0.0-dist/js/jquery.min.js"></script>

<!-- Popper JS -->
    <script src="CSS/bootstrap-4.0.0-dist/js/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
    <script src="CSS/bootstrap-4.0.0-dist/js/bootstrap.bundle.min.js"></script>

    <style>
 
.tooltip-inner {
    background-color: #d1ecf1;       
    border:thin;
    color: black;
    width: auto;
    max-width: 100%;
    font-size: 100%;
    white-space: nowrap;
}

.bs-tooltip-auto[x-placement^=top] .arrow::before, .bs-tooltip-top .arrow::before {
    border-top-color: #d1ecf1;
    
   
}
.bs-tooltip-auto[x-placement^=right] .arrow::before, .bs-tooltip-right .arrow::before {
    border-right-color: #d1ecf1;
   
    
}
.bs-tooltip-auto[x-placement^=bottom] .arrow::before, .bs-tooltip-bottom .arrow::before {
    border-bottom-color:#d1ecf1;
   
}
.bs-tooltip-auto[x-placement^=left] .arrow::before, .bs-tooltip-left .arrow::before {
    border-left-color: #d1ecf1;
      
}
 
</style>
     <!-- End Tooltip Bootstrap 4 -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
        <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-html="true" data-placement="bottom" title='<%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("Price") )%> VNĐ <%# Eval("SearchName") %>'>
  Tooltip on top
          
</button>
           <button type="button" class="btn btn-info" data-toggle="tooltip" data-placement="bottom" data-html="true" title="<img src='ImageViewer.ashx?ProductImageID= <%# Eval("ProductID") %>' width='200px' >"">
 
  The example of Tooltip with HTML
 
</button>
    <font data-toggle="tooltip" data-html="true" data-placement="bottom" title="<img src='ImageViewer.ashx?ProductImageID= <%# Eval("ProductID") %>' width='200px'/>" ><%#Eval("ProductName") %> </font>

          </ItemTemplate>
    </asp:DataList>
    <asp:Image ID="Image1" ImageUrl='ImageViewer.ashx?ProductImageID=1' runat="server" />
    <script>
        $(document).ready(function () {
            $('.btn').tooltip();
        });

        $(function () {

            $('[data-toggle="tooltip"]').tooltip()

        })

</script>
</asp:Content>

