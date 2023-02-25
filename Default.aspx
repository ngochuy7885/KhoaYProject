<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
        margin-bottom:0px;
    }
    </style>
    <style type="text/css">
     
    /*Css for iphone*/
        @media (min-width: 768px) and (max-width: 991.98px) {

           
            footer {
                /*background: #f8f9fa;
            color: black;*/
                background-color: #2687fb;
                color: white;
                padding: 5px;
                min-height:2vh;            
            }
        
        }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
   <%-- <script type="text/javascript" src="../Scripts/ajax-dynamic-content.js"></script>
    <script type="text/javascript" src="../Scripts/ajax-tooltip.js"></script>
	<script type="text/javascript" src="../Scripts/ajax.js" defer="defer"></script>--%>
   
 
    <%--<style type="text/css">
        hr.message-inner-separator
        {
            clear: both;
            margin-top: 10px;
            margin-bottom: 13px;
            border: 0;
            height: 1px;
            background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
            background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
            background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
            background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
        }

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
        //    $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert alert-info"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <h5 class="alert-heading">Thông Báo!</h5>   <hr class="message-inner-separator"> <strong>' + messagetype + '</strong> <span>' + message + '</span></div>');
            $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert alert-info"><asp:Button runat="server" ID="btnCloseAlert" OnClick="btnCloseAlert_Click" class="close" Text="x"/> <h5 class="alert-heading">Thông Báo!</h5>   <hr class="message-inner-separator"> <strong>' + messagetype + '</strong> <span>' + message + '</span></div>');

        }
    </script>--%>
    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                 <%--<div class="messagealert" id="alert_container">
                 </div>--%>
                
               
                <%--<asp:DataList ID="datalistProducts" DataKeyField="ProductId" RepeatColumns="2" RepeatDirection="Horizontal"  runat="server">
                     <ItemTemplate>

                        <div class="col-lg-12">
                            <div class="card rounded-bottom card-group MyPosition" >
  
                                <p class="card-img text-center">
                                    <a onmouseover="VietAd_ShowTooltip('../ToolTipLocationProduct.aspx?ProductID=<%# Eval("ProductID")%>'); return false" onmouseout="VietAd_HideTooltip();" href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>
                                        <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="img-responsive" width="150px" height="120px" />
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
                   <asp:Panel ID="panelPromotion1" runat="server" CssClass="Promotion">
                                <div class="containercus">
                                    <div class="row">
                                     
  

                                        <asp:Repeater ID="datalistProducts" runat="server">
                                            <ItemTemplate>
                                                <div class="cardcus border">
                                                    <a href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>
                                                     <%-- <a onmouseover="VietAd_ShowTooltip('../ToolTipImageProduct.aspx?ProductID=<%# Eval("ProductID")%>'); return false" onmouseout="VietAd_HideTooltip();" href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>
                        --%>
                                                        
                                                        <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="card-img-topcus" />

                                                    </a>
                                                    <div class="card-body">
                                                        <h5  class="card-title text-center"><a href="ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>" title="View Product"><%# Eval("ProductName") %></a></h5>
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
                   



                <%--<cc1:CollectionPager ID="CollectionPager1" runat="server" BackText="« Trước"
    FirstText="Đầu" LabelText="Trang: &amp;nbsp; "  LabelStyle="color:blue;" LastText="Cuối" NextText="Sau »"
    ResultsFormat="Hiển thị {0}-{1} (Tổng Cộng {2})" ControlCssClass="test">
    </cc1:CollectionPager>--%>
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
                <%--<cc1:CollectionPager ID="CollectionPager1"
                FirstText=""
                BackText=" Trước &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;"
                LabelText=" "
                LastText=""
                LabelStyle="color:blue;"
                NextText="&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Tiếp "
                ShowFirstLast="True"
                SliderSize="10" PagingMode="PostBack"
                runat="server" BackNextLinkSeparator="" BackNextLocation="Split"
                ResultsFormat="Hiển thị {0}-{1} (Tổng Cộng {2})"
                PageNumbersDisplay="Numbers" ResultsLocation="None"
                BackNextDisplay="HyperLinks" BackNextStyle="Color:blue;" ControlCssClass="test">
            </cc1:CollectionPager>--%>
            </div>
            </ContentTemplate>
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

</asp:Content>

