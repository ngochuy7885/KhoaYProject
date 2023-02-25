<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CheckOutConfirmv1.aspx.cs" Inherits="CheckOutConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .mlfirstname {
            margin-left:7rem;
        }
         .mllastname {
            margin-left:7.3rem;
        }
        .mlAddress {
            margin-left: 4.2rem;
        }
         .mlCity {
            margin-left:4rem;
        }
         .mlState {
            margin-left:4.3rem;
        }
         .mlPostalCode {
            margin-left:3rem;
        }
          .mlPassword {
            margin-left:4.8rem;
        }
           .mlConfirmPassword {
            margin-left:0.5rem;
        }
            .mlPhone1 {
            margin-left:3.2rem;
        }
              .mlFax {
            margin-left:7.4rem;
        }
        .mlNewsLetter {
            margin-left:9rem;
        }
        .ml-button {
            margin-left: 9rem;
        }
           @media (min-width: 375px) and (max-width: 576px) {
             .MyPosition {
                /*margin-left: 35px;*/
            }

            .total {
                width: 85px;
            }
                .PriceWidth {
                width:110px;
            
             }
                .mlfirstname {
            margin-left:0rem;
        }
         .mllastname {
            margin-left:0rem;
        }
        .mlAddress {
            margin-left: 0rem;
        }
         .mlCity {
            margin-left:0rem;
        }
         .mlState {
            margin-left:0rem;
        }
         .mlPostalCode {
            margin-left:0rem;
        }
          .mlPassword {
            margin-left:0rem;
        }
           .mlConfirmPassword {
            margin-left:0rem;
        }
            .mlPhone1 {
            margin-left:0rem;
        }
              .mlFax {
            margin-left:0rem;
        }
        .mlNewsLetter {
            margin-left:0rem;
        }
        .ml-button {
            margin-left: 6rem;
        }
            
            
        }
        @media (min-width: 576px) and (max-width: 768px) {
            .MyPosition {
                /*margin-left:20px;
                padding-right:10px;
                width:150px;*/
              
                
            }
            .total {
                
                width:70px;
            }
             .mlfirstname {
            margin-left:0rem;
            min-width:320px;
        }
         .mllastname {
            margin-left:0rem;
            min-width:320px;
        }
        .mlAddress {
            margin-left: 0rem;
            min-width:320px;
        }
         .mlCity {
            margin-left:0rem;
            min-width:320px;
        }
         .mlState {
            margin-left:0rem;
            min-width:320px;
        }
         .mlPostalCode {
            margin-left:0rem;
            min-width:320px;
        }
          .mlPassword {
            margin-left:0rem;
            min-width:320px;
        }
           .mlConfirmPassword {
            margin-left:0rem;
            min-width:320px;
        }
            .mlPhone1 {
            margin-left:0rem;
            min-width:320px;
        }
              .mlFax {
            margin-left:0rem;
            min-width:320px;
        }
        .mlNewsLetter {
            margin-left:0rem;
          
        }
        .ml-button {
            margin-left: 9rem;
        }
                
        }
        @media (min-width: 768px) and (max-width: 991.98px) {
            /*Css for iphone*/
            .MyPosition {
                /*padding-right: 10px;*/
                  
               
            }
         .total {
            width:92px;
         }
            
        }
       
        @media (min-width: 992px) and (max-width: 1199px) {
            .MyPosition {
                  /*margin-left: 10px;*/
                                    
            }
            .total {
                width: 123px;
            }
             .mlAddress {
            margin-left: 4.7rem;
            min-width:450px;
        }
           
        }

        @media (min-width: 1200px) {
            .MyPosition {
                /*padding-left:35px;*/
                
            }
             .mlAddress {
            margin-left: 4.6rem;
            min-width:450px;
        }
         .total {
             width:155px;
         }
            
        }
       a:hover {
            color:blue;
         }
           
    </style>
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
 <%--    <!-- Tooltip Bootstrap 4 -->
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
    font-weight:bolder;
    opacity:1;
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
 .tooltip.show {
    opacity: 1;
}
</style>
     <!-- End Tooltip Bootstrap 4 -->--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
         <script type="text/javascript" src="../Scripts/ajax-dynamic-content.js"></script>
    <script type="text/javascript" src="../Scripts/ajax-tooltip.js"></script>
	<script type="text/javascript" src="../Scripts/ajax.js" defer="defer"></script>

    <div class="container">
         <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  
    <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
        
        
        <tr>
            <td></td>
            <td>
                    <asp:GridView ID="gridviewShoppingCart" runat="server"
     DataKeyNames="Quantity,ShoppingCartID,ProductID,ProductUnitID"
    AutoGenerateColumns="False"
    Width="100%" BorderWidth="1px" CellPadding="2" >
    <Columns>       
        <asp:TemplateField ItemStyle-Width="45%">
             <HeaderTemplate>
                <center>
                    Tên Sản Phẩm
                </center>
            </HeaderTemplate>
            <ItemTemplate>
                <a onmouseover="VietAd_ShowTooltip('../ToolTipImageProduct.aspx?ProductID=<%#Eval("ProductID") %>'); return false" onmouseout="VietAd_HideTooltip();" href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>
                    <asp:Label ID="labelProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>                                   
                     </a>
                <%-- <a  href="ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<img src='ImageViewer.ashx?ProductImageID= <%# Eval("ProductImageID") %>' width='200px'/>" ><%#Eval("ProductName") %> </a>--%>

            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="left"></ItemStyle>
        </asp:TemplateField>

         <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-Width="10%"> 
                <HeaderTemplate>
                <center>
                    Số Lượng
                </center>
            </HeaderTemplate>
             <ItemTemplate>
                 <asp:Label ID="labelQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>              
                </ItemTemplate>
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </asp:TemplateField>

           <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-Width="15%"> 
                <HeaderTemplate>
                <center>
                    Đơn Vị Tính
                </center>
            </HeaderTemplate>
             <ItemTemplate>
                 <asp:Label ID="labelProductUnitName" runat="server" Text='<%# Eval("ProductUnitName") %>'></asp:Label>              
             </ItemTemplate>
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField ItemStyle-Width="10%"
        ItemStyle-HorizontalAlign="center" >
            <HeaderTemplate>
                <center>
                    Giá
                </center>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Label ID="labelUnitPrice" runat="server" Text='<%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("UnitPrice") )%> '></asp:Label>
          
            </ItemTemplate>
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>


        
        <asp:TemplateField ItemStyle-Width="20%"
    ItemStyle-HorizontalAlign="center">
            <HeaderTemplate>
                <center>
                    Tổng Phụ
                </center>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelTotalPrice" runat="server" Text='<%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("TotalPrice") )%> '></asp:Label>
                
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:TemplateField>

    </Columns>
    </asp:GridView>
            </td>
            <td></td>
        </tr>
        
        
        <tr>
            <td></td>
            <td align="right">
                <table border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td class="TongCong" align="right"><b>Tổng Cộng:</b></td>
                        <td align="center" class="total"><strong><asp:Label ID="labelSubTotal" CssClass="MyPosition" runat="server" Width="100%"></asp:Label></strong></td>
                    </tr>
                   
                </table>
            </td>
            <td></td>
        </tr>
    </table>
     <div class="col-md-12">
                <p style="width:500px;white-space: normal;word-break: break-all"> </p>
            </div>
     
      <p><h3>Thông Tin Vận Chuyển</h3></p>
         <div class="col-md-12">
                <p style="width:500px;white-space: normal;word-break: break-all"> </p>
            </div>
                <div class="form-group form-inline">
                        <label for="FirstName">Tên: </label>
                        <asp:TextBox ID="textFirstName" Enabled="false" CssClass="form-control mlfirstname" runat="server"></asp:TextBox>
                       </div>

            <div class="form-group form-inline">
                        <label for="LastName">Họ: </label>
                        <asp:TextBox ID="textLastName" Enabled="false" CssClass="form-control mllastname" runat="server"></asp:TextBox>
            </div>

        <div class="form-group form-inline">
                        <label for="Address">Địa Chỉ 1: </label>
                        <asp:TextBox ID="textAddress1" Columns="30" Enabled="false" CssClass="form-control mlAddress" runat="server"></asp:TextBox>
            </div>
            <div class="form-group form-inline">
                        <label for="Address2">Địa Chỉ 2: </label>
                        <asp:TextBox ID="textAddress2" Columns="30" Enabled="false" CssClass="form-control mlAddress" runat="server"></asp:TextBox>
            </div>
         <div class="form-group form-inline">
                        <label for="City">Thành Phố: </label>
                        <asp:TextBox ID="textCity" Enabled="false" CssClass="form-control mlCity" runat="server"></asp:TextBox>
            </div>
        <div class="form-group form-inline">
                        <label for="State">Tiểu Bang: </label>
                        <asp:TextBox ID="textState" Enabled="false" CssClass="form-control mlState" runat="server"></asp:TextBox>
            </div>
             <div class="form-group form-inline">
                        <label for="PostalCode">Mã Bưu Điện: </label>
                        <asp:TextBox ID="textPostalCode" Enabled="false" CssClass="form-control mlPostalCode" runat="server"></asp:TextBox>
            </div>
             
        <div class="form-group form-inline">
                        <label for="Phone1">Điện Thoại 1: </label>
                        <asp:TextBox ID="textPhone1" Enabled="false" CssClass="form-control mlPhone1" runat="server"></asp:TextBox>
            </div>
        <div class="form-group form-inline">
                        <label for="Phone1">Điện Thoại 2: </label>
                        <asp:TextBox ID="textPhone2" Enabled="false" CssClass="form-control mlPhone1" runat="server"></asp:TextBox>
            </div>
      

        <div class="form-group ml-button">
                <asp:Button ID="commandEdit" OnClientClick="return postbackButtonClick();" CausesValidation="false" runat="server" CssClass="btn btn-primary"  Text="Chỉnh Sửa" OnClick="commandEdit_Click"  />
                <asp:Button ID="commandConfirm" OnClientClick="return postbackButtonClick();" CausesValidation="false" runat="server" CssClass="btn btn-primary"  Text="Tiếp Tục" OnClick="commandConfirm_Click" />          
             </div>
              </ContentTemplate>
        <Triggers>
                <%--<asp:AsyncPostBackTrigger ControlID="commandEdit" EventName="Click" />--%>
               <asp:PostBackTrigger ControlID="commandEdit" />
                <asp:PostBackTrigger ControlID="commandConfirm" />
           
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

    </div>
       <script>
           $(document).ready(function () {
               $('.btn').tooltip();
           });

           $(function () {

               $('[data-toggle="tooltip"]').tooltip()

           })

</script>
</asp:Content>

