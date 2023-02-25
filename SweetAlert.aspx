<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="SweetAlert.aspx.cs" Inherits="SweetAlert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/SweetAlert/sweetalert2.css" rel="stylesheet" />
     <script src="CSS/SweetAlert/sweetalert2.min.js"></script>
    
    <script src="CSS/SweetAlert/bluebird.min.js"></script>
    <script src="CSS/bootstrap-4.0.0-dist/js/jquery.min.js"></script>
  
    <script src="CSS/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
   

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <asp:Label ID="labelMessage" runat="server" Text="Label"></asp:Label>
            <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="ProductId" HeaderText="ProductId" />
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" />
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Action
                        </HeaderTemplate>
                        <ItemTemplate>
                            
                            <asp:HiddenField ID="hdID" Value='<%# Eval("ProductId") %>' runat="server" />
                            <asp:Button ID="btnSweetAlert" runat="server" Text="Delete" CssClass="btn btn-primary" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            

        </ContentTemplate>
          <Triggers>
                <%--<asp:AsyncPostBackTrigger ControlID="commandEdit" EventName="Click" />--%>
                <asp:PostBackTrigger ControlID="button1" />
            </Triggers>
          
    </asp:UpdatePanel>
    <script type="text/javascript">
        $(function () {
            $("[id*=btnSweetAlert]").on("click", function () {

                var id = $(this).closest('tr').find('[id*=hdID]').val();
                swal({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'success',
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
                            url: "SweetAlert.aspx/DeleteClick",
                            data: "{id:" + id + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (r) {
                                if (r.d == "Deleted") {
                                    window.location.href = window.location.href;
                                    //location.reload();
                                    
                                }
                                else {
                                    swal("Data Not Deleted", r.d, "success");
                                }
                            }
                        });
                    }
                },
                function (dismiss) {
                    if (dismiss == 'cancel') {
                        swal('Cancelled', 'No record Deleted', 'error');
                    }
                });
                return false;
            });
        });
    </script>
</asp:Content>

