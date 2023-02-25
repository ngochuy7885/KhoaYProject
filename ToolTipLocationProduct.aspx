<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ToolTipLocationProduct.aspx.cs" Inherits="Admin_ToolTipLocationProduct" %>

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
                        <td  style="background-color:#f8f9fa;font-size:larger;color:red"><%#Eval("Location") %></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>
