<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

.body{
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}
      .form-signin {
  width: 100%;
  max-width: 330px;
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
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
 
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
 
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
   <asp:Panel ID="Panel1" DefaultButton="commandLogin" Width="100%" runat="server">
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
    <main class="form-signin">
                <h1 class="h3 mb-3 fw-normal text-center">Xin Đăng Nhập</h1>


                   <div class="row pl-3">
                        <asp:TextBox id="textUserName" CssClass="form-control" placeholder="Địa Chỉ Email" autofocus="true" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="requiredUsername"  ControlToValidate="textUserName" 
                                runat="server" ErrorMessage="Nhập Email"  Font-Bold="True" ForeColor="#CC3300" ></asp:RequiredFieldValidator> 
                  </div>
                    <div class="row mt-0 pl-3">
                        <asp:TextBox id="textPassword" TextMode="Password" CssClass="form-control"  placeholder="Mật Khẩu"  runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredPassword"  Font-Bold="True" ControlToValidate="textPassword" runat="server" ErrorMessage="Nhập Mật Khẩu" ForeColor="#CC3300" ></asp:RequiredFieldValidator>       
                     </div>   
                 <div class="checkbox mb-3 pt-2">
                    <div class="row pl-3 pt-0 text-left">
                      <label>
                        <asp:CheckBox ID="chkRememberMe" AutoPostBack="true" OnCheckedChanged="chkRememberMe_CheckedChanged" CssClass="checkbox" runat="server"></asp:CheckBox> Nhớ Mật Khẩu
                          <br />
                         <h2><asp:Label ID="labelMessage" ForeColor="Red" runat="server" Text=""></asp:Label></h2>
                      </label>
                   </div>
                </div>
                <div class="row pl-3">
                     <asp:Button Id="commandLogin" runat="server" CssClass="w-100 btn btn-primary btn-block"  Text="Đăng Nhập" OnClick="commandLogin_Click"></asp:Button>
                </div>
                  <div class="row pl-3 pt-3">
                  <label>
                      <a id="dangky"  style="color:blue" href="Register.aspx">Đăng Ký Thành Viên</a>
                  </label>
                    </div>
                
            </main>
            </ContentTemplate>
        <Triggers>
            
            <asp:AsyncPostBackTrigger ControlID="chkRememberMe" EventName="CheckedChanged" />
            
        </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
                
</asp:Content>

