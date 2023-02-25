<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Introduction.aspx.cs" Inherits="Introduction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <style type="text/css">    
        .classimg {
            float: left; 
            margin: 5px;
        }
        .pclass {
            text-align: justify;
           
			vertical-align:top;
        }
    </style>
    
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
 
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <div class="container">
          <div>
              <center><h3><strong><p>Chào Mừng Bạn Đến Với Công Ty TNHH Khoa Y</p> </strong></h3></center>
          </div>
        <div> 
            <a href="Default.aspx">
            <img class="classimg"  src="../Images/logo.png" class="img-responsive" height="50" width="150" title="Lựa Chọn Để Đến Sản Phẩm Của Chúng Tôi"
                    alt="Longtail boat in Thailand"> </a>
        </div>
                <p class="pclass">
                Khoa Y là một doanh nghiệp gia đình chuyên kinh doanh thuốc tây và dụng cụ thiết bị y tế từ đầu những năm 1950. 
                Nó được thành lập và bắt đầu bởi cha mẹ của chủ sở hữu hiện tại, 
                những người sinh ra ở Việt Nam và sở hữu một cửa hàng thuốc nhưng muốn chuyển đến Mỹ để nuôi gia đình.              
                 Nhiều thuốc và dụng cụ y tế đều có sẵn hàng ngày để phục vụ khách hàng. 
                Vui lòng lướt khắp cửa hàng thuốc của chúng tôi để tìm một số thuốc có sẵn mà bạn cần.
                <p />
                
    </div>
               
            
                 
</asp:Content>

