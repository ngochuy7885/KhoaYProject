<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .linkCss {
             text-decoration:underline;
            color:blue;
        }
            .linkCss:hover {
                color:blue;
           text-decoration:underline;
      
            }
       
    </style>  
    
    <link href="CSS/css/font-awesome.css" rel="stylesheet" />
   <style>
        .accordion {
            margin: 15px;
           
        }
        .accordion .fa {
            margin-right: 0.2rem;
        }
    </style>

    <script>
        $(document).ready(function () {
            // Add minus icon for collapse element which
            // is open by default
            $(".collapse.show").each(function () {
                $(this).prev(".my-card-header").find(".fa")
                    .addClass("fa-minus").removeClass("fa-plus");
            });
            // Toggle plus minus icon on show hide
            // of collapse element
            $(".collapse").on('show.bs.collapse', function () {
                $(this).prev(".my-card-header").find(".fa")
                    .removeClass("fa-plus").addClass("fa-minus");
            }).on('hide.bs.collapse', function () {
                $(this).prev(".my-card-header").find(".fa")
                    .removeClass("fa-minus").addClass("fa-plus");
            });
        });
    </script>
    <style>
        .my-icon {
    padding-top:14px;
    padding-right:10px;
    
    vertical-align: middle;
    float:right;
    }
        .my-card-header {
  padding: 0;
  margin-bottom: 0;
  background-color: #f4f8fb;
  border-bottom: 0px solid rgba(0, 0, 0, 0.125);
  
    }
        .btn-link {
  font-weight: 400;
  color: black;
  background-color: transparent;
  white-space: normal;
    word-wrap: break-word;
    text-align:justify;
}

.btn-link:hover {
  color: #0056b3;
  text-decoration:none;
  background-color: transparent;
  border-color: transparent;
}
.btn-link:focus, .btn-link.focus {
  text-decoration: none;
  border-color: transparent;
  box-shadow: none;
}
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
  <div class="container" >
      
      <div class="accordion" id="accordionExample">        
          <div class="card">
        
              <div class="my-card-header" id="headingOne">
                 
                 

                  <h2 class="mb-0">
                      <button type="button" class="btn btn-link"
                          data-toggle="collapse"
                          data-target="#collapseOne">
                           <i class="fa fa-plus" data-toggle="collapse"
                      data-target="#collapseOne"></i> Làm sao nhận được bảng báo giá từ phía công ty KhoaY của chúng tôi?
                            
                      </button>
                  </h2>
              </div>
              <div id="collapseOne" class="collapse"
                  aria-labelledby="headingOne"
                  data-parent="#accordionExample">
                  <div class="card-body">

                      
                          Xin Vui lòng tải đường dẫn <asp:LinkButton ID="lnkQuote" CssClass="linkCss" OnClick="lnkQuote_Click" runat="server"> ở đây.</asp:LinkButton>
                     
                  </div>
              </div>
              
            
            </div>   
      </div>

      <div class="accordion" id="accordionExample2">
         
          
          <div class="card">
        
              <div class="my-card-header" id="headingTwo">
                 
                
                  <h2 class="mb-0">
                      <button type="button" class="btn btn-link"
                          data-toggle="collapse"
                          data-target="#collapseTwo">
                          <i class="fa fa-plus" data-toggle="collapse"
                      data-target="#collapseTwo"></i>
                          Làm sao nhận được email thông báo từ phía công ty KhoaY của chúng tôi?
                      </button>
                  </h2>
              </div>
              <div id="collapseTwo" class="collapse"
                  aria-labelledby="headingTwo"
                  data-parent="#accordionExample2">
                  <div class="card-body">

                         Xin Vui lòng làm theo hướng dẫn sau: <asp:LinkButton ID="LnkEmail" CssClass="linkCss" OnClick="lbkEmail_Click" runat="server">Tải hồ sơ</asp:LinkButton>
                    
                  </div>
              </div>
              
            
            </div>   
      </div>

      <div class="accordion" id="accordionExample3">
         
          
          <div class="card">
        
              <div class="my-card-header" id="headingThree">
                 
                

                  <h2 class="mb-0">
                      <button type="button" class="btn btn-link"
                          data-toggle="collapse"
                          data-target="#collapseThree">
                           <i class="fa fa-plus" data-toggle="collapse"
                      data-target="#collapseThree"></i>
                          Những vị trí sản phẩm của chúng tôi có thể vận chuyển?
                      </button>
                  </h2>
              </div>
              <div id="collapseThree" class="collapse"
                  aria-labelledby="headingTwo"
                  data-parent="#accordionExample3">
                  <div class="card-body">
                      KhoaY sẽ vẫn chuyển đến mọi nơi trong đất nước Việt Nam.
                     
                  </div>
              </div>
              
            
            </div>   
      </div>
                         
     <div class="accordion" id="accordionExample4">
         
          
          <div class="card">
        
              <div class="my-card-header" id="headingFour">
                 
                 

                  <h2 class="mb-0">
                      <button type="button" class="btn btn-link"
                          data-toggle="collapse"
                          data-target="#collapseFour">
                           <i class="fa fa-plus" data-toggle="collapse"
                      data-target="#collapseFour"></i>
                          Bao nhiêu tuổi mới mua được sản phẩm từ phía công ty KhoaY của chúng tôi?
                      </button>
                  </h2>
              </div>
              <div id="collapseFour" class="collapse"
                  aria-labelledby="headingFour"
                  data-parent="#accordionExample4">
                  <div class="card-body">
                      Bạn ở bất kì độ tuổi nào cũng có thể thực hiện việc mua bán thuốc.
                     
                  </div>
              </div>
              
            
            </div>   
      </div> 
   
     <div class="accordion" id="accordionExample5">
         
          
          <div class="card">
        
              <div class="my-card-header" id="headingFive">
                 
                  

                  <h2 class="mb-0">
                      <button type="button" class="btn btn-link"
                          data-toggle="collapse"
                          data-target="#collapseFive">
                          <i class="fa fa-plus" data-toggle="collapse"
                      data-target="#collapseFive"></i>
                          Những loại thuốc nào mà KhoaY bán?
                      </button>
                  </h2>
              </div>
              <div id="collapseFive" class="collapse"
                  aria-labelledby="headingFive"
                  data-parent="#accordionExample5">
                  <div class="card-body">
                      Chúng tôi bán mọi loại thuốc nội. Xin vui lòng xem thông tin qua trang web được đưa lên trên mạng.
                     
                  </div>
              </div>
              
            
            </div>   
      </div>

         
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

      
    
            </ContentTemplate>
            <Triggers>
                <%--<asp:AsyncPostBackTrigger ControlID="lnkEmail" EventName="Click" />--%>
                <asp:PostBackTrigger ControlID="lnkEmail" />
                <asp:PostBackTrigger ControlID="lnkQuote" />
            </Triggers>
    </asp:UpdatePanel>
    </div>
</asp:Content>

