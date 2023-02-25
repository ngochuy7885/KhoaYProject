<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="SearchCriteria.aspx.cs" Inherits="Admin_SearchCriteria" EnableEventValidation="false" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/products.css" rel="stylesheet" />
    <style type="text/css">
        /*Css for iphone*/
        @media (min-width: 768px) and (max-width: 991.98px) {

           
            footer {
                /*background: #f8f9fa;
            color: black;*/
                background-color: #2687fb;
                color: white;
                padding: 20px;
                min-height:40vh;            
            }
        
        }
    </style>
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
         .ml-button,
         .mx-5 {
             margin-left: 3rem !important;
         }

         .ml-buttonupdate {
             margin-left: 3rem;
         }

         .modalBackground {
             height: 100%;
             background-color: #EBEBEB;
             filter: alpha(opacity=70);
             opacity: 0.7;
         }

         /* Important part */
         .modal-dialog {
             overflow-y: initial !important;
         }

         .modal-content {
             height: 130px;
             width: 410px;
         }

         .modal-body {
             height: 200px;
             width: 410px;
             overflow-y: auto;
             position: relative;
         }

         .modalPopup {
             position: inherit;
             transform: translate(-50%, -50%);
         }


         .link {
             color: blue;
             font-weight: bold;
             text-decoration: underline;
         }

             .link:hover {
                 text-decoration: underline;
                 color: blue;
             }
     </style>
    <%-- Tooltip --%>
          <!-- jQuery library -->
              <script src="../CSS/bootstrap-4.0.0-dist/js/jquery.min.js"></script>

        <!-- Popper JS -->
            <script src="../CSS/bootstrap-4.0.0-dist/js/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
            <script src="../CSS/bootstrap-4.0.0-dist/js/bootstrap.bundle.min.js"></script>

    <style>
         .tooltip.show {
    opacity: 1;
}

        .tooltip-inner {
            background-color: #d1ecf1;
            border: thin;
            color: red;
            width: auto;
            max-width: 100%;
            font-size: larger;
            white-space: nowrap;
        }

        .bs-tooltip-auto[x-placement^=top] .arrow::before, .bs-tooltip-top .arrow::before {
            border-top-color: #d1ecf1;
        }

        .bs-tooltip-auto[x-placement^=right] .arrow::before, .bs-tooltip-right .arrow::before {
            border-right-color: #d1ecf1;
        }

        .bs-tooltip-auto[x-placement^=bottom] .arrow::before, .bs-tooltip-bottom .arrow::before {
            border-bottom-color: #d1ecf1;
        }

        .bs-tooltip-auto[x-placement^=left] .arrow::before, .bs-tooltip-left .arrow::before {
            border-left-color: #d1ecf1;
        }
    </style>
<%--End Tooltip--%>
     <%-- CSS for gridview--%>
    <style type="text/css">
    
     .table td {
         vertical-align:middle;
        }
  
  
</style>
    <%-- End CSS for gridview--%>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
     <script type="text/javascript" src="../Scripts/ajax-dynamic-content.js"></script>
    <script type="text/javascript" src="../Scripts/ajax-tooltip.js"></script>
	<script type="text/javascript" src="../Scripts/ajax.js" defer="defer"></script>
     
    <asp:Panel ID="panelResults" runat="Server"
            Visible="false" Height="24px">
           <div class="container">
            <table border="0" cellpadding="1" cellspacing="0" width="100%">
                <tr>
            
                    <td valign="top"  style="color:red">
                        <asp:Label ID="labelMessage" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr><td>&nbsp;</td></tr>
            </table>
               </div>
        </asp:Panel>
    <br />
    <asp:Panel ID="panelOrders" runat="Server" Visible="true" style="width:100%">
     <table border="0" cellpadding="0" cellspacing="0" style="width:100%" >
      
        <tr>
            <td style="width:10%">
                <asp:GridView ID="gridviewOrder" runat="server"
                   OnRowDataBound="gridviewOrder_RowDataBound" 
                    OnSelectedIndexChanged="gridviewOrder_SelectedIndexChanged"
                    DataKeyNames="OrderId,Email"
                      CssClass="table table-bordered table-condensed"            
                   Width="100%"
                    AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Hóa Đơn ID">
                            <ItemTemplate>
                                <a class="link" href="OrderDetails.aspx?Email=<%# Eval("Email") %>&TransID=<%# Eval("TransactionID") %>&OrderID=
<%# Eval("OrderID") %>">
                                    <%# Eval("OrderID") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên">
                            <ItemTemplate>
                                <%# Eval("FirstName") %> <%# Eval("LastName") %><br />
                                <%# Eval("AddressLine") %> <%# Eval("AddressLine2") %><br />
                                <%# Eval("City") %>, <%# Eval("State") %>
                                <%# Eval("PostalCode") %> <br />
                                <%# Eval("Email") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <%--<asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <%# Eval("Email") %>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Điện Thoại">
                            <ItemTemplate>
                                <%# Eval("Phone") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <asp:TemplateField HeaderText="Ngày Đặt Hàng">
                            <ItemTemplate>
                                 <%# Eval("OrderDate","{0:dd/MM/yyyy HH:mm:ss}") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Trạng Thái">
                            <ItemTemplate>
                                <%# Eval("OrderStatusName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    
                    <PagerStyle HorizontalAlign = "Left" CssClass = "pagination-ys" />
                    <HeaderStyle BackColor="#f4f8fb" />
                </asp:GridView>
            </td>
        </tr>
    </table>
   </asp:Panel > 

    <asp:Panel ID="panelProducts" runat="Server" Visible="true" style="width:100%">
         <%--<asp:DataList ID="datalistProducts" DataKeyField="ProductId" RepeatColumns="2" RepeatDirection="Horizontal"  runat="server">
                 <ItemTemplate>

                    <div class="col-lg-12" >
                        <div class="card rounded-bottom card-group MyPosition" > 
                            <p class="card-img text-center">
                                <a onmouseover="VietAd_ShowTooltip('../ToolTipLocationProduct.aspx?ProductID=<%# Eval("ProductID")%>'); return false" onmouseout="VietAd_HideTooltip();" href='EditProduct.aspx?ProductID=<%# Eval("ProductID") %>'>
                                    <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="img-responsive mt-sm-3" width="200" height="120" />
                                </a>
                            </p>
                            <div class="card-body">
                                <h5 class="card-title text-center"><a href="EditProduct.aspx?ProductID=<%# Eval("ProductID") %>" title="View Product"><%# Eval("ProductName") %></a></h5>
                                <h5 class="card-title text-center"><%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("Price") )%> VNĐ</h5>
                                <div class="row text-center">
                                    <div class="container">
                                        <a href="AddProduct.aspx" runat="server" class="btn btn-danger text-light text-center" style="width: 47%">Thêm   </a>           
                                        <a href="EditProduct.aspx?ProductID=<%# Eval("ProductID") %>" class="btn btn-success text-center" style="width: 47%" >Cập Nhật</a>
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
                                                 <%--       <a onmouseover="VietAd_ShowTooltip('../ToolTipLocationProduct.aspx?ProductID=<%# Eval("ProductID")%>'); return false" onmouseout="VietAd_HideTooltip();" href='EditProduct.aspx?ProductID=<%# Eval("ProductID") %>'>--%> 
                                                  <%--<a onmouseover="VietAd_ShowTooltip('../ToolTipLocationProduct.aspx?ProductID=<%# Eval("ProductID")%>'); return false" onmouseout="VietAd_HideTooltip();">            
                                                            <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="card-img-topcus"/>

                                                  </a>--%>
                                                    <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<%#Eval("Location") %>" class="card-img-topcus"/>

                                                     
                                                    <div class="card-body">
                                                            <h5 class="card-title text-center" >
                                                       <%-- <asp:LinkButton CssClass="font-weight-bold" ID="btn1" runat="server" OnClick="btn1_Click" CommandArgument='<%#Eval("Location") + ";" + Eval("Price","{0:#,##0}")%>'><%#Eval("ProductName") %></asp:LinkButton>--%>
                                                      <%--<a onmouseover="VietAd_ShowTooltip('../ToolTipPriceProduct.aspx?ProductID=<%# Eval("ProductID")%>'); return false" onmouseout="VietAd_HideTooltip();"'>
                                                          <h5 class="card-title text-center">
                                                                 <font><%#Eval("ProductName") %> </font>    
                                                          </h5>              
                                                     </a>--%>
                                                                 <font data-toggle="tooltip" data-html="true" data-placement="bottom" title="<%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("Price") )%> VNĐ <%# Eval("SearchName") %>" ><%#Eval("ProductName") %> </font>

                                                    </h5>
                                                        <%--<h5 class="card-title text-center"><a href="EditProduct.aspx?ProductID=<%# Eval("ProductID") %>" title="View Product"><%# Eval("ProductName") %></a></h5>
                                                        --%>
                                                         <div class="row text-center">
                                                            <div class="container">
                                                                <a href="AddProduct.aspx" runat="server" class="btn btn-danger text-light text-center" style="width: 47%">Thêm   </a>           
                                                                <a href="EditProduct.aspx?ProductID=<%# Eval("ProductID") %>" class="btn btn-success text-center" style="width: 47%" >Cập Nhật</a>
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
             
            <asp:LinkButton ID="Linkbtn" runat="server"></asp:LinkButton>
            <asp:ModalPopupExtender ID="ModalPopupExtenderUpdate"                
                BackgroundCssClass="modalBackground"
                TargetControlID="Linkbtn"
                CancelControlID="btnCloseModel"
                PopupControlID="PanelUpdate"
                PopupDragHandleControlID="PanelUpdate"
                runat="server">
            </asp:ModalPopupExtender>
            <asp:Panel ID="PanelUpdate" CssClass="modalPopup" runat="server">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            
                            <h5 class="modal-title" id="exampleModalLabel1">Giá</h5>
                            <asp:Button ID="btnCloseModel" OnClick="btnCloseModel_Click" aria-label="Close" runat="server" Text="x" >
                              
                            </asp:Button>
                              
                          
                        </div>
                        <div class="modal-body">  
                                   <asp:Label ID="lblPrice" Font-Bold="true" ForeColor="Red"  Font-Size="Larger" runat="server"></asp:Label>                           
                                               
                                <%--<asp:TextBox Enabled="false" ID="textLocation"  TabIndex="3" CssClass="form-control LocationLength" runat="server"></asp:TextBox>--%>                        
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
 </asp:Panel>
    <script>
        $(document).ready(function () {
            $('.btn').tooltip();
        });

        $(function () {

            $('[data-toggle="tooltip"]').tooltip()

        })

      </script>
</asp:Content>

