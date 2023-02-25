<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CustomerOrderDetails.aspx.cs" Inherits="CustomerOrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <style type="text/css">
         @media (min-width: 375px) and (max-width: 576px) {
          .container {
              width: 100%;
              padding-right: 2px;
              padding-left: 2px;
              margin-right: auto;
              margin-left: auto;
            }
            
        }
        @media (min-width: 576px) and (max-width: 768px) {
            
                
        }
        @media (min-width: 768px) and (max-width: 991.98px) {
               .auto-style1 {
                height: 13px;
                width: 207px;
            }
            .auto-style2 {
                height: 19px;
                width: 207px;
            }
            .auto-style3 {
                width: 207px;
            }
            .auto-style4 {
                height: 16px;
                width: 207px;
            }
             
         }
       
        @media (min-width: 992px) and (max-width: 1199px) {
                     
           
        }

        @media (min-width: 1200px) {
            
            
            
        }
       a:hover {
            color:blue;
         }
           
   
        
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <div class="container">
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
        <tr>
            <td class="auto-style1"></td>
            <td style="width: 10px; height:13px;"></td>
        </tr>
        <tr>
            <td class="auto-style1">Hóa Đơn ID:</td>
            <td style="width:10px; height:13px;">
               <strong><asp:Label ID="labelOrderID" runat="server" Text="">
                </asp:Label> </strong> 
            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td style="width: 100px; height: 19px"></td>
        </tr>
        <tr>
            <td class="auto-style3">Hàng Hóa Đã Mua:</td>
            <td style="width:82%">
                <asp:GridView ID="gridviewOrderDetailsProducts"
                    runat="server" AutoGenerateColumns="false"
                    Width="100%">
                    <Columns>
                       
                        <asp:TemplateField ItemStyle-Width="40%"
                                ItemStyle-HorizontalAlign="left">
                            <HeaderTemplate>
                                <center>
                                    Sản Phẩm
                                </center>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("ProductName") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Giá" ItemStyle-Width="10%"
                                ItemStyle-HorizontalAlign="center">
                            <HeaderTemplate>
                                <center>
                                    Giá
                                </center>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval( "Price" , "{0:#,##0}" )%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="Số Lượng" ItemStyle-HorizontalAlign="center" >
                             <HeaderTemplate>
                                <center>
                                    Số Lượng
                                </center>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("Quantity") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Đơn Vị Tính" ItemStyle-HorizontalAlign="center" >
                            <HeaderTemplate>
                                <center>
                                    Đơn Vị Tính
                                </center>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%# Eval("ProductUnitName") %>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField ItemStyle-Width="15%"
                                ItemStyle-HorizontalAlign="center">
                            <HeaderTemplate>
                                <center>
                                    Tổng Phụ
                                </center>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelTotalPrice" runat="server" Text='<%# Eval( "SubTotal" , "{0:#,##0}" )%>'></asp:Label>                
             
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="19%"></ItemStyle>
                        </asp:TemplateField>
                        
                    </Columns>
                 
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td style="width: 100px; height: 19px"></td>
        </tr>
        <tr>
            <td class="auto-style4">Tổng Cộng:</td>
            <td style="width: 100px; height: 16px;">
               <strong> <asp:Label ID="labelOrderTotal" runat="server">
                </asp:Label></strong></td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td style="width: 100px; height: 19px"></td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td style="width: 100px">
                <asp:Button ID="commandReturn" runat="server"
                    Text="Return"
                    CssClass="btn btn-primary"  OnClick="commandReturn_Click" />
            </td>
        </tr>
    </table>
    </div>
</asp:Content>

