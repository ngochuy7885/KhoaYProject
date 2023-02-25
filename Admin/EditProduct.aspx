<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="EditProduct.aspx.cs" Inherits="Admin_EditProduct" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/SweetAlert/sweetalert2.css" rel="stylesheet" />
    <script src="CSS/SweetAlert/bluebird.min.js"></script>
   
    <script src="CSS/bootstrap-4.0.0-dist/js/jquery.min.js"></script>
  
    <script src="CSS/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
    <script src="CSS/SweetAlert/sweetalert2.min.js"></script>

    <style type="text/css">
        .mlproductname {
            margin-left: 1.7rem;
        }
        .mlquotationname {
            margin-left: 2.8rem;
        }

        .mldropdownlistCateogry-5 {
            margin-left: 6.2rem !important;
        }
        .mldropdownlistUnit-5{
    margin-left: 2.8rem !important;
        }
        .mlMota-5{
    margin-left: 4.5rem !important;
        }
         .mlMotaHTML-5{
    margin-left: 1.2rem !important;
        }
          .mlPrice-5{
    margin-left: 6.4rem !important;
        }
          .pl-file
        {
            padding-left: 8rem !important;
        }
          .ml-image
         {
            margin-left: 3.5rem !important;
        }
        .ml-button {
            margin-left:8rem;
        }
        .ml-location {
            margin-left:5.8rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
           
    <div class="container">
        <%--asp:Panel ID="Panel1" runat="server" DefaultButton="commandUpdate">--%>
          <div class="form-group form-inline">
               <asp:HiddenField ID="hdID" runat="server" />
                           
                        <label for="ProductName">Tên Sản Phẩm: </label>
                        <asp:TextBox ID="textProductName" CssClass="form-control mlproductname" Columns="50" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requireName" runat="server"
                            ErrorMessage=" Vui lòng nhập tên sản phẩm"
                            ControlToValidate="textProductName" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False"  Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                    </div>
         <div class="form-group form-inline">
                <label for="ProductName">Tìm Sản Phẩm: </label>
                <asp:TextBox ID="textSearchName" CssClass="form-control mlproductname " Columns="50" runat="server"></asp:TextBox>             

            </div>
        <div class="form-group form-inline">
                <label for="ProductName">Tên Báo Giá: </label>
                <asp:TextBox ID="TextQuotationName" CssClass="form-control mlquotationname" Columns="50" runat="server"></asp:TextBox>             

            </div>
            <div class="form-group form-inline">
                        <label for="Description">Loại: </label>
                        <asp:DropDownList ID="dropdownlistCategory" CssClass="form-control mldropdownlistCateogry-5" runat="server"></asp:DropDownList>                       
            </div>
            <div class="form-group form-inline">
                        <label for="Description">Đơn Vị Tính: </label>
                        <asp:DropDownList ID="dropdownlistUnit" CssClass="form-control mldropdownlistUnit-5" runat="server"></asp:DropDownList>                       
            </div>
            <div class="form-group form-inline">
                        <label for="Description">Mô tả: </label>

                      <%--  <asp:TextBox ID="textDescription" runat="server"
                            TextMode="MultiLine" Rows="5" Columns="30" CssClass="form-control mlMota-5"></asp:TextBox>

                    --%>
                 <div class="col-md-9 mlMota-5">
               
                    <asp:TextBox runat="server"
                            ID="textDescription"
                            TextMode="MultiLine"                       
                            Columns="50"
                            Rows="10" />

                        <asp:HtmlEditorExtender
                            ID="htmlEditorExtender2"
                            TargetControlID="textDescription"
                            DisplaySourceTab="true"
                            EnableSanitization="false"                        
                            runat="server">
                        </asp:HtmlEditorExtender>
                
                    </div>
            </div>
                   <%-- <div class="form-group form-inline">
                        <label for="DescriptionHTML">Mô Tả HTML: </label>
                        <div class="col-md-9 mlMotaHTML-5">
                            <CKEditor:CKEditorControl ID="textDescriptionHTML" CssClass="form-control "  runat="server" BasePath="ckeditor/"
                                Toolbar="Source
                    Bold|Italic|Underline|Strike|-|Subscript|Superscript
                    NumberedList|BulletedList|-|Outdent|Indent
                    /
                    Styles|Format|Font|FontSize|TextColor|BGColor|-|About">
                            </CKEditor:CKEditorControl>
                        </div>
                    </div>--%>
                    
                     <div class="form-group form-inline">
                        <label for="DescriptionHTML">Mô Tả HTML: </label>
                        <div class="col-md-9 mlMotaHTML-5">
                           <asp:TextBox runat="server"
                                    ID="textDescriptionHTMLEditor" 
                                    TextMode="MultiLine" 
                                    Columns="50" 
                                    Rows="10" 
                                     />
    
                                <asp:HtmlEditorExtender 
                                    ID="htmlEditorExtender1" 
                                    TargetControlID="textDescriptionHTMLEditor"
                                    DisplaySourceTab="true" 
                                    EnableSanitization="false"
                                    runat="server" >            
                                </asp:HtmlEditorExtender>
                        </div>
                    </div>
                       <div class="form-group form-inline">
                        <label for="ProductPrice">Giá: </label>
                        <asp:TextBox ID="textPrice" CssClass="form-control mlPrice-5" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequirePrice" runat="server"
                            ErrorMessage=" Vui lòng nhập giá sản phẩm"
                            ControlToValidate="textPrice" Display="Dynamic" CssClass="pl-2"
                            EnableClientScript="False" Width="300px" Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                           <asp:CustomValidator ID="customValidatorProductPrice" runat="server" CssClass="pl-2" 
                            ErrorMessage=" Vui Lòng Nhập Lại Giá" ControlToValidate="textPrice"
                            OnServerValidate="customValidatorProductPrice_ServerValidate"
                            ValidateEmptyText="True" Font-Bold="True" ForeColor="#CC3300"></asp:CustomValidator>
                    </div>         
          
                    <div class="form-group form-inline">
                        <label for="location">Vị trị: </label>

                        <asp:TextBox ID="textLocation" runat="server"
                                CssClass="form-control ml-location" Columns="50"></asp:TextBox>
                    
                    </div>  

           <div class="form-group form-inline">
                        <label for="ProductImage">Hình Ảnh: </label>

                        <asp:Image ID="imageProductDetail" runat="server" CssClass="img-fluid ml-image" Height="100px" Width="120px"
                            ImageUrl="~/images/wiki.png" />
                        <asp:FileUpload ID="fileuploadProductImage" CssClass="form-control-file pl-file" runat="server" onchange="showPreviewOne(event);"
                            ToolTip="Lựa Chọn Hình Ảnh" />
                      

                    </div>
           <div class="form-group ml-button">

                <asp:Button ID="commandUpdate" runat="server" CssClass="btn btn-primary" OnClick="commandUpdate_Click" Text="Cập Nhật" />
                <asp:Button ID="commandDelete" runat="server" Text="Xóa" CssClass="btn btn-primary" />
                       
               <asp:Button ID="commandCancel" CssClass="btn btn-primary" runat="server" Text="Hủy" CausesValidation="false" OnClick="commandCancel_Click" />
            
           </div>
     <%--</asp:Panel>--%>     
     </div>
        
     
     <script>

        function showPreviewOne(event) {

            if (event.target.files.length > 0) {
                let src = URL.createObjectURL(event.target.files[0]);
                let preview = document.getElementById('<%= imageProductDetail.ClientID %>')
                preview.src = src;
                preview.style.display = "block";
            }
        }
    </script>
                </ContentTemplate>
            <Triggers>
                 <asp:PostBackTrigger ControlID="commandUpdate" />

                <asp:PostBackTrigger ControlID="commandCancel" />
            </Triggers>
        </asp:UpdatePanel>

    <%--Delete Action Button--%>
    <script type="text/javascript">
        $(function () {
            $("[id*=commandDelete]").on("click", function () {

                //var id = $(this).closest('tr').find('[id*=hdID]').val();
                var id = document.getElementById('<%= hdID.ClientID %>').value;
                var isdelete = document.getElementById('<%= commandDelete.ClientID %>').value;
                if (isdelete == "Xóa") {
                        swal({
                            title: 'Bạn Muốn Xóa Bỏ?',
                            text: "Bạn Có Thể Phục Hồi Được Nó!",
                            type: 'success',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Thực Hiện',
                            cancelButtonText: 'Không',
                            confirmButtonClass: 'btn btn-success',
                            cancelButtonClass: 'btn btn-danger',

                        }).then(function (result) {
                            if (result) {
                                $.ajax({
                                    type: "POST",
                                    url: "../Admin/EditProduct.aspx/DeleteClick",
                                    data: "{id:" + id + "}",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (r) {
                                        if (r.d == "Deleted") {
                                            //window.location.href = window.location.href;
                                            //location.reload();
                                            window.location.href = "Products.aspx";

                                        }
                                        else {
                                            swal("Dữ Liệu Không Được Xóa", "Thất Bại", "success");
                                        }
                                    }
                                });
                            }
                        },
                    function (dismiss) {
                        if (dismiss == 'cancel') {
                            //swal('Đã Hủy', 'Không Có Dữ Liệu Nào Được Xóa', 'error');
                            swal({
                                title: 'Đã Hủy',
                                text: "Không Có Dữ Liệu Nào Được Xóa!",
                                type: 'error',
                                confirmButtonColor: '#3085d6',
                                confirmButtonText: 'Thực Hiện',
                                confirmButtonClass: 'btn btn-success',

                            })
                        }
                    });
                        return false;
                }
                swal({
                    title: 'Bạn Muốn Phục Hồi?',
                    text: "Bạn Có Thể Phục Hồi Được Nó!",
                    type: 'success',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Thực Hiện',
                    cancelButtonText: 'Không',
                    confirmButtonClass: 'btn btn-success',
                    cancelButtonClass: 'btn btn-danger',

                }).then(function (result) {
                    if (result) {
                        $.ajax({
                            type: "POST",
                            url: "../Admin/EditProduct.aspx/DeleteClick",
                            data: "{id:" + id + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (r) {
                                if (r.d == "Deleted") {
                                    //window.location.href = window.location.href;
                                    //location.reload();
                                    window.location.href = "Products.aspx";

                                }
                                else {
                                    //swal("Dữ Liệu Không Được Phục Hồi", "Thất Bại", "success");
                                    swal({
                                        title: 'Dữ Liệu Không Được Phục Hồi?',
                                        text: "Thất Bại!",
                                        type: 'success',
                                        
                                        confirmButtonColor: '#3085d6',
                                        confirmButtonText: 'Thực Hiện',
                                        confirmButtonClass: 'btn btn-success',
                                        
                                    })
                                }
                            }
                        });
                    }
                },
                function (dismiss) {
                    if (dismiss == 'cancel') {
                        //swal('Đã Hủy', 'Không Có Dữ Liệu Nào Được Phục Hồi', 'error');
                        swal({
                            title: 'Đã Hủy',
                            text: "Không Có Dữ Liệu Nào Được Phục Hồi!",
                            type: 'error',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'Thực Hiện',
                            confirmButtonClass: 'btn btn-success',

                        })
                    }
                });
                return false;
            });
        });
    </script>
    <%--End Delete Button Action--%>
</asp:Content>

