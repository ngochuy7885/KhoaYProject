<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestImage.aspx.cs" Inherits="TestImage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <script type="text/javascript" src="../Scripts/ajax-dynamic-content.js"></script>
    <script type="text/javascript" src="../Scripts/ajax-tooltip.js"></script>
	<script type="text/javascript" src="../Scripts/ajax.js" defer="defer"></script>
   
    <div>
                
            <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                        <a onmouseover="VietAd_ShowTooltip('../ToolTipImageProduct.aspx?ProductID=<%#Eval("ProductID") %>'); return false" onmouseout="VietAd_HideTooltip();" href='ProductDetails.aspx?ProductImageID=<%# Eval("ProductImageID") %>'>                     
                                    <%# Eval("ProductName") %>
                        </a>
                              <asp:Image ID="Image2" runat="server" ImageUrl='ImageViewer.ashx?ProductImageID=1'/>
                                <img src="../ImageViewer.ashx?ProductImageId=<%#Eval("ProductImageID") %>" class="img-responsive mt-sm-3" width="200" height="120" />
                                   
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
            
    </div>
    </form>
</body>
</html>
