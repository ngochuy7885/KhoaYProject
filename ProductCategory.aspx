<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ProductCategory.aspx.cs" Inherits="ProductCategory" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            height: 40px;
            font-weight: 500;
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

        .cardcus1:hover {
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
    <style type="text/css">
        a:hover {
            color:blue;
        }
            .test {
              color:blue;
        }
        .test:hover {
        color:blue;
                }
       @media (min-width: 375px) and (max-width: 576px) {
            .cardcus {
                background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .5s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .5s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border: 0;
                border-radius: 1rem;
                margin-left: 20px;
                width: 420px;
                height: 320px;
                margin-bottom: 20px;
            }
        }

        @media (min-width: 576px) and (max-width: 767px) {
            .cardcus {
                background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border: 0;
                border-radius: 1rem;
                margin-left: 20px;
                width: 340px;
                height: 320px;
                margin-bottom: 20px;
            }
        }

        @media (min-width: 768px) and (max-width: 991px) {
            .MyPosition {
                height: 300px;
                width: 218px;
            }

            .cardcus {
                background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border: 0;
                border-radius: 1rem;
                margin-left: 20px;
                width: 228px;
                height: 300px;
                margin-bottom: 20px;              
            }
            

            .cardcus h5 {
            overflow: hidden;
            height: 40px;
            font-weight: 500;
            font-size: 1rem;
            color:red;
            }
            .card-img-topcus {
            width: 100%;
            max-height: 160px;           
            object-fit: contain;
            padding: 30px;
        }
        }

        @media (min-width: 992px) and (max-width: 1199px) {
            .cardcus {
                background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border: 0;
                border-radius: 1rem;
                margin-left: 20px;
                width: 318px;
                height: 320px;
                margin-bottom: 20px;
            }
          
        }

        @media (min-width: 1200px) {
            .MyPosition {
                height: 300px;
                width: 360px;
            }

               .cardcus {
                background: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                border: 0;
                border-radius: 1rem;
                margin-left: 20px;
                width: 250px;
                height: 320px;
                margin-bottom: 20px;
            }

            .Promotion {
                width: 100%;
            }
        }

    </style>

     

    <!-- Css for progress bar -->
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <asp:Panel ID="panelResults" runat="Server"
            Visible="false" Height="24px">
           <div class="container">
            <table border="0" cellpadding="1" cellspacing="0" width="100%">
                <tr>
            
                    <td valign="top" width="100%" style="color:red" nowrap>Không Có Dữ Liệu</td>
                </tr>
            </table>
               </div>
        </asp:Panel> 
    <%--<asp:DataList ID="datalistProducts" DataKeyField="ProductId" RepeatColumns="2" RepeatDirection="Horizontal"  runat="server">
                 <ItemTemplate>

                    <div class="col-lg-12">
                        <div class="card rounded-bottom card-group MyPosition">
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
    
            <table border="0" >
                <tr>                   
                    <td style="text-align:left">
                <asp:Panel ID="panelPromotion1" runat="server" CssClass="Promotion">
                    <div class="containercus">                   
                         <div class="row">
                                 
                             <asp:Repeater ID="datalistProducts" runat="server">
                                            <ItemTemplate>

                                                <div class="cardcus border">
                                                    <a href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>
                                
                                                     <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="card-img-topcus"/></a>
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
            SliderSize="10"
            runat="server" BackNextLinkSeparator="" BackNextLocation="Split"
            ResultsFormat="Hiển thị {0}-{1} (Tổng Cộng {2} Mẫu Tin)"            
            BackNextDisplay="HyperLinks" BackNextStyle="Color:blue;" ControlCssClass="test">
        </cc1:CollectionPager>
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
    </div>
</asp:Content>

