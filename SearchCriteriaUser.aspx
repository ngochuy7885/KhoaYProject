<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="SearchCriteriaUser.aspx.cs" Inherits="SearchCriteriaUser" EnableEventValidation="false" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/products.css" rel="stylesheet" />
    <style type="text/css">
        .cardcus h5 {
            overflow: hidden;
            height: 60px;
            font-weight: 500;
            font-size: 1rem;
        }

        .card-img-topcus {
            width: 100%;
            max-height: 160px;
            object-fit: contain;
            padding: 0px;
            margin-bottom: 0px;
        }
        /*Css for iphone*/
        @media (min-width: 768px) and (max-width: 991.98px) {


            .footercus {
                /*background: #f8f9fa;
            color: black;*/
                background-color: #2687fb;
                color: white;
                padding: 20px;
                min-height: 40vh;
            }
        }
    </style>


    <script>

        var oldgridSelectedColor;

        function setMouseOverColor(element) {
            oldgridSelectedColor = element.style.backgroundColor;
            element.style.backgroundColor = '#f4f8fb';
            element.style.cursor = 'pointer';
            element.style.textDecoration = 'none';
        }

        function setMouseOutColor(element) {
            element.style.backgroundColor = oldgridSelectedColor;
            element.style.textDecoration = 'none';
        }
    </script>
    <style type="text/css">
        .link {
            color: blue;
            font-weight: bold;
            text-decoration: underline;
        }

            .link:hover {
                text-decoration: underline;
            }
    </style>

    <style type="text/css">
        a:hover {
            color: blue;
        }

        .test {
            color: blue;
        }

            .test:hover {
                color: blue;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:Panel ID="panelResults" runat="Server"
        Visible="false" Height="24px">
        <div class="container">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>

                    <td valign="top" style="color: red">
                        <asp:Label ID="labelMessage" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <br />
    <asp:Panel ID="panelOrders" runat="Server" Visible="true" Style="width: 100%">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">

            <tr>
                <td>
                    <asp:GridView ID="gridviewOrders" runat="server"
                        AutoGenerateColumns="False" Width="100%"
                        OnRowDataBound="gridviewOrder_RowDataBound"
                        OnSelectedIndexChanged="gridviewOrders_SelectedIndexChanged"
                        CssClass="table table-bordered table-condensed"
                        DataKeyNames="OrderId">
                        <Columns>
                            <asp:TemplateField ItemStyle-HorizontalAlign="center" HeaderText="Hóa Đơn ID">
                                <HeaderTemplate>
                                    <center>Hóa Đơn ID</center>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <a class="link" href="CustomerOrderDetails.aspx?TransID=
<%# Eval("TransactionID") %>&OrderID=<%# Eval("OrderID") %>">
                                        <%# Eval("OrderID") %></a>
                                </ItemTemplate>

                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngày Đặt Hàng">
                                <ItemTemplate>
                                    <%-- <%# Eval("OrderDate","{0:dd/MM/yyyy HH:mm:ss}") %>--%>
                                    <%# Eval("OrderDate","{0:dd/MM/yyyy}") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trạng Thái">
                                <ItemTemplate>
                                    <%# Eval("OrderStatusName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ngày Giao Hàng">
                                <ItemTemplate>
                                    <%--<%# Eval("ShipDate", "{0:dd/MM/yyyy HH:mm:ss}") %>--%>
                                    <asp:Label Text='<%# Eval("ShipDate","{0:dd/MM/yyyy}").ToString() == "01/01/1900" ? "" : Eval("ShipDate", "{0:dd/MM/yyyy}") %>'
                                        runat="server" />
                                    <%--<%# Eval("ShipDate", "{0:dd/MM/yyyy}") %>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Số Xe">
                                <ItemTemplate>
                                    <%# Eval( "TrackingNumber" )%>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <PagerStyle HorizontalAlign="Left" CssClass="pagination-ys" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#f4f8fb" Font-Bold="True" ForeColor="black" />


                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="panelProducts" runat="Server" Visible="true" Style="width: 100%">
        <%--<asp:DataList ID="datalistProducts" DataKeyField="ProductId" RepeatColumns="2" RepeatDirection="Horizontal"  runat="server">
                 <ItemTemplate>

                    <div class="col-lg-12">
                        <div class="card rounded-bottom card-group MyPosition" >
  
                            <p class="card-img text-center">
                                <a onmouseover="VietAd_ShowTooltip('../ToolTipLocationProduct.aspx?ProductID=<%# Eval("ProductID")%>'); return false" onmouseout="VietAd_HideTooltip();" href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>
                                    <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="img-responsive" width="180px" height="120px" />
                                </a>
                            </p>
                            <div class="card-body">
                                <h5 class="card-title text-center"><a href="ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>" title="View Product"><%# Eval("ProductName") %></a></h5>
                                <div class="row text-center">
                                    <div class="container">
                                        <a href="#" runat="server" class="btn btn-danger text-light text-center" style="width: 47%"><%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("Price") )%>  </a>           
                                        <a href="AddToCart.aspx?ProductID=<%# Eval("ProductID") %>" class="btn btn-success text-center" style="width: 47%" >Đặt Hàng</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    </div>
                <br />

                </ItemTemplate>
            </asp:DataList>--%>
        <table border="0">
            <tr>
                <td style="text-align: left">
                    <asp:Panel ID="panelPromotion1" runat="server" CssClass="Promotion">
                        <div class="containercus">
                            <div class="row">

                                <asp:Repeater ID="datalistProducts" runat="server">
                                    <ItemTemplate>

                                        <div class="cardcus border">
                                            <a href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>
                                                <%-- <a onmouseover="VietAd_ShowTooltip('../ToolTipImageProduct.aspx?ProductID=<%# Eval("ProductID")%>'); return false" onmouseout="VietAd_HideTooltip();" href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>--%>
                                                <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="card-img-topcus" /></a>
                                            <div class="card-body">
                                                <h5 class="card-title text-center"><a href="ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>" title="View Product"><%# Eval("ProductName") %></a></h5>
                                                <div class="row text-center">
                                                    <div class="container">
                                                        <a href="#" runat="server" class="btn btn-danger text-light text-center" style="width: 47%"><%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("Price") )%>  </a>
                                                        <a href="AddToCart.aspx?ProductID=<%# Eval("ProductID") %>" class="btn btn-success text-center" style="width: 47%">Đặt Hàng</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </asp:Panel>
                </td>
            </tr>
        </table>

        <div class="container">
            <cc1:CollectionPager ID="CollectionPager1"
                FirstText="Đầu"
                BackText=" Trước &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;"
                LabelText="Trang:  &amp;nbsp;"
                LastText=" Cuối"
                NextText="&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Tiếp "
                ShowFirstLast="True"
                SliderSize="5"
                runat="server" BackNextLinkSeparator="" BackNextLocation="Split"
                ResultsFormat="Hiển thị {0}-{1} (Tổng Cộng {2} Mẫu Tin)"
                BackNextDisplay="HyperLinks" BackNextStyle="Color:blue;" ControlCssClass="test">
            </cc1:CollectionPager>
        </div>
        <%--<div class="loading" align="center">
    
                <img src="Images/ajax-loading-icon-19.jpg" width="50px" height="50px" alt="" />
        </div>--%>
    </asp:Panel>
    <%--  <script type="text/javascript" src="Scripts/jquery1.8.3.min.js"></script>
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
</script>--%>
</asp:Content>

