<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="OrdersSearch.aspx.cs" Inherits="Admin_OrdersSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
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
     <table border="1" cellpadding="0" cellspacing="0" style="width:100%" >
      
        <tr>
            <td>
                <asp:GridView ID="gridviewOrder" runat="server"
                    AllowPaging="True"            
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
                                <%# Eval("OrderDate") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Trạng Thái">
                            <ItemTemplate>
                                <%# Eval("OrderStatusName") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    
                    <PagerStyle HorizontalAlign = "Left" CssClass = "pagination-ys" />
                </asp:GridView>
            </td>
        </tr>
    </table>
   </asp:Panel> 
    
    <br />
    <br />
</asp:Content>

