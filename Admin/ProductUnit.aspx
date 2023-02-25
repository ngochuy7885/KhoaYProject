<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ProductUnit.aspx.cs" Inherits="Admin_ProductUnit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
        .ml-button,
        .mx-5 {
            margin-left: 4.3rem !important;
        }
        .ml-buttonupdate {
            margin-left:4.3rem;
        }
         .modalBackground {
             height: 100%;
            background-color: #EBEBEB;
            filter: alpha(opacity=70);
            opacity: 0.7;
            Position:relative;
            Margin-left:auto;
            Margin-right:auto;
        }
      
    /* Important part */
    .modal-dialog{
        overflow-y: initial !important
    }
    
        .modal-content {
         height: 210px;
            width:410px;
            
        }
        .modal-body{
            height: 200px;
            width:410px;
            overflow-y: auto;
            position:relative;
            top:0px;
        }
        .modalpopup {
    position: fixed;
    transform: translate(-50%, -50%);
    
}
    </style>
    <style type="text/css">
        .pagination-ys {
    /*display: inline-block;*/
    padding-left: 0;
    margin: 20px 0;
    border-radius: 4px;
}

.pagination-ys table > tbody > tr > td {
    display: inline;
}

.pagination-ys table > tbody > tr > td > a,
.pagination-ys table > tbody > tr > td > span {
    position: relative;
    float: left;
    padding: 8px 12px;
    line-height: 1.42857143;
    text-decoration: none;
    color: blue;
    background-color: #ffffff;
    border: 1px solid #dddddd;
    margin-left: -1px;
}

.pagination-ys table > tbody > tr > td > span {
    position: relative;
    float: left;
    padding: 8px 12px;
    line-height: 1.42857143;
    text-decoration: none;    
    margin-left: -1px;
    z-index: 2;
    color: blue;
    background-color: #f5f5f5;
    border-color: #dddddd;
    cursor: default;
}

.pagination-ys table > tbody > tr > td:first-child > a,
.pagination-ys table > tbody > tr > td:first-child > span {
    margin-left: 0;
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px;
}

.pagination-ys table > tbody > tr > td:last-child > a,
.pagination-ys table > tbody > tr > td:last-child > span {
    border-bottom-right-radius: 4px;
    border-top-right-radius: 4px;
}

.pagination-ys table > tbody > tr > td > a:hover,
.pagination-ys table > tbody > tr > td > span:hover,
.pagination-ys table > tbody > tr > td > a:focus,
.pagination-ys table > tbody > tr > td > span:focus {
    color: blue;
    background-color: #eeeeee;
    border-color: #dddddd;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    
     <div class="container">
        <asp:GridView ID="gridviewProductUnit"               
                DataKeyNames="ProductUnitId" 
                OnRowDataBound="gridviewProductUnit_RowDataBound"
                OnSelectedIndexChanged="gridviewProductUnit_SelectedIndexChanged"
                OnRowDeleting="gridviewProductUnit_RowDeleting"
                CellPadding="4" ForeColor="blue" 
                AllowPaging="true"
                PageSize="9"
                OnPageIndexChanging="gridviewProductUnit_PageIndexChanging"                    
                GridLines="Both" 
                runat="server" 
                
                AutoGenerateColumns="false">
            
                <Columns>
                    <asp:TemplateField  ItemStyle-HorizontalAlign="center">
                        <HeaderTemplate>
                            <center>
                                  Mã Đơn Vị Tính
                            </center>
                          
                        </HeaderTemplate>
                        <ItemTemplate >
                            <asp:Label ID="lblProductUnitID" runat="server" Text='<%#Eval("ProductUnitID")%>'></asp:Label>                       
                        </ItemTemplate>
                    </asp:TemplateField>  
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <center>
                                 Tên Đơn Vị Tính
                            </center>
                           
                        </HeaderTemplate>
                        <ItemTemplate>
                            <center><asp:Label ID="lblProductUnitName" runat="server" Text='<%#Eval("ProductUnitName")%>'></asp:Label>   </center>                    
                        </ItemTemplate>
                    </asp:TemplateField>                  
                        
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <center>
                                    Thêm
                        
                            </center>
                        </HeaderTemplate>
                                <ItemTemplate >
                                    <asp:LinkButton ID="LinkbtnInsert" OnClick="LinkbtnInsert_Click" runat="server"><img src="../Images/InsertIcon.png" width="20" height="20" /></asp:LinkButton>
                                    <%--<a href="ProductDetails.aspx?ProductID=<%# Eval("ProductID")%>">
                                        <%# Eval("ProductCategoryID") %></a>--%>
                                </ItemTemplate>
                                
                            </asp:TemplateField>

                    
                            <asp:CommandField ButtonType="Image" HeaderText="Cập Nhật"
                            SelectText="Cập Nhật" ShowSelectButton="True" HeaderStyle-CssClass="text-center"
                            SelectImageUrl="~/images/edit_icon.jpg" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" ControlStyle-Width="20"
                            ControlStyle-Height="20">
                            <ControlStyle Height="20px" Width="20px"></ControlStyle>
                        </asp:CommandField>
                         
                        
                   
                <%--   <asp:CommandField ShowDeleteButton="True" HeaderText="Xóa" 
                       ItemStyle-HorizontalAlign="Center"                
                       controlStyle-Width="20" 
                        ControlStyle-Height="20"
                        DeleteImageUrl="~/Images/del.gif" ButtonType="Image"
                         
                        CausesValidation="false" >     
                        <ControlStyle Height="20px" Width="20px"></ControlStyle>
                    </asp:CommandField>--%>
                       
                </Columns>
                     
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#F9F9F9" Font-Bold="True" ForeColor="black" />
            <PagerStyle HorizontalAlign = "Left" CssClass = "pagination-ys" />
            <RowStyle BackColor="White" ForeColor="black" />
             <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />

            
            </asp:GridView>

           <div class="col-md-12">
                <p style="width:500px;white-space: normal;word-break: break-all"> </p>
            </div>
        
           <asp:LinkButton ID="LinkbtnInsertTemp" runat="server"></asp:LinkButton>
            <asp:ModalPopupExtender ID="ModalPopupExtenderInsert"
                X="100" 
                Y="100"
                BackgroundCssClass="modalBackground"              
                TargetControlID="LinkbtnInsertTemp"
                CancelControlID="btnClose"
                PopupControlID="PanelInsert"
                PopupDragHandleControlID="PanelInsert"                           
                runat="server">
            </asp:ModalPopupExtender>
          <asp:Panel ID="PanelInsert" CssClass="modalpopup"  DefaultButton="btnInsertAdd" runat="server">
                <div class="modal-dialog" id="ModalInsert" role="document">
                    <div class="modal-content" >
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel2">Thêm Đơn Vị Tính</h5>
                        </div>
                        <div class="modal-body">
                            <asp:ValidationSummary  ForeColor="Red" CssClass="ml-validation"
                              id="ValidationSummaryInsert" 
                                ValidationGroup="GrpInsert"
                              DisplayMode="BulletList" 
                              runat="server"
                              HeaderText="Lỗi Của Trang:"
                              Font-Names="verdana" 
                              Font-Size="12"/>
                            <div class="form-group form-inline">
                                 
                                <label for="CategoryName">Tên Đơn Vị Tính: </label>

                                <asp:TextBox ID="textProductUnitName" ValidationGroup="GrpInsert" CssClass="form-control ml-4" runat="server"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage=" Vui lòng nhập Đơn Vị Tính"
                                    ValidationGroup="GrpInsert"
                                    ControlToValidate="textProductUnitName" Display="Dynamic" CssClass="pl-2"
                                    EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>

                            </div>                                            

                            <div class="form-group ml-button">    
                                  <asp:Button ID="btnInsertAdd" runat="server" CssClass="btn btn-primary ml-button" ValidationGroup="GrpInsert" Text="Insert" OnClick="btnInsertAdd_Click" />                                  
                                <asp:Button ID="btnClose" CssClass="btn btn-primary" runat="server" Text="Cancel" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                    
                </div>
            </asp:Panel>   
         
         <div class="col-md-12">
                <p style="width:500px;white-space: normal;word-break: break-all"> </p>
            </div>

         <asp:LinkButton ID="Linkbtn" runat="server"></asp:LinkButton>
            <asp:ModalPopupExtender ID="ModalPopupExtenderUpdate"
               X="100" 
                Y="100"
                BackgroundCssClass="modalBackground"
                TargetControlID="Linkbtn"
                CancelControlID="btnCancel"
                PopupControlID="PanelUpdate"
                PopupDragHandleControlID="PanelUpdate"
                runat="server">
            </asp:ModalPopupExtender>

            <asp:Panel ID="PanelUpdate" CssClass="modalpopup"  DefaultButton="btnUpdate" runat="server">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">Cập Nhật Đơn Vị Tính</h5>
                        </div>
                        <div class="modal-body">
                            <asp:ValidationSummary  ForeColor="Red" CssClass="ml-validation"
                              id="ValidationSummaryUpdate" 
                                ValidationGroup="GrpUpdate"
                              DisplayMode="BulletList" 
                              runat="server"
                              HeaderText="Lỗi Của Trang:"
                              Font-Names="verdana" 
                              Font-Size="12"/>
                            <div class="form-group form-inline">
                                <label for="CategoryName">Tên Đơn Vị Tính: </label>
                                 <asp:TextBox ID="textProductUnitNameUpdate" TabIndex="3" CssClass="form-control ml-4" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requireName" runat="server"
                                     ValidationGroup="GrpUpdate"
                                    ErrorMessage=" Vui lòng nhập tên Đơn Vị Tính"
                                    ControlToValidate="textProductUnitNameUpdate" Display="Dynamic" CssClass="pl-2"
                                    EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>

                            </div>
                           
                            <div class="form-group ml-button">    
                                <asp:Button ID="btnUpdate" ValidationGroup="GrpUpdate"  CssClass="btn btn-primary ml-buttonupdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-primary" runat="server" Text="Cancel" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                    
                </div>
            </asp:Panel>


        </div>
   
</asp:Content>

