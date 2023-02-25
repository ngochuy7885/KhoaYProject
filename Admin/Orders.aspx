<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Admin_Orders" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
        .link{
            color:blue;
            font-weight: bold;
            text-decoration:underline;
        }
            .link:hover {
                text-decoration:underline;
                color:blue;
            }
     
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
    <style>
      


</style>
   <%-- CSS for gridview--%>
    <style type="text/css">
    
     .table td {
         vertical-align:middle;
        }
  
  
</style>
    <%-- End CSS for gridview--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%" >
        <tr>
            <td><strong>Tất Cả Các Hóa Đơn</strong></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gridviewAllOrders" runat="server"
                    AllowPaging="True" 
                   PageSize="5"
                    DataKeyNames="OrderId,Email"
                   onpageindexchanging="gridviewAllOrders_PageIndexChanging" 
                   OnSelectedIndexChanged="gridviewAllOrders_SelectedIndexChanged"
                   Width="100%"
                    CssClass="table table-bordered table-condensed"
                    OnRowDataBound="gridviewAllOrders_RowDataBound"
                    ItemStyle-VerticalAlign="Top"                  
                    AutoGenerateColumns="false">
                    
                    <Columns>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Hóa Đơn ID">
                            <ItemTemplate>
                             
                                <a class="link" href="OrderDetails.aspx?Email=<%# Eval("Email") %>&TransID=<%# Eval("TransactionID") %>&OrderID=
<%# Eval("OrderID") %>">
                                    <%# Eval("OrderID") %> 

                                </a>
                               
                            </ItemTemplate>
                            <ItemStyle CssClass="mystyle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên">
                            <ItemTemplate>
                                <%# Eval("FirstName") %> <%# Eval("LastName") %><br />
                                <%# Eval("AddressLine") %> <%# Eval("AddressLine2") %><br />
                                <%# Eval("City") %>, <%# Eval("State") %>,
                                <%# Eval("PostalCode") %> <br />
                                <%# Eval("Email") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <%-- <asp:TemplateField HeaderText="Email">
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
                               <%-- <%# Eval("OrderDate", "{0:dd/MM/yyyy HH:mm:ss}") %>--%>
                                 <%# Eval("OrderDate", "{0:dd/MM/yyyy}") %>
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
    <br />
    <br />
</asp:Content>

