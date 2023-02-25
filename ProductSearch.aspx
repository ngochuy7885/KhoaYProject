<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ProductSearch.aspx.cs" Inherits="ProductSearch" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style type="text/css">
            .test {
              color:blue;
        }
        .test:hover {
        color:blue;
                }
      @media (min-width: 768px) and (max-width: 991.98px) { 
     .MyPosition {           
            height:300px;
            width:218px;
        }
       }
          @media (min-width: 1200px) {
              .MyPosition {
                  height: 300px;
                  width: 375px;
              }
          }
       </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
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
    <asp:DataList ID="datalistProducts" DataKeyField="ProductId" RepeatColumns="2" RepeatDirection="Horizontal"  runat="server">
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
            </asp:DataList>
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
</asp:Content>

