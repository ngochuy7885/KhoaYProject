<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ToolTipImageProduct.aspx.cs" Inherits="ToolTipImageProduct" %>

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
                        <td bgcolor="#f8f9fa">
                            <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="img-responsive mt-sm-3" width="200" height="180" />
                         </td>   
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>
