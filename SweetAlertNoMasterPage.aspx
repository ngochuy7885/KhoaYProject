<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SweetAlertNoMasterPage.aspx.cs" Inherits="SweetAlertNoMasterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="CSS/SweetAlert/sweetalert2.css" rel="stylesheet" />
    <script src="CSS/SweetAlert/bluebird.min.js"></script>
    <script src="CSS/bootstrap-4.0.0-dist/js/jquery.min.js"></script>
    <link href="CSS/bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="CSS/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
    <script src="CSS/SweetAlert/sweetalert2.min.js"></script>
     
    
        
  
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <%--<asp:HiddenField ID="hdID" Value='<%# Eval("CustomerId") %>' runat="server" />--%>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="ProductId" HeaderText="ProductId" />
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HiddenField ID="hdID" Value='<%# Eval("ProductId") %>' runat="server" />
                            <asp:Button ID="btnSweetAlert" runat="server" Text="Delete" CssClass="btn btn-primary" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        <asp:Label ID="labelMessage" runat="server" Text="Message"></asp:Label>
    </div>
        <script type="text/javascript">
            $(function () {
                $("[id*=btnSweetAlert]").on("click", function () {

                    var id = $(this).closest('tr').find('[id*=hdID]').val();
                    swal({
                        title: 'Bạn Có Muốn Xóa Sản Phẩm Này?',
                        text: "Bạn Không Thể Nào Phục Hồi Nó!",
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes',
                        cancelButtonText: 'No',
                        confirmButtonClass: 'btn btn-success',
                        cancelButtonClass: 'btn btn-danger',

                    }).then(function (result) {
                        if (result) {
                            $.ajax({
                                type: "POST",
                                url: "SweetAlertNoMasterPage.aspx/DeleteClick",
                                data: "{id:" + id + "}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (r) {
                                    if (r.d == "Deleted") {
                                        location.reload();
                                    }
                                    else {
                                        swal("Mẫu Tin Không Được Xóa", "Thất Bại", "Thành Công");
                                    }
                                }
                            });
                        }
                    },
                    function (dismiss) {
                        if (dismiss == 'cancel') {
                            swal('Hủy', 'Không Có Mẫu Tin Nào Được Xóa', 'error');
                        }
                    });
                    return false;
                });
            });
</script>
  
    </form>
</body>
</html>
