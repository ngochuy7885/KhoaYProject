<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Admin Mediscience LTD</title>
    <link type="image/x-icon" href="../Images/thuocicon2.png" rel="icon">
   
    <script src="../CSS/bootstrap-4.0.0-dist/js/jquery.min.js"></script>
    <script src="../CSS/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
    <link href="../CSS/bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="../CSS/bootstrap-4.0.0-dist/css/jquery-ui.css" rel="stylesheet" />


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .body {
            height: 100%;
        }

        .body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 400px;
            padding: 15px;
            margin: auto;
        }

            .form-signin .checkbox {
                font-weight: 400;
            }

            .form-signin .form-control {
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 10px;
                
            }

                .form-signin .form-control:focus {
                    z-index: 2;
                }

            .form-signin input[type="Email"] {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }

            .form-signin input[type="Password"] {
                margin-bottom: 10px;
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }

        #dangky {
            color: blue;
        }
        h2 {
            color:red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row col-lg-12 text-center">
            <main class="form-signin">
                <img class="mb-4" src="../Images/logo.PNG" alt="" width="150" height="57">
                <h1 class="h3 mb-3 fw-normal">Xin Đăng Nhập</h1>


                   <div class="row pl-3">
                        <asp:TextBox id="txtEmail" CssClass="form-control" placeholder="Địa Chỉ Email" autofocus="true" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="requiredUsername"  ControlToValidate="txtEmail" 
                                runat="server" ErrorMessage="Nhập Email"  Font-Bold="True" ForeColor="#CC3300" ></asp:RequiredFieldValidator> 
                  </div>
                    <div class="row mt-0 pl-3">
                        <asp:TextBox id="txtPassword" TextMode="Password" CssClass="form-control"  placeholder="Mật Khẩu"  runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredPassword"  Font-Bold="True" ControlToValidate="txtPassword" runat="server" ErrorMessage="Nhập Mật Khẩu" ForeColor="#CC3300" ></asp:RequiredFieldValidator>       
                     </div>   
                 <div class="checkbox mb-3 pt-2">
                    <div class="row pl-3 pt-0 text-left">
                      <label>
                        <asp:CheckBox ID="chkRememberMe" CssClass="checkbox" runat="server"></asp:CheckBox> Nhớ Mật Khẩu
                          <br />
                         <h2><asp:Label ID="labelMessage" runat="server" Text=""></asp:Label></h2>
                      </label>
                   </div>
                </div>
                <div class="row pl-3">
                     <asp:Button Id="commandLogin" runat="server" CssClass="w-100 btn btn-primary btn-block"  Text="Đăng Nhập" OnClick="commandLogin_Click"></asp:Button>
                </div>
                 
                <p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
            </main>
        </div>
    </form>
</body>
</html>
