<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--Image Zoom--%>
    <script src="Scripts/js/fancybox.umd.js"></script>  
    <link href="CSS/fancybox.css" rel="stylesheet" />
    <style type="text/css">
        @media (min-width: 375px) and (max-width: 576px) {
            .MyPosition {
                /*margin-left: 35px;*/
            }

            .total {
                width: 85px;
            }


            .Promotion {
                width: 400px;
            }


            .cardcus {
                background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border-radius: 1rem;
                margin-left: 20px;
                width: 380px;
                height: 360px;
                margin-bottom: 20px;
            }
        }

        @media (min-width: 576px) and (max-width: 768px) {
            .MyPosition {
                /*margin-left:20px;
                padding-right:10px;
                width:150px;*/
            }

            .total {
                width: 70px;
            }

            .labelKHCSS {
                width: 330px;
                margin-left: 0px;
            }

            .Promotion {
                width: 350px;
            }

            .cardcus {
                background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border-radius: 1rem;
                margin-left: 20px;
                width: 310px;
                height: 390px;
                margin-bottom: 20px;
            }
        }

        @media (min-width: 768px) and (max-width: 991.98px) {
            /*Css for iphone*/
            .MyPosition {
                /*margin-left: 35px;*/
            }

            .total {
                width: 90px;
            }

            .Promotion {
                width: 470px;
            }

            .cardcus {
                background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border-radius: 1rem;
                margin-left: 20px;
                width: 210px;
                height: 450px;
                margin-bottom: 20px;
            }
        }

        @media (min-width: 992px) and (max-width: 1199px) {
            .MyPosition {
                /*margin-left: 15px;*/
            }

            .total {
                width: 123px;
            }

            .Promotion {
                width: 100%;
            }

            .cardcus {
                background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border: 0;
                border-radius: 1rem;
                margin-left: 20px;
                width: 190px;
                height: 460px;
                margin-bottom: 20px;
            }
        }


        @media (min-width: 1200px) {
            .MyPosition {
            }

            .total {
                align-content: center;
                width: 148px;
            }

            .Promotion {
                width: 100%;
            }

            .panelResult {
                margin-left: 10px;
            }

            .rowcus {
                margin-left: 0px;
                padding: 0px;
            }

            .cardcuspromo {
                /*background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border: 0;
                border-radius: 1rem;
                margin-left: 20px;
                width: 240px;
                border: 1px;
                height: 430px;
                margin-bottom: 20px;*/
                
                background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .5s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .5s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border: 0;
                border-radius: 1rem;
                margin-left: 20px;
                width: 240px;
                height: 430px;
                margin-bottom: 20px;
                

            }
            .cardcuspromo h2 {
                    overflow: hidden;
                    height: 40px;
                    font-weight: 500;
                    font-size: 1rem;
            }
            .cardcuspromo p {
                    overflow: hidden;
                    height: 100px;
                   
            }
                .cardcuspromo:hover {
                   
                        /*transform: scale(1.05);
                        box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);*/
                    }
            }
    </style>
    <style type="text/css">
        .linkpromo {
            position: relative;
            color: black;
            text-decoration: none;
        }

            .linkpromo:hover {
                color: blue;
            }

        a:hover {
            color: blue;
        }
    </style>
    <style>
        .container-fluid {
            max-width: 300px;
        }


        .card-imgcus,
        .card-img-topcus {
            border-top-left-radius: calc(1rem - 1px);
            border-top-right-radius: calc(1rem - 1px);
        }

        .cardcus h5 {
            overflow: hidden;
            height: 56px;
            font-weight: 900;
            font-size: 1rem;
        }

        .card-img-topcus {
            width: 100%;
            max-height: 180px;
            object-fit: contain;
            padding: 30px;
        }

        .cardcus h2 {
            font-size: 1rem;
        }

        .cardcus:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
        }

        .containercus {
            width: 100%;
            padding-right: 5px;
            padding-left: 5px;
            margin-right: auto;
            margin-left: auto;
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

       <%--Set Css Column Search--%>
<style>
    .searchpaddingleft33 {
        padding-left:33px;
    }
</style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript" src="../Scripts/ajax-dynamic-content.js"></script>
    <script type="text/javascript" src="../Scripts/ajax-tooltip.js"></script>
    <script type="text/javascript" src="../Scripts/ajax.js" defer="defer"></script>
    <div class="container">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Panel ID="panelResults" runat="Server" CssClass="panelResult"
                    Visible="false">
                    <table border="0" cellpadding="1" cellspacing="0" width="100%">
                        <tr>
                            <td valign="top" style="color: red">
                                <asp:Label ID="labelMessage" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td>&nbsp; </td>
                        </tr>
                        <tr>
                            <td><a href="../Default.aspx" class="btn btn-primary">Quay Lại Cửa Hàng</a></td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:Panel ID="PanelShoppingCart" DefaultButton="commandUpdate" runat="server">
            
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td></td>
                            <td>
                                <table cellpadding="0" cellspacing="0"
                                    border="0" width="100%">
                                    <tr>
                                        <td width="10%" align="center"><b>
                                            <asp:Label ID="Label2" runat="server" Text="Gỡ Bỏ"></asp:Label></b></td>
                                        <td width="36%" align="center"><b>
                                            <asp:Label ID="Label3" runat="server" Text="Sản Phẩm"></asp:Label></b></td>
                                        <td width="10%" align="center"><b>
                                            <asp:Label ID="Label4" runat="server" Text="Số Lượng"></asp:Label></b></td>
                                        <td width="15%" align="center"><b>
                                            <asp:Label ID="Label1" runat="server" Text="Đơn Vị Tính"></asp:Label></b></td>

                                        <td width="10%" align="center"><b>
                                            <asp:Label ID="Label6" runat="server" Text="Giá"></asp:Label></b></td>
                                        <td width="19%" align="center"><b>
                                            <asp:Label ID="Label7" runat="server" Text="Tổng Phụ"></asp:Label></b></td>
                                    </tr>
                                </table>
                            </td>
                            <td></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td>

                                <asp:GridView ID="gridviewShoppingCart" runat="server"
                                    DataKeyNames="Quantity,ShoppingCartID,ProductID"
                                    AutoGenerateColumns="false" OnRowDeleting="gridviewShoppingCart_RowDeleting" OnRowDataBound="gridviewShoppingCart_RowDataBound"
                                    Width="100%" BorderWidth="1px" CellPadding="2"
                                    ShowHeader="false">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="10%"
                                            ItemStyle-HorizontalAlign="center">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="checkboxDelete" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="36%">
                                            <ItemTemplate>
                                                <%--<a onmouseover="VietAd_ShowTooltip('../ToolTipImageProduct.aspx?ProductID=<%#Eval("ProductID") %>'); return false" onmouseout="VietAd_HideTooltip();" href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>
                                                    <%# Eval("ProductName") %>
                                                </a>--%>
                                                <%-- <a  href="ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<img src='ImageViewer.ashx?ProductImageID= <%# Eval("ProductImageID") %>' width='200px'/>" ><%#Eval("ProductName") %> </a>--%>
                                                 <a  href="ProductDetails.aspx?ProductID=<%# Eval("ProductID")%>"><%#Eval("ProductName") %> </a>
                                                <%--<a  href="ImageViewer.ashx?ProductImageID= <%# Eval("ProductImageID") %>" data-fancybox="gallery">
                                                    <%#Eval("ProductName") %> 
                                                </a>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="10%"
                                            ItemStyle-HorizontalAlign="center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="textQuantity" runat="server"
                                                    Columns="5" MaxLength="4" Text='<%# Eval("Quantity") %>'
                                                    Width="45px"  />
                                                  <ajaxToolkit:FilteredTextBoxExtender ID="ftbe" runat="server"
                                                        TargetControlID="textQuantity"         
                                                        FilterType="Custom, Numbers"
                                                         />
                                              
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="15%"
                                            ItemStyle-HorizontalAlign="center">
                                            <ItemTemplate>
                                                <%# Eval( "ProductUnitName")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="10%"
                                            ItemStyle-HorizontalAlign="center">
                                            <ItemTemplate>
                                                <%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("UnitPrice") )%> 
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="19%"
                                            ItemStyle-HorizontalAlign="center">
                                            <ItemTemplate>
                                               <%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("TotalPrice") )%> 
                                            </ItemTemplate>
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
                                        <td>
                                            <b>
                                                <asp:Label ID="Label8" runat="server" Text="Tổng Cộng: "></asp:Label>
                                            </b>
                                        </td>
                                        <%--<td style="width: 63%;" align="center">--%>
                                        <td class="total" align="center">
                                            <strong>
                                                <asp:Label ID="labelTotal" CssClass="MyPosition" runat="server" Width="100%">
                                                </asp:Label>
                                            </strong>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td></td>

                            <tr>
                                <td></td>
                                <td class="prodUnderlineBG" width="100%">
                                    <img src="images/spacer.gif" width="1" height="2" /></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td>
                                    <img src="images/spacer.gif" width="1"
                                        height="5" /></td>
                            </tr>


                            <tr>
                                <td></td>
                                <td align="right">
                                   <%--   <asp:Button ID="commandExport" runat="server"
                                        OnClick="commandExport_Click" Text="Xuất PDF" CssClass="btn btn-primary" />
                                 --%>
                                    <asp:Button ID="commandContinueShopping"
                                        runat="server"
                                        OnClick="commandContinueShopping_Click"
                                        Text="Tiếp Tục Mua"
                                        CssClass="btn btn-primary" />


                                    <asp:Button ID="commandUpdate" runat="server"
                                        OnClick="commandUpdate_Click" Text="Cập Nhật" CssClass="btn btn-primary" />
                                    <asp:Button ID="commandCheckout" runat="server"
                                        OnClick="commandCheckout_Click" Text="Tính Tiền" CssClass="btn btn-primary" />

                                </td>
                                <td></td>
                            </tr>
                    </table>
                </asp:Panel>

   
      

                <table>

                    <tr>

                        <td align="left" style="text-align: left">
                           <%-- <asp:Panel ID="panelPromotion" runat="server" CssClass="Promotion">
                                Khách hàng có thể tiếp tục mua những món dưới đây:
                  
                      <div class="col-md-12">
                          <p style="width: 500px; white-space: normal; word-break: break-all"></p>
                      </div>
                                <asp:GridView ID="gridviewAssociated" runat="server"
                                    ShowHeader="False" Width="100%" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <a class="linkpromo" href="ProductDetails.aspx?ProductID=<%# Eval("ProductID")%>">
                                                    <%# Eval("ProductName") %></a>
                                            </ItemTemplate>
                                            <ItemStyle Width="30%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <%# Eval("Description") %>
                                            </ItemTemplate>
                                            <ItemStyle Width="70%" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>--%>
                        </td>
                    </tr>
                </table>



                <div class="col-md-12">
                    <p style="width: 500px; white-space: normal; word-break: break-all"></p>
                </div>

                <%--<table border="0">

                    <tr>

                        <td style="text-align: left">
                            <asp:Panel ID="panelPromotion1" runat="server" CssClass="Promotion">
                                <div class="containercus">
                                    <div class="rowcus labelKHCSS">
                                        <asp:Label ID="labelKH" runat="server" Text="Khách hàng có thể tiếp tục mua những món dưới đây:"></asp:Label>
                                    </div>
                                    <div class="col-md-12">
                                        <p style="width: 500px; white-space: normal; word-break: break-all"></p>
                                    </div>


                                    <div class="row">
                                        <%-- <asp:DataList ID="datalistProductsPromotion" DataKeyField="ProductId" RepeatColumns="2"  RepeatDirection="Horizontal"  runat="server">
                                            <ItemTemplate>

                                                <div class="cardcus border border-primary">
                                                    <a href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>
                                
                                                     <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="card-img-topcus"/></a>
                                                    <div class="card-body text-center">
                                                        <h2 class="Card-title"><%# Eval("ProductName") %></h2>
                                                        <p class="card-text text-left" style="text-align:justify"><%# Eval("Description") %> </p>
                                                        <a href="ProductDetails.aspx?ProductId=<%#Eval("ProductID") %>" class="btn btn-warning">More info</a>
                                                    </div>
                                                </div>
                                            
                                            
                                                 
                                            </ItemTemplate>
                                </asp:DataList>--%>
                                        <%--<asp:Repeater ID="datalistProductsPromotion" runat="server">
                                            <ItemTemplate>

                                                <div class="cardcuspromo border border-primary">
                                                    <a href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>

                                                        <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="card-img-topcus" /></a>
                                                    <div class="card-body text-center">
                                                        <h2 class="Card-title"> <a href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'><%# Eval("ProductName") %></a></h2>
                                                        <p class="card-text text-lg-left" ><%# Eval("Description") %> </p>
                                                        <a href="ProductDetails.aspx?ProductId=<%#Eval("ProductID") %>" class="btn btn-warning">Xem Chi Tiết</a>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>--%>

                                 <%--   </div>
                                </div>
                            </asp:Panel>
                           </td>
                       

                    </tr>
                </table>--%>
            </ContentTemplate>
            <Triggers>
                <%-- <asp:PostBackTrigger  ControlID="commandUpdate" /> --%>
                 <asp:AsyncPostBackTrigger ControlID="commandUpdate" EventName="Click" />
                 <asp:PostBackTrigger ControlID="commandContinueShopping" />
                <%--<asp:PostBackTrigger ControlID="commandExport" />--%>
                <asp:PostBackTrigger ControlID="commandContinueShopping" />
                <asp:PostBackTrigger ControlID="commandCheckout" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    


</asp:Content>

