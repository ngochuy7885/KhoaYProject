<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="Admin_OrderDetails" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .pl-3 {
            margin-left: 5px;
        }
     
    
     
        .auto-style1 {
            width: 150px;
        }
     
    
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">

                    <tr>
                        <td class="auto-style1"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="auto-style1" >Hóa Đơn ID:</td>
                        <td>
                            <asp:Label ID="labelOrderID" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="auto-style1" ></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" ></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="auto-style1" >Hàng Đã Mua:</td>
                        <td>
                            <asp:GridView ID="gridviewOrderDetailsProducts" runat="server"
                                AutoGenerateColumns="false" Width="100%">
                                <Columns>

                                    <asp:TemplateField HeaderText="Sản Phẩm">
                                        <ItemTemplate>
                                            <%# Eval("ProductName") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Số Lượng">
                                        <ItemTemplate>
                                            <center> <%# Eval("Quantity") %> </center>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Đơn Vị Tính">
                                        <ItemTemplate>
                                            <center>  <%# Eval("ProductUnitName") %> </center>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  >
                                         <HeaderTemplate>
                                            <center>
                                                Giá
                                            </center>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <center> <%# Eval( "Price" , "{0:#,##0}" )%> </center>
                                        </ItemTemplate>
                                       
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tổng Phụ">
                                        <ItemTemplate>
                                            <center><%# Eval( "SubTotal" , "{0:#,##0}" )%> </center>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" ></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" >Ngày Giao Hàng:</td>
                        <td>
                            <asp:TextBox ID="textShippedDate" runat="server"
                                CssClass="textField">        
                            </asp:TextBox>
                            <asp:ImageButton ID="imagebuttonDatePicker" runat="server"
                                ImageUrl="~/Images/icon-calendar.gif"
                                OnClick="imagebuttonDatePicker_Click"
                                CausesValidation="false" />
                            <asp:Calendar ID="calendarDatePicker"
                                runat="server"

                                SelectedDate="<%# DateTime.Today %>"
                                OnSelectionChanged="calendarDatePicker_SelectionChanged"
                                Visible="False" Width="128px"></asp:Calendar>

                       <asp:CustomValidator ID="customValidatorShippedDate" runat="server" 
                ErrorMessage=" Vui Lòng Nhập Lại Ngày Giao Hàng" ControlToValidate="textShippedDate"
                OnServerValidate="customValidatorShippedDate_ServerValidate"
                ValidateEmptyText="True" Font-Bold="True" ForeColor="#CC3300"></asp:CustomValidator>  
       
               
                
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1" ></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" >Số Xe:</td>
                        <td>
                            <asp:TextBox ID="textTrackingNumber" runat="server"
                                CssClass="textField"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1" ></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" >Trạng Thái:</td>
                        <td>
                            <asp:DropDownList ID="dropdownlistOrderStatus" runat="server"
                                CssClass="textField">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1" ></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" ></td>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Button ID="commandReturn" runat="server" Text="Trở Về"
                                            CssClass="btn btn-primary" OnClick="commandReturn_Click" />
                                        <asp:Button ID="commandUpdate"  OnClientClick="return postbackButtonClick();" runat="server" Text="Cập Nhật"
                                            CssClass="btn btn-primary" CausesValidation="true" OnClick="commandUpdate_Click" />
                                        <asp:Button ID="commandRefund"
                                             OnClientClick="return postbackButtonClick();"
                                            runat="server"
                                            Text="Trả Hàng"
                                            OnClick="commandRefund_Click"
                                            CssClass="btn btn-primary" />
                                    </td>

                                </tr>

                            </table>
                        </td>
                    </tr>
                </table>

               </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="commandReturn" />
            <asp:PostBackTrigger ControlID="commandRefund" />
            <asp:PostBackTrigger ControlID="commandUpdate" />
            <asp:AsyncPostBackTrigger ControlID="calendarDatePicker" EventName="SelectionChanged" />
        </Triggers>
    </asp:UpdatePanel>
     <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <asp:Panel ID="Panel1" CssClass="overlay" runat="server">
                        <asp:Panel ID="Panel2" CssClass="loader" runat="server">
                            <img src="../Images/ajax-loading-icon-19.jpg" width="60px" height="60px" />
                        </asp:Panel>
                    </asp:Panel>
                </ProgressTemplate>
            </asp:UpdateProgress>
    <script type="text/javascript">
             //update panel and postback trigger with fileupload control upadteprogressbar code
             var updateProgress = null;
             function postbackButtonClick() {

                 updateProgress = $find("<%= UpdateProgress1.ClientID %>");
            window.setTimeout("updateProgress.set_visible(true)", updateProgress.get_displayAfter());
            return true;
        }
        </script>
    
</asp:Content>

