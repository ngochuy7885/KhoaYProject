<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <%--  <script type="text/javascript">
    function ShowHideDiv(lnkEmail) {
        //var myspan = document.getElementById("myspan");      
        var myspan = document.getElementById('<%= myspan.ClientID %>');
        myspan.style.display = lnkEmail.checked ? "inline" : "none";
    }
    </script>--%>

    <style type="text/css">
        
         @media (min-width: 375px) and (max-width: 576px) {
            
        
        }
        @media (min-width: 576px) and (max-width: 768px) {
            
        }
        /*Css for iphone*/
        @media (min-width: 768px) and (max-width: 991.98px) {
            .lnkFileCss {
                margin-left:150px;   
            }
            .mlfirstname {
            margin-left:7.3rem;
            
            
        }
         .mllastname {
            margin-left:7.6rem;
        }
        .mlAddress {
            margin-left: 4.9rem;
         
        }
         .mlCity {
            margin-left:4.3rem;
        }
         .mlState {
            margin-left:4.8rem;
        }
         .mlPostalCode {
            margin-left:3.5rem;
        }
         .mlEmail {
            margin-left:7rem;
            
        }
          .mlPassword {
            margin-left:5rem;
        }
           .mlConfirmPassword {
            margin-left:0.5rem;
        }
            .mlPhone1 {
            margin-left:3.8rem;
        }
              .mlFax {
            margin-left:8rem;
        }
        .mlNewsLetter {
            margin-left:9.5rem;
        }
        .ml-button {
            margin-left: 9.5rem;
        }
        .ml-validation {
            margin-left:15px;
            padding-left:0px;
        }
      
           
        }
        @media (min-width: 992px) and (max-width: 1199px) {
            .mlfirstname {
            margin-left:7.3rem;         
        }
         .mllastname {
            margin-left:7.6rem;
        }
        .mlAddress {
            margin-left: 4.9rem;
            min-width:400px;
        }
         .mlCity {
            margin-left:4.3rem;
        }
         .mlState {
            margin-left:4.8rem;
        }
         .mlPostalCode {
            margin-left:3.5rem;
        }
         .mlEmail {
            margin-left:6.8rem;
            min-width:300px;
            
        }
          .mlPassword {
            margin-left:5rem;
        }
           .mlConfirmPassword {
            margin-left:0.5rem;
        }
            .mlPhone1 {
            margin-left:3.8rem;
        }
              .mlFax {
            margin-left:8rem;
        }
        .mlNewsLetter {
            margin-left:9.5rem;
        }
        .ml-button {
            margin-left: 9.5rem;
        }
        .ml-validation {
            margin-left:15px;
            padding-left:0px;
        }
        }
        
           
        @media (min-width: 1200px) {
            .mlfirstname {
            margin-left:7.3rem;         
        }
         .mllastname {
            margin-left:7.6rem;
        }
        .mlAddress {
            margin-left: 4.9rem;
            min-width:400px;
        }
         .mlCity {
            margin-left:4.3rem;
        }
         .mlState {
            margin-left:4.8rem;
        }
         .mlPostalCode {
            margin-left:3.5rem;
        }
         .mlEmail {
            margin-left:7rem;
            min-width:300px;
            
        }
          .mlPassword {
            margin-left:5rem;
        }
           .mlConfirmPassword {
            margin-left:0.5rem;
        }
            .mlPhone1 {
            margin-left:3.8rem;
        }
              .mlFax {
            margin-left:8rem;
        }
        .mlNewsLetter {
            margin-left:9.5rem;
        }
        .ml-button {
            margin-left: 9.5rem;
        }
        .ml-validation {
            margin-left:15px;
            padding-left:0px;
        }
      
        }
    
        
    </style>
    <style>
        .linkCss {
             text-decoration:underline;
            color:blue;
        }
            .linkCss:hover {
                color:blue;
           text-decoration:underline;
      
            }
        .displaynone {
            display:none;
        }
        .displaycus {
            display:inline;
            color:red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <asp:ValidationSummary  ForeColor="Red" CssClass="ml-validation"
                              id="ValidationSummary2" 
                              DisplayMode="BulletList" 
                              runat="server"
                              HeaderText="Lỗi Của Trang:"
                              Font-Names="verdana" 
                              Font-Size="12"/>
            <asp:Panel ID="PanelInformation" DefaultButton="commandRegister" runat="server">
    <div class="container">
        <div class="form-group form-inline">
              
                        <label for="FirstName">Tên: </label>
                        <asp:TextBox ID="textFirstName"  CssClass="form-control mlfirstname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredFirstName" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Tên "
                            ControlToValidate="textFirstName" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                        
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ErrorMessage="Xin vui lòng Nhập Tên Không Quá 50 Kí Tự" ControlToValidate="textFirstName" 
                            Font-Bold="True" ForeColor="#CC3300"
                              ValidationExpression="[\s\S]{0,50}" ValidChars="()-" EnableClientScript="False" CssClass="pl-3" >*</asp:RegularExpressionValidator>
          
                      </div>
          <div class="form-group form-inline">
                        <label for="LastName">Họ: </label>
                        <asp:TextBox ID="textLastName" CssClass="form-control mllastname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Họ"
                            ControlToValidate="textLastName" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="Xin vui lòng Nhập Họ Không Quá 50 Kí Tự" ControlToValidate="textLastName" 
                            Font-Bold="True" ForeColor="#CC3300"
                              ValidationExpression="[\s\S]{0,50}" ValidChars="()-" EnableClientScript="False" CssClass="pl-3" >*</asp:RegularExpressionValidator>
               
               </div>
        <div class="form-group form-inline">
                        <label for="Address">Địa Chỉ 1: </label>
                        <asp:TextBox ID="textAddress" Columns="26" CssClass="form-control mlAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Địa Chỉ"
                            ControlToValidate="textAddress" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ErrorMessage="Xin vui lòng Nhập Địa Chỉ 1 Không Quá 50 Kí Tự" ControlToValidate="textAddress" 
                            Font-Bold="True" ForeColor="#CC3300"
                              ValidationExpression="[\s\S]{0,50}" ValidChars="()-" EnableClientScript="False" CssClass="pl-3" >*</asp:RegularExpressionValidator>
              
        </div>
         <div class="form-group form-inline">
                        <label for="Address2">Địa Chỉ 2: </label>
                        <asp:TextBox ID="textAddress2" Columns="26" CssClass="form-control mlAddress" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ErrorMessage="Xin vui lòng Nhập Địa Chỉ 2 Không Quá 50 Kí Tự" ControlToValidate="textAddress2" 
                            Font-Bold="True" ForeColor="#CC3300"
                              ValidationExpression="[\s\S]{0,50}" ValidChars="()-" EnableClientScript="False" CssClass="pl-3" >*</asp:RegularExpressionValidator>
              
                      </div>
         <div class="form-group form-inline">
                        <label for="City">Thành Phố: </label>
                        <asp:TextBox ID="textCity" CssClass="form-control mlCity" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Thành Phố"
                            ControlToValidate="textCity" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False"  Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                            ErrorMessage="Xin vui lòng Nhập Thành Phố Không Quá 50 Kí Tự" 
                            ControlToValidate="textCity" 
                            Font-Bold="True" ForeColor="#CC3300"
                              ValidationExpression="[\s\S]{0,50}" ValidChars="()-" EnableClientScript="False" CssClass="pl-3" >*</asp:RegularExpressionValidator>
              
                    </div>
        <div class="form-group form-inline">
                        <label for="City">Tiểu Bang: </label>
                        <asp:TextBox ID="textState" CssClass="form-control mlState" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Tiểu Bang"
                            ControlToValidate="textState" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False"  Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                            ErrorMessage="Xin vui lòng Nhập Tiểu Bang Không Quá 50 Kí Tự" 
                            ControlToValidate="textState" 
                            Font-Bold="True" ForeColor="#CC3300"
                             ValidationExpression="[\s\S]{0,50}" ValidChars="()-" EnableClientScript="False" CssClass="pl-3" >*</asp:RegularExpressionValidator>
                     
             </div>
          <div class="form-group form-inline">
                        <label for="PostalCode">Mã Bưu Điện: </label>
                        <asp:TextBox ID="textPostalCode" CssClass="form-control mlPostalCode" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Mã Bưu Điện"
                            ControlToValidate="textPostalCode" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                            ErrorMessage="Xin vui lòng Nhập Mã Bưu Điện Không Quá 50 Kí Tự" 
                            ControlToValidate="textPostalCode" 
                            Font-Bold="True" ForeColor="#CC3300"
                             ValidationExpression="[\s\S]{0,50}" ValidChars="()-" EnableClientScript="False" CssClass="pl-3" >*</asp:RegularExpressionValidator>
                        
          </div>
         <div class="form-group form-inline">
                        <label for="Email">Email: </label>
                        <asp:TextBox ID="textEmail" TextMode="SingleLine" Columns="24" CssClass="form-control mlEmail" runat="server"></asp:TextBox>
                         <asp:CustomValidator ID="customValidatorEmail" runat="server" CssClass="form-group pl-3"
                            ErrorMessage=" Vui Lòng Nhập Hòm Thư Khác" ControlToValidate="textEmail"
                            OnServerValidate="customValidatorEmail_ServerValidate"
                            ValidateEmptyText="True" Font-Bold="True" ForeColor="#CC3300">*</asp:CustomValidator> 
                        
         </div>
          <div class="form-group form-inline">
                        <label for="Password">Mật Khẩu: </label>
                        <asp:TextBox ID="textPassword" Text="123" TextMode="Password" CssClass="form-control mlPassword" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="Xin Vui Lòng Nhập Mật Khẩu"
                            ControlToValidate="textPassword" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False"  Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="comparePasswords" runat="server"
                        Display="Dynamic" EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300"
                        ErrorMessage="Mật Khẩu Không Khớp"
                        ControlToCompare="textPassword"
                        ControlToValidate="textConfirmPassword" >*
                        </asp:CompareValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                            ErrorMessage="Xin vui lòng Nhập Mật Khẩu Không Quá 50 Kí Tự" 
                            ControlToValidate="textPassword" 
                            Font-Bold="True" ForeColor="#CC3300"
                              ValidationExpression="[\s\S]{0,50}" ValidChars="()-" EnableClientScript="False" CssClass="pl-3" >*</asp:RegularExpressionValidator>
                        
        
                    </div>
        <div class="form-group form-inline">
                        <label for="ConfirmPassword">Xác Nhận Mật Khẩu: </label>
                        <asp:TextBox ID="textConfirmPassword" Text="123" TextMode="Password" CssClass="form-control mlConfirmPassword" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Cùng Mật Khẩu"
                            ControlToValidate="textConfirmPassword" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False" Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" 
                            ErrorMessage="Xin vui lòng Nhập Xác Nhận Mật Khẩu Không Quá 50 Kí Tự" 
                            ControlToValidate="textConfirmPassword" 
                            Font-Bold="True" ForeColor="#CC3300"
                              ValidationExpression="[\s\S]{0,50}" ValidChars="()-" EnableClientScript="False" CssClass="pl-3" >*</asp:RegularExpressionValidator>
                     
        </div>
        
           <div class="form-group form-inline">
                        <label for="txtPhone">Điện Thoại 1: </label>
                        <asp:TextBox ID="textPhone" CssClass="form-control mlPhone1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                            ErrorMessage=" Vui Lòng Nhập Điện Thoại"
                            ControlToValidate="textPhone" Display="Dynamic" CssClass="pl-3"
                            EnableClientScript="False"  Font-Bold="True" ForeColor="#CC3300">*</asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" 
                            ErrorMessage="Xin vui lòng Nhập Điện Thoại Không Quá 50 Kí Tự" 
                            ControlToValidate="textPhone" 
                            Font-Bold="True" ForeColor="#CC3300"
                              ValidationExpression="[\s\S]{0,50}" ValidChars="()-" EnableClientScript="False" CssClass="pl-3" >*</asp:RegularExpressionValidator>
                     
           </div>
          <div class="form-group form-inline">
                        <label for="txtPhone">Điện Thoại 2: </label>
                        <asp:TextBox ID="textPhone2" CssClass="form-control mlPhone1" runat="server"></asp:TextBox>
          </div>
        <div class="form-group form-inline">
                        <label for="txtFax">Fax: </label>
                        <asp:TextBox ID="textFax" CssClass="form-control mlFax" runat="server"></asp:TextBox>
          </div>
        <div class="form-group form-inline">
                <%--<asp:CheckBox ID="checkboxNewsletter" onclick="ShowHideDiv(this)" CssClass="mlNewsLetter" runat="server" />--%> 
                <asp:CheckBox ID="checkboxNewsletter" CssClass="mlNewsLetter" runat="server" /> 
          
              &nbsp; <label for="txtSubscribe">Đăng Kí Nhận Email Từ Phía KhoaY.  </label> 
                &nbsp; 
                <%--<span id="myspan" style="display:none" class="lnkFileCss" runat="server" ><asp:LinkButton ID="lnkEmail" CssClass="linkCss" OnClick="lnkEmail_Click" runat="server">Tải File hướng dẫn</asp:LinkButton> </span>--%>
          </div>
        <div class="form-group ml-button">

                <asp:Button ID="commandRegister" runat="server" CssClass="btn btn-primary"  Text="Đăng Kí" OnClick="commandRegister_Click"  />
                 <asp:Button ID="commandCancel" CssClass="btn btn-primary" runat="server" Text="Hủy" OnClick="commandCancel_Click" CausesValidation="false" />
            </div>
     </div>
         </asp:Panel>   
            </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="commandCancel" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="checkboxNewsletter" EventName="CheckedChanged" />
            <asp:PostBackTrigger ControlID="commandRegister" />
             <%--<asp:PostBackTrigger ControlID="lnkEmail" />--%>
        </Triggers>
        </asp:UpdatePanel>
     <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <asp:Panel ID="Panel1" CssClass="overlay" runat="server">
                        <asp:Panel ID="Panel2" CssClass="loader" runat="server">
                            <img src="images/ajax-loading-icon-19.jpg" width="60px" height="60px" />
                        </asp:Panel>
                    </asp:Panel>
                </ProgressTemplate>
            </asp:UpdateProgress>
    
</asp:Content>

