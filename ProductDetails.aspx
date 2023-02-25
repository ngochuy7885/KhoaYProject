<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--Image Zoom--%>
    <script src="Scripts/js/fancybox.umd.js"></script>
   
    <link href="CSS/fancybox.css" rel="stylesheet" />


    <style type="text/css">
       

img {
  max-width: 100%; 
  
  
}

.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
  @media screen and (max-width: 996px) {
    .preview {
      margin-bottom: 20px; } }

.preview-pic {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.preview-thumbnail.nav-tabs {
  border: none;
  margin-top: 15px; }
  .preview-thumbnail.nav-tabs li {
    width: 18%;
    margin-right: 2.5%; }
    .preview-thumbnail.nav-tabs li img {
      max-width: 100%;
      display: block; }
    .preview-thumbnail.nav-tabs li a {
      padding: 0;
      margin: 0; }
    .preview-thumbnail.nav-tabs li:last-of-type {
      margin-right: 0; }

.tab-content {
  overflow: hidden; }
  .tab-content img {
    width: 100%;
    -webkit-animation-name: opacity;
            animation-name: opacity;
    -webkit-animation-duration: .3s;
            animation-duration: .3s; }


@media screen and (min-width: 997px) {
  .wrapper {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex; } }

.details {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }

.colors {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.product-title, .price, .sizes, .colors {
  text-transform: UPPERCASE;
  font-weight: bold; }

.checked, .price span {
  color: #ff9f1a; }

.product-title, .rating, .product-description, .price, .vote, .sizes {
  margin-bottom: 15px; 
  
}

.product-title {
  margin-top: 0; }

.size {
  margin-right: 10px; }
  .size:first-of-type {
    margin-left: 40px; }

.color {
  display: inline-block;
  vertical-align: middle;
  margin-right: 10px;
  height: 2em;
  width: 2em;
  border-radius: 2px; }
  .color:first-of-type {
    margin-left: 20px; }


.not-available {
  text-align: center;
  line-height: 2em; }
  .not-available:before {
    font-family: fontawesome;
    content: "\f00d";
    color: #fff; }

.orange {
  background: #ff9f1a; }

.green {
  background: #85ad00; }

.blue {
  background: #0076ad; }

.tooltip-inner {
  padding: 1.3em; }

@-webkit-keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
		<div class="card border-0">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-5">
						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1">
                              <a href="#">
                                <asp:Image ID="imageProduct"  data-fancybox="gallery"  runat="server"/>
                                </a>
                           </div>           
						        
                        </div>
						
						
					</div>
					<div class="details col-md-7">
						<h3 class="product-title">
                            <asp:Label ID="labelProductName" runat="server" Text=""></asp:Label></h3>
                        <p>
                            Hãng: <asp:Label ID="labelProductCategoryName" runat="server" Text=""></asp:Label></p>
						<p style="text-align:justify;"  class="product-description"><asp:Label ID="labelDescription" runat="server" Text=""></asp:Label></p>
						<h4 class="price">Giá: <span><asp:Label ID="labelPrice" runat="server" Text=""></asp:Label></span></h4>
						
						<div class="row ml-1">
                            <asp:Button ID="commandShopping" CssClass="btn btn-primary" OnClick="commandShopping_Click1" runat="server" Text="Mua Hàng" />
                                 <asp:Button ID="commandContinueShopping" runat="server" Cssclass="btn btn-primary ml-1" Text="Tiếp Tục Mua" OnClick="commandContinueShopping_Click" />
                            
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="col-md-12">
                <p style="width:500px;white-space: normal;word-break: break-all"> </p>
            </div>
<div class="col-md-12">
                <p style="width:500px;white-space: normal;word-break: break-all"> </p>
            </div>

    <div class="container" style="text-align:justify;">
        <asp:Label ID="labelDescriptionHTML" runat="server" Text=""></asp:Label>
    </div>
       <%--<script src="Scripts/jquery-1.8.3.min.js"></script>
        <script src="Scripts/jquery.elevateZoom-3.0.8.min.js"></script>
        <script type="text/javascript">
        $(function () {
           
            $("[id*=<%=imageProduct.ClientID %>]").elevateZoom({
                //cursor: 'pointer',
                //imageCrossfade: true,
                //loadingIcon: 'loading.gif'
                zoomType: "lens",

                lensShape: "retangle",

                lensSize: 200
       
            });
        });
    </script>--%>
</asp:Content>

