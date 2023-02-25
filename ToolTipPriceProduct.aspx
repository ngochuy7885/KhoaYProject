<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ToolTipPriceProduct.aspx.cs" Inherits="ToolTipPriceProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                        <td  style="background-color:#f8f9fa;font-size:larger;color:red"><%# String.Format( new System.Globalization.CultureInfo("vi-VN"), "{0:#,##0}", Eval("Price") )%> VNĐ <%# Eval("SearchName") %></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>
