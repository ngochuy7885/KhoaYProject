<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .mlfirstname {
            margin-left:7rem;
        }
         .mllastname {
            margin-left:7.3rem;
        }
        .mlAddress {
            margin-left: 4.7rem;
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
            margin-left: 9rem;
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
            margin-left: 7rem;
        }
                
        }
           /*Css for iphone*/
        @media (min-width: 768px) and (max-width: 991.98px) {
            .MyPosition {
                /*margin-left:20px;
                padding-right:10px;
                width:150px;*/
               
                
            }
            .total {
                
                width:90px;
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
                /*margin-left:37px;
                padding-right:40px;*/
                
            }
            .mlAddress {
            margin-left: 4.7rem;
            min-width:450px;
        }
             
             .total {                      
                width:150px;
             }
            
            
        }
       a:hover {
            color:blue;
         }
           
    </style>
    <%--<!-- Tooltip Bootstrap 4 -->
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
     DataKeyNames="Quantity,ShoppingCartID"
    AutoGenerateColumns="False" OnRowDataBound="gridviewShoppingCart_RowDataBound"
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
                       
                                    <%# Eval("ProductName") %>
                                </a>
                 <%--<a  href="ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<img src='ImageViewer.ashx?ProductImageID= <%# Eval("ProductImageID") %>' width='200px'/>" ><%#Eval("ProductName") %> </a>--%>

                
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
            <ItemStyle HorizontalAlign="Left"></ItemStyle>
        </asp:TemplateField>

         <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-Width="10%"> 
                <HeaderTemplate>
                <center>
                    Số Lượng
                </center>
            </HeaderTemplate>
             <ItemTemplate>
                    <%# Eval("Quantity") %>
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
                    <%# Eval("ProductUnitName") %>
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
            <%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("UnitPrice") )%> 
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
                <%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("TotalPrice") )%> 
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="19%"></ItemStyle>
        </asp:TemplateField>

    </Columns>
    </asp:GridView>
            </td>
            <td></td>
        </tr>
        
        
        <tr>
            <td></td>
            <td align="right">
                <table border="0" cellpadding="0" cellspacing="0">
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


        <h3>Thông Tin Vận Chuyển</h3>
     
        <asp:ValidationSummary  ForeColor="Red" CssClass="ml-validation"
                        id="ValidationSummary2" 
                        DisplayMode="BulletList" 
                        runat="server"
                        HeaderText="Lỗi Của Trang:"
                        Font-Names="verdana" 
                        Font-Size="12"/>
           

        <div class="form-group form-inline">
                        <label for="FirstName">Tên: </label>
                        <asp:TextBox ID="textFirstName" MaxLength="40" CssClass="form-control mlfirstname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredFirstName" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Tên "
                            ControlToValidate="textFirstName" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                    </div>
          <div class="form-group form-inline">
                        <label for="LastName">Họ: </label>
                        <asp:TextBox ID="textLastName" MaxLength="45" CssClass="form-control mllastname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Họ"
                            ControlToValidate="textLastName" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                    </div>
        <div class="form-group form-inline">
                        <label for="Address">Địa Chỉ 1: </label>
                        <asp:TextBox ID="textAddress" Columns="27" MaxLength="195" CssClass="form-control mlAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Địa Chỉ"
                            ControlToValidate="textAddress" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False"  Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                    </div>
         <div class="form-group form-inline">
                        <label for="Address2">Địa Chỉ 2: </label>
                        <asp:TextBox ID="textAddress2" MaxLength="45" Columns="27" CssClass="form-control mlAddress" runat="server"></asp:TextBox>
                      </div>
         <div class="form-group form-inline">
                        <label for="City">Thành Phố: </label>
                        <asp:TextBox ID="textCity" MaxLength="45" CssClass="form-control mlCity" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Thành Phố"
                            ControlToValidate="textCity" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False"  Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                    </div>
        <div class="form-group form-inline">
                        <label for="City">Tiểu Bang: </label>
                        <asp:TextBox ID="textState" MaxLength="45" CssClass="form-control mlState" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Tiểu Bang"
                            ControlToValidate="textState" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False"  Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                    </div>
          <div class="form-group form-inline">
                        <label for="PostalCode">Mã Bưu Điện: </label>
                        <asp:TextBox ID="textPostalCode" MaxLength="45" CssClass="form-control mlPostalCode" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Mã Bưu Điện"
                            ControlToValidate="textPostalCode" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                    </div>
        
           <div class="form-group form-inline">
                        <label for="txtPhone">Điện Thoại 1: </label>
                        <asp:TextBox ID="textPhone" MaxLength="45" CssClass="form-control mlPhone1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Điện Thoại"
                            ControlToValidate="textPhone" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False"  Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                    </div>
          <div class="form-group form-inline">
                        <label for="txtPhone">Điện Thoại 2: </label>
                        <asp:TextBox ID="textPhone2" MaxLength="45" CssClass="form-control mlPhone1" runat="server"></asp:TextBox>
          </div>
        <div class="form-group form-inline">
                        <label for="txtFax">Fax: </label>
                        <asp:TextBox ID="textFax" MaxLength="45" CssClass="form-control mlFax" runat="server"></asp:TextBox>
          </div>
        

         <div class="form-group form-inline">
                <asp:CheckBox ID="checkboxVerify" AutoPostBack="true" OnCheckedChanged="checkboxVerify_CheckedChanged" CssClass="mlNewsLetter" runat="server" /> &nbsp; Tôi đủ tuổi để thực hiện mua bán này 
          </div>

        <div class="form-group ml-button">

                <asp:Button ID="commandSubmit" CausesValidation="true" runat="server" CssClass="btn btn-primary"  Text="Tiếp Tục" OnClick="commandSubmit_Click" Enabled="false" />
            </div>
        
    </div> 
             </ContentTemplate>
    </asp:UpdatePanel>
        <script>
        $(document).ready(function () {
            $('.btn').tooltip();
        });

        $(function () {

            $('[data-toggle="tooltip"]').tooltip()

        })

</script>
</asp:Content>

