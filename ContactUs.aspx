<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
          footer {
                /*background: #f8f9fa;
            color: black;*/
                background-color: #2687fb;
                color: white;
                padding: 40px;
                min-height:2vh;            
            }
    </style>
    <style type="text/css">
        @media (min-width: 375px) and (max-width: 576px) {
        }

        @media (min-width: 576px) and (max-width: 767px) {
        }
        /* CSS for iphone*/
        @media (min-width: 768px) and (max-width: 991px) {
            .mlName {
                margin-left: 53px;
            }

            .mlEmail {
                margin-left: 40px;
                min-width: 300px;
            }

            .mlComment {
                margin-left: 10px;
                min-width: 300px;
            }

            .ml-button {
                margin-left: 80px;
            }

            .linkbottomcus {
                position: relative;
                color: black;
                text-decoration: none;
            }

                .linkbottomcus:hover {
                    position: relative;
                    color: black;
                    text-decoration: none;
                }
        }

        @media (min-width: 992px) and (max-width: 1199px) {
            .mlName {
                margin-left: 53px;
            }

            .mlEmail {
                margin-left: 40px;
                min-width: 300px;
            }

            .mlComment {
                margin-left: 10px;
                min-width: 300px;
            }

            .ml-button {
                margin-left: 80px;
            }

            .linkbottomcus {
                position: relative;
                color: black;
                text-decoration: none;
            }

                .linkbottomcus:hover {
                    position: relative;
                    color: black;
                    text-decoration: none;
                }
        }

        @media (min-width: 1200px) {
            .mlName {
                margin-left: 53px;
            }

            .mlEmail {
                margin-left: 40px;
                min-width: 300px;
            }

            .mlComment {
                margin-left: 10px;
                min-width: 300px;
            }

            .ml-button {
                margin-left: 80px;
            }

            .linkbottomcus {
                position: relative;
                color: black;
                text-decoration: none;
            }

                .linkbottomcus:hover {
                    position: relative;
                    color: black;
                    text-decoration: none;
                }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <h2 class="title">Liên Hệ!</h2>


        <!-- START PRODUCT DETAIL TEMPLATE -->



        <img src="Images/map.png" class="img-fluid" />



        <div class="col-md-12">
            <p style="width: 500px; white-space: normal; word-break: break-all"></p>
        </div>
        <p>
            <b>Địa Chỉ Liên Lạc: </b>
            <br />
            Quầy L1, 134/1 Tô Hiến Thành, P.15, Q.10, TP.HCM
                                <br />
            Fax: (08) 3862 4784
                                <br />
            Loan: (08) 3866 7386 - 0913 825 862
                                <br />
            Huy: 0933 492 897
        </p>

        <div class="col-md-12">
            <p style="width: 500px; white-space: normal; word-break: break-all"></p>
        </div>



        <asp:ValidationSummary ForeColor="Red" CssClass="ml-validation"
            ID="ValidationSummary2"
            DisplayMode="BulletList"
            runat="server"
            HeaderText="Lỗi Của Trang:"
            Font-Names="verdana"
            Font-Size="12" />
        <asp:Panel ID="PanelInformation" runat="server">

            <div class="form-group form-inline">

                <label for="FirstName">Tên: </label>
                <asp:TextBox ID="textName" CssClass="form-control mlName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="requiredFirstName" runat="server"
                    ErrorMessage=" Vui Lòng Nhập Tên "
                    ControlToValidate="textName" Display="Dynamic" CssClass="pl-3"
                    EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group form-inline">

                <label for="FirstName">Email: </label>
                <asp:TextBox ID="textEmail" CssClass="form-control mlEmail" runat="server"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="regularexpEmail" runat="server" ControlToValidate="textEmail"
                                                            Display="Dynamic" EnableClientScript="False" ErrorMessage="Vui Lòng Nhập Email Hợp Lệ"
                                                            ForeColor="#CC3300" Font-Bold="True" CssClass="pl-3"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> * </asp:RegularExpressionValidator><br />
                                                       
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage=" Vui Lòng Nhập Email "
                    ControlToValidate="textEmail" Display="Dynamic" CssClass="pl-3"
                    EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group form-inline">

                <label for="FirstName">Bình Luận: </label>
                <asp:TextBox ID="textComment" TextMode="MultiLine" Height="100px" CssClass="form-control mlComment" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage=" Vui Lòng Nhập Lời Bình Luận "
                    ControlToValidate="textComment" Display="Dynamic" CssClass="pl-3"
                    EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group ml-button">

                <asp:Button ID="commandSubmit" runat="server" CssClass="btn btn-primary" OnClick="commandSubmit_Click" Text="Gửi Email" />
                <asp:Button ID="commandCancel" CausesValidation="false" CssClass="btn btn-primary" runat="server" OnClick="commandCancel_Click" Text="Hủy" />
            </div>
        </asp:Panel>

        <!-- END PRODUCT DETAIL TEMPLATE -->

          
            </ContentTemplate>
               <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="commandCancel" EventName="Click" />
                    <asp:PostBackTrigger ControlID="commandSubmit" />
             
                </Triggers>
            </asp:UpdatePanel>
    </div>
    <!-- end content -->
</asp:Content>

