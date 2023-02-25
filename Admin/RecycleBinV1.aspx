<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="RecycleBinV1.aspx.cs" Inherits="Admin_TestTextBoxKeyUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/jquery1.8.3.min.js"></script>
    <script src="../Scripts/json2.js"></script>
    <script src="../Scripts/ASPSnippets_Pager.min.js"></script>
    <style type="text/css">
        body
        {
            /*font-family: Arial;*/
            font-size: 12pt;
        }
        table
        {
            border: 1px solid #ccc;
        }
        table th
        {
            background-color: #f4f8fb;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border-color: #ccc;
        }
        .Pager span
        {
            color: #333;
            background-color: #F7F7F7;
            font-weight: bold;
            text-align: center;
            display: inline-block;
            width: 30px;
            margin-right: 3px;
            line-height: 150%;
            border: 1px solid #ccc;
        }
        .Pager a
        {
            text-align: center;
            display: inline-block;
            width: 30px;
            border: 1px solid #ccc;
            color: #fff;
            color: #333;
            margin-right: 3px;
            line-height: 150%;
            text-decoration: none;
        }
        .highlight
        {
            background-color: #FFFFAF;
        }
        .CssRecover {
            color:blue;
            /*text-decoration:underline;*/

        }
        .CssRecover:hover {
            color:black;
            

        }
    </style>
    <script type="text/javascript">
        $(function () {
            GetProducts(1);
        });
        $("#<%=TextBoxSearch.ClientID%>").live("keyup", function () {
            GetProducts(parseInt(1));
        });
        $(".Pager .page").live("click", function () {
            GetProducts(parseInt($(this).attr('page')));
        });
        function SearchTerm() {
            return jQuery.trim(document.getElementById('<%=TextBoxSearch.ClientID %>').value);
            //return jQuery.trim($("[id*=textBoxSearch]").val());
        };
        function GetProducts(pageIndex) {
            
            $.ajax({

                type: "POST",
                url: "RecycleBinV1.aspx/GetProducts",
                data: '{searchTerm: "' + SearchTerm() + '", pageIndex: ' + pageIndex + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                }
                
            });
        }
        
        var row;
        function CallMe(productid) {
            if (confirm("Bạn Có Muốn Phục Hồi Sản Phẩm Này?")) {
              
                $.ajax({
                    type: "POST",
                    url: " RecycleBinV1.aspx/RecoverProduct",
                    data: '{productid: "' + productid + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        GetProducts(1);
                    },
                    failure: function (response) {
                        alert(response.d);
                    }

                });
        
                  
            }
           
        }
       
        function OnSuccessReover() {
            alert("OnSuccessReover");
        }
        function format2(n, currency) {
            return currency + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
        }
      
     
        function OnSuccess(response) {
           
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var products = xml.find("Products");
            
            if (row == null) {
                row = $("[id*=<%=GridViewDeletedProductTest.ClientID %>] tr:last-child").clone(true);
            }
            $("[id*=<%=GridViewDeletedProductTest.ClientID %>] tr").not($("[id*=<%=GridViewDeletedProductTest.ClientID %>] tr:first-child")).remove();

            

            //Loop through the XML and add Rows to the Table.
            if (products.length > 0) {
                $.each(products, function () {
                    var product = $(this);
                    var price = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(product.find("Price").text())
                    
                    const config = { style: 'currency', currency: 'VND', maximumFractionDigits: 0 }
                    const formated = new Intl.NumberFormat('vi-VN', config).format(product.find("Price").text());
                    price1 = formated.replace("₫", " ");

                    //$("td", row).eq(0).html(product.find("ProductID").text());
                    $("td", row).eq(0).html("<label class='CSSID' id='lblID'>" + product.find("ProductID").text() + "</label>");
                    $("td", row).eq(1).html(product.find("ProductName").text());
                    $("td", row).eq(2).html(price1);
                    $("td", row).eq(3).html(product.find("ProductUnitName").text());
                    $("td", row).eq(4).html('<a class="CssRecover" id="test" href="javascript:CallMe(' + product.find("ProductID").text()+');" >' + " Phục Hồi </a>");
                    //$("td", row).eq(4).html('<input type="button" id=' + product.find("ProductID").text() + '  onclick="CallMe(' + product.find("ProductID").text()+ ')" value="Recover1">');
                    $("[id*=<%=GridViewDeletedProductTest.ClientID %>]").append(row);
                    row = $("[id*=<%=GridViewDeletedProductTest.ClientID %>] tr:last-child").clone(true);
                });
                $(".Pager").css("display", "block");
                var pager = xml.find("Pager");
                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });

            }

            else {
                var empty_row = row.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("Không Có Mẫu Tin Nào Tìm Thấy Phù Hợp Điều Kiện!!!");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=<%=GridViewDeletedProductTest.ClientID %>]").append(empty_row);
                $(".Pager").css("display", "none");
            }
           
        }
       
       
        

    </script>
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
            <asp:TextBox ID="TextBoxSearch" runat="server"  placeholder="Tìm Kiếm Tên Sản Phẩm..." CssClass="form-control col-lg-5 ml-3"></asp:TextBox>
    </div>
    <div style="width:100%; height:200px;">
            
          <asp:GridView ID="GridViewDeletedProductTest"  AutoGenerateColumns="false"             
                datakeynames="ProductID"
              CssClass="table table-bordered table-condensed"

               runat="server">
                          <Columns>
<%--                              <asp:BoundField HeaderStyle-Width="150px" DataField="ProductID" HeaderText="ID"
                                ItemStyle-CssClass="ProductIDCss" />--%>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                      
                                <HeaderTemplate >
                                     <center>ID</center>
                                 </HeaderTemplate>   
                          <ItemTemplate>     
                                <asp:Label ID="lblProductID" CssClass="CssProductID" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                                           
                                                                
                        </ItemTemplate>
                      </asp:TemplateField>
                            <asp:BoundField DataField="ProductName" HeaderText="Tên Sản Phẩm"
                                />
                            <asp:BoundField DataField="Price" HeaderText="Giá" />
                            <asp:BoundField HeaderStyle-Width="60px" DataField="ProductUnitName" HeaderText="ĐVT" />
                            <asp:CommandField ButtonType="Image" HeaderText="Tác Vụ"  HeaderStyle-Width="100px"
                                ShowSelectButton="True" 
                                SelectImageUrl="../Admin/Images/restore-icon-png-10.png" ControlStyle-Width="20" 
                                ControlStyle-Height="20"
                                     HeaderStyle-CssClass="text-center" >              
                                       <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center"/>
                            </asp:CommandField>
                           
                          </Columns>
                       
                      </asp:GridView>
    </div>
<div class="Pager">
    </div>
     
    </div>
</asp:Content>

