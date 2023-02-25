<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="RecycleBin.aspx.cs" Inherits="Admin_RecycleBin" %>

<%@ Register Assembly="DelayedSubmit" Namespace="DelayedSubmit" TagPrefix="cc1"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <script type="text/javascript" language="javascript">
        function RecoverConfirmation() {
            return confirm("Bạn có chắc bạn muốn thực hiện thao tác phục hồi");
        }
    </script>
    <script type="text/javascript" language="javascript">
        function SelectAllCheckboxes(chk) {
            var totalRows = $("#<%=gridviewDeletedProduct.ClientID %> tr").length;
            var selected = 0;
            $('#<%=gridviewDeletedProduct.ClientID %>').find("input:checkbox").each(function () {
                if (this != chk) {
                    this.checked = chk.checked;
                    selected += 1;
                }
            });
        }
 
        function CheckedCheckboxes(chk) {
            if (chk.checked) {
                var totalRows = $('#<%=gridviewDeletedProduct.ClientID %> :checkbox').length;
                var checked = $('#<%=gridviewDeletedProduct.ClientID %> :checkbox:checked').length
                if (checked == (totalRows - 1)) {
                    $('#<%=gridviewDeletedProduct.ClientID %>').find("input:checkbox").each(function () {
                        this.checked = true;
                    });
                }
                else {
                    $('#<%=gridviewDeletedProduct.ClientID %>').find('input:checkbox:first').removeAttr('checked');
                }
            }
            else {
                $('#<%=gridviewDeletedProduct.ClientID %>').find('input:checkbox:first').removeAttr('checked');
            }
        }       
    </script>
    <style type="text/css">
        .UsersGridViewButton
        {
          
            color:black;
            text-decoration:underline;
            
        }
        .UsersGridViewButton:hover {
            color:blue;    
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
    border:none;
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
        <div class="form-group row">
           
             <asp:TextBox ID="txtSearch" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" runat="server" CssClass="form-control col-lg-3 ml-3"></asp:TextBox>&nbsp; 
            <asp:Button ID="btnTim" runat="server" Text='Tìm' CssClass="btn btn-primary"
                CausesValidation="false" onclick="btnTim_Click" /> &nbsp; 
            <asp:Button ID="btnRecover" runat="server" Text="Phục Hồi" CssClass="btn btn-primary" CausesValidation="false"
                  OnClick="btnRecover_Click" 
                  OnClientClick="return RecoverConfirmation();"/>&nbsp; 
        </div>
        <div class="col-md-12">
                <p style="width:200px;white-space: normal;word-break: break-all"></p>
            </div>

              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>

                      
                       
                      
                      
                      <asp:GridView ID="gridviewDeletedProduct" AutoGenerateColumns="false" runat="server"
        onpageindexchanging="gridviewDeletedProduct_PageIndexChanging" 
                   OnSelectedIndexChanged="gridviewDeletedProduct_SelectedIndexChanged"
        OnRowDeleting="gridviewDeletedProduct_RowDeleting"
        AllowPaging="true"
        PageSize="3"

        datakeynames="ProductID"
        CssClass="table table-bordered table-condensed">
         <Columns>
            <asp:TemplateField>
               <HeaderTemplate>                   
                    <center> <asp:CheckBox ID="chkCheckAll" runat="server" onclick="javascript:SelectAllCheckboxes(this)" /> </center>
            </HeaderTemplate>
                <ItemTemplate>
                <center><asp:CheckBox ID="chkSelect" runat="server" /> </center>
             </ItemTemplate>
           </asp:TemplateField>    
                
            <asp:TemplateField>
                      
                    <HeaderTemplate>
                                <center>Tên Sản Phẩm</center>
                            </HeaderTemplate>   
                  <ItemTemplate>     
                        <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>  '></asp:Label>
                                           
                                                                
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <center>Giá</center>
                    </HeaderTemplate>   
                    <ItemTemplate>                                                       
                            <%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("Price") )%>                                        
                    </ItemTemplate>
              </asp:TemplateField>
             <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <center>ĐVT</center>
                    </HeaderTemplate>   
                    <ItemTemplate>                                                       
                            <%# Eval("ProductUnitName" )%>                                        
                    </ItemTemplate>
              </asp:TemplateField>
                                                                 
              
               
             <asp:CommandField ButtonType="Image" HeaderText="Tác Vụ" 
            ShowSelectButton="True" 
            SelectImageUrl="../Admin/Images/restore-icon-png-10.png" ControlStyle-Width="20" 
            ControlStyle-Height="20"
                 HeaderStyle-CssClass="text-center" >      
        
                   <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center"/>
        </asp:CommandField>                         
                   
                            
                       
         </Columns>
        <PagerStyle HorizontalAlign = "Left" CssClass = "pagination-ys" />
                    <HeaderStyle BackColor="#f4f8fb" />

    </asp:GridView>
                    
               </ContentTemplate>
                  <Triggers>
                      <asp:AsyncPostBackTrigger ControlID="txtSearch" />
                  </Triggers>
              </asp:UpdatePanel>
    
              
    </div>
       
</asp:Content>

