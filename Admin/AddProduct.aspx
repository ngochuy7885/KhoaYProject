<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="Admin_AddProduct" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

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

        .mldropdownlistUnit-5 {
            margin-left:2.8rem !important;
        }

        .mlMota-5 {
            margin-left: 4.5rem !important;
        }

        .mlMotaHTML-5 {
            margin-left: 1.2rem !important;
        }

        .mlPrice-5 {
            margin-left: 6.4rem !important;
        }

        .pl-file {
            padding-left: 8rem !important;
        }

        .ml-image {
            margin-left: 3.5rem !important;
        }

        .ml-button {
            margin-left: 8rem;
        }

        .ml-location {
            margin-left: 5.8rem;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
         
            

    <div class="container">
        <asp:Panel ID="Panel1" runat="server">
            <div class="form-group form-inline">
                <label for="ProductName">Tên Sản Phẩm: </label>
                <asp:TextBox ID="textProductName" CssClass="form-control mlproductname " Columns="40" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="requireName" runat="server"
                    ErrorMessage=" Vui lòng nhập tên sản phẩm"
                    ControlToValidate="textProductName" Display="Dynamic" CssClass="pl-3"
                    EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                 <asp:CustomValidator ID="customValidatorProductName" runat="server" CssClass="form-group pl-3"
                            ErrorMessage=" Vui Lòng Nhập Tên Khác" ControlToValidate="textProductName"
                            OnServerValidate="customValidatorProductName_ServerValidate"
                            ValidateEmptyText="True" Font-Bold="True" ForeColor="#CC3300"></asp:CustomValidator> 
                        

            </div>
         <div class="form-group form-inline">
                <label for="ProductName">Tìm Sản Phẩm: </label>
                <asp:TextBox ID="textSearchName" CssClass="form-control mlproductname " Columns="40" runat="server"></asp:TextBox>
             
            </div>
        <div class="form-group form-inline">
                <label for="ProductName">Tên Báo Giá: </label>
                <asp:TextBox ID="textQuotationName" CssClass="form-control mlquotationname " Columns="40" runat="server"></asp:TextBox>
            
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

                <%--<asp:TextBox ID="textDescription" runat="server"
                    TextMode="MultiLine" Rows="5" Columns="30" CssClass="form-control mlMota-5"></asp:TextBox>--%>
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

            <%--<div class="form-group form-inline">
                        <label for="DescriptionHTML">Mô Tả HTML: </label>
                        <div class="col-md-9 mlMotaHTML-5">
                            <CKEditor:CKEditorControl ID="textDescriptionHTML" CssClass="form-control "  runat="server" BasePath="ckeditor/"
                                Toolbar="Source
                    Bold|Italic|Underline|Strike|-|Subscript|Superscript
                    NumberedList|BulletedList|-|Outdent|Indent
                    /
                    Styles|Format|Font|FontSize|TextColor|BGColor|-|About">
                            </CKEditor:CKEditorControl>
                        </div>--%>
   
            <div class="form-group form-inline">
                <label for="DescriptionHTML">Mô Tả HTML: </label>
                <div class="col-md-9 mlMotaHTML-5">
                    <asp:TextBox runat="server"
                        ID="textDescriptionHTMLEditor"
                        TextMode="MultiLine"
                        Columns="50"
                        Rows="10" />

                    <asp:HtmlEditorExtender
                        ID="htmlEditorExtender1"
                        TargetControlID="textDescriptionHTMLEditor"
                        DisplaySourceTab="true"
                        EnableSanitization="false"
                        runat="server">
                    </asp:HtmlEditorExtender>
                </div>
            </div>
            <div class="form-group form-inline">
                <label for="ProductPrice">Giá: </label>
                <asp:TextBox ID="textPrice" CssClass="form-control mlPrice-5" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequirePrice" runat="server"
                    ErrorMessage=" Vui lòng nhập giá sản phẩm"
                    ControlToValidate="textPrice" Display="Dynamic" CssClass="pl-2"
                    EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
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

                <asp:Image ID="imgProduct" runat="server" CssClass="img-fluid ml-image" Height="100px" Width="120px"
                    ImageUrl="~/images/wiki.png" />
                <asp:FileUpload ID="fileuploadImage" CssClass="form-control-file pl-file" runat="server" onchange="showPreviewOne(event);"
                    ToolTip="Lựa Chọn Hình Ảnh" />


            </div>
            <div class="form-group ml-button">

                <asp:Button ID="commandAdd" runat="server" CssClass="btn btn-primary" OnClick="commandAdd_Click" Text="Thêm" />
                <asp:Button ID="commandCancel" CssClass="btn btn-primary" runat="server" Text="Hủy" CausesValidation="false" OnClick="commandCancel_Click" />
            </div>
  </asp:Panel>
   </div>
           
   


    <script>

        function showPreviewOne(event) {

            if (event.target.files.length > 0) {
                let src = URL.createObjectURL(event.target.files[0]);
                let preview = document.getElementById('<%= imgProduct.ClientID %>')
                preview.src = src;
                preview.style.display = "block";
            }
        }
    </script>
                    </ContentTemplate>
            <Triggers>
                 <asp:PostBackTrigger ControlID="commandAdd" />
                <asp:PostBackTrigger ControlID="commandCancel" />
            </Triggers>
        </asp:UpdatePanel>

</asp:Content>

