<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CustomerOrders.aspx.cs" Inherits="CustomerOrders" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        .tablecus {
            border-collapse: collapse;
            font-size:16px;
            margin-left: 0px;
        }
       
        a:hover {
            color:blue;
        }
        .link{
            color:blue;
            font-weight: bold;
            text-decoration:underline;
        }
        .link:hover {
            text-decoration:underline;
        }

    </style>

    <style type="text/css">
        .pagination-ys {
    /*display: inline-block;*/
    padding-left: 0;
    margin: 20px 0;
    border-radius: 4px;
    width:100px;
    
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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <strong>Hóa Đơn Của <asp:Label ID="labelName" runat="server" Text="Label"></asp:Label></strong></td>
        </tr>
        <tr>
            <td >&nbsp;</td>
        </tr>
        <tr>
            <td>
                 
                <asp:GridView ID="gridviewOrders" runat="server"
                    AutoGenerateColumns="False" Width ="100%" 
                     OnRowDataBound="gridviewOrders_RowDataBound"                   
                     OnSelectedIndexChanged="gridviewOrders_SelectedIndexChanged"
                    
                    AllowPaging="True"
                     OnPageIndexChanging="gridviewOrders_PageIndexChanging" 
                    CssClass="tablecus table-bordered table-condensed"
                    DataKeyNames="OrderId">
                    <Columns>
                       

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <HeaderTemplate>
                                <center>Hóa Đơn ID</center>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <a class="link" href="CustomerOrderDetails.aspx?TransID=
<%# Eval("TransactionID") %>&OrderID=<%# Eval("OrderID") %>">
                                    <%# Eval("OrderID") %></a>
                            </ItemTemplate>


<ItemStyle HorizontalAlign="Center"></ItemStyle>


                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ngày Đặt Hàng">
                            <ItemTemplate>
                                <%--<%# Eval("OrderDate","{0:dd/MM/yyyy HH:mm:ss}") %> <%--tt AM or PM--%>
                                <%# Eval("OrderDate","{0:dd/MM/yyyy}") %> <%--tt AM or PM--%>
                                
                                <%--<%# Eval("OrderDate","{0:g}") %>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Trạng Thái">
                            <ItemTemplate>
                                <%# Eval("OrderStatusName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ngày Giao Hàng">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("ShipDate","{0:dd/MM/yyyy}").ToString() == "01/01/1900" ? "" : Eval("ShipDate", "{0:dd/MM/yyyy}") %>'
                                runat="server" />
                              <%-- <%# Eval("ShipDate", "{0:dd/MM/yyyy}") %>--%>
                                <%--<%# Eval("ShipDate", "{0:dd/MM/yyyy HH:mm:ss}") %>--%>
                                <%--<%# Eval("ShipDate", "{0:g}") %>--%>
                               
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Số Xe">
                            <ItemTemplate>
                                <%# Eval( "TrackingNumber" )%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                   
                    <PagerSettings PageButtonCount="5" />
                   
                    <PagerStyle CssClass = "pagination-ys" />
                  
                    
                   
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#f4f8fb" Font-Bold="True" ForeColor="black" Height="50px" HorizontalAlign="Left"  />          
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
             
            </td>
        </tr>
    </table>
        </div>
  
</asp:Content>

