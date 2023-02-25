<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Admin_Products" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   

    <link href="../CSS/products.css" rel="stylesheet" />
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


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    
    <script type="text/javascript" src="../Scripts/ajax-dynamic-content.js"></script>
    <script type="text/javascript" src="../Scripts/ajax-tooltip.js"></script>
    <script type="text/javascript" src="../Scripts/ajax.js" defer="defer"></script>
          
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
     

            <%--<asp:DataList ID="datalistProducts" DataKeyField="ProductId" RepeatColumns="2" RepeatDirection="Horizontal"  runat="server">
                 <ItemTemplate>

                    <div class="col-lg-12" >
                        <div class="card card-group MyPosition"  style="height:330px" > 
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
            <table border="0">

                <tr>

                    <td style="text-align: left">
                        <asp:Panel ID="panelPromotion1" runat="server" CssClass="Promotion">
                            <div class="containercus">
                                <div class="row">

                                    <asp:Repeater ID="datalistProducts" runat="server">
                                        <ItemTemplate>

                                            <div class="cardcus border">
                    <%--                            <a onmouseover="VietAd_ShowTooltip('../ToolTipLocationProduct.aspx?ProductID=<%# Eval("ProductID")%>'); return false" onmouseout="VietAd_HideTooltip();" href='EditProduct.aspx?ProductID=<%# Eval("ProductID") %>'>

                                                    <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="card-img-topcus" />

                                                </a>--%>

                                                 <%-- <a onmouseover="VietAd_ShowTooltip('../ToolTipLocationProduct.aspx?ProductID=<%# Eval("ProductID")%>'); return false" onmouseout="VietAd_HideTooltip();"'>

                                                    <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="card-img-topcus" />

                                                </a>--%>
                                                  <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<%#Eval("Location") %>" class="card-img-topcus" />

                                               

                                                 <%--<asp:LinkButton CssClass="font-weight-bold" ID="btnShow" runat="server" OnClick="btnShow_Click" CommandArgument='<%#Eval("Location") %>'>
                                                       <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="card-img-topcus" />

                                                 </asp:LinkButton>--%>

                                                <div class="card-body" style="text-align: center">

                                                    <h5 class="card-title text-center" >
                                                  <%--      <asp:LinkButton CssClass="font-weight-bold" ID="btn1" runat="server" OnClick="btn1_Click" CommandArgument='<%#Eval("Location") + ";" + Eval("Price","{0:#,##0}")%>'><%#Eval("ProductName") %></asp:LinkButton>--%> 
                                                       
                                                        <%-- <a onmouseover="VietAd_ShowTooltip('../ToolTipPriceProduct.aspx?ProductID=<%# Eval("ProductID")%>'); return false" onmouseout="VietAd_HideTooltip();"'>
                                                              <h5 class="card-title text-center">
                                                         
                                                                         <font ><%#Eval("ProductName") %> </font> 
                                                                 </h5>                
                                                        </a>--%>
                                                        <font data-toggle="tooltip" data-html="true" data-placement="bottom" title="<%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("Price") )%> VNĐ <%# Eval("SearchName") %>" ><%#Eval("ProductName") %> </font>

                                                    </h5>

                                                 <%--    <h5 class="card-title text-center">
                                                                        <a href="EditProduct.aspx?ProductID=<%# Eval("ProductID") %>" title="View Product"><%# Eval("ProductName") %></a> 
                                                                            </h5>--%>

                                                    <div class="row text-center">
                                                        <div class="container">
                                                            <a href="AddProduct.aspx" runat="server" class="btn btn-danger text-light text-center" style="width: 47%">Thêm   </a>
                                                            <a href="EditProduct.aspx?ProductID=<%# Eval("ProductID") %>" class="btn btn-success text-center" style="width: 47%">Cập Nhật</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>
                        </asp:Panel>
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
                      <%--         <asp:TextBox Enabled="false" Font-Bold="true" Font-Size="Larger" ID="textLocation"  TabIndex="3" CssClass="form-control LocationLength" runat="server"></asp:TextBox>                        
                      --%>  </div>
                    </div>
                </div>
            </asp:Panel>

            <%--  <div class="container-fluid">
        <nav aria-label="...">
            <ul class="pagination">
                <li class="page-item">
                    <asp:LinkButton ID="lnkbtnPrevious" runat="server" CssClass="page-link" OnClick="lnkbtnPrevious_Click">Trước</asp:LinkButton>
                </li>
                <li class="page-item">
                    <asp:DataList ID="dlPaging" RepeatColumns="2" runat="server" OnItemCommand="dlPaging_ItemCommand" OnItemDataBound="dlPaging_ItemDataBound"
                        RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <asp:LinkButton CssClass="page-link" ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                                CommandName="lnkbtnPaging" Text='<%# Eval("PageText") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:DataList>
                </li>
                <li class="page-item">
                    <asp:LinkButton ID="lnkbtnNext" runat="server" CssClass="page-link" OnClick="lnkbtnNext_Click">Sau</asp:LinkButton>
                </li>
            </ul>
        </nav>
    </div>--%>
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

