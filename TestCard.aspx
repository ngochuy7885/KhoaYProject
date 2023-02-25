<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestCard.aspx.cs" Inherits="TestCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .container-fluid {
            max-width: 300px;
        }

        .cardcus {
            background: #fff;
            box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
            transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
            border: 0;
            border-radius: 1rem;
        }

        .card-imgcus,
        .card-img-topcus {
            border-top-left-radius: calc(1rem - 1px);
            border-top-right-radius: calc(1rem - 1px);
        }

        .cardcus h5 {
            overflow: hidden;
            height: 56px;
            font-weight: 900;
            font-size: 1rem;
        }

        .card-img-topcus {
            width: 100%;
            max-height: 180px;
            object-fit: contain;
            padding: 30px;
        }

        .cardcus h2 {
            font-size: 1rem;
        }

        .cardcus:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
        }

        .containercus {
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
            background-color: rgba(0, 0, 0, .08);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="containercus">

        <h3>A demo of Bootstrap Card</h3>

        <div class="row">

            <div class="col-sm-4">
                <div class="cardcus">
                    <img class="card-img-topcus" src="Images/Ba Giang Phong Te Thap 250V Nho.png" alt="the image alt text here">
                    <div class="card-body text-center">
                        <h4 class="Card-title">Services Title 1</h4>
                        <p class="card-text text-left">Place some text for the service 1 here. </p>
                        <a href="#" class="btn btn-warning">More info</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="cardcus">
                    <img class="card-img-topcus" src="Images/Ba Giang Phong Te Thap 250V Nho.png" alt="the image alt text here">
                    <div class="card-body text-center">
                        <h4 class="Card-title">Services Title 1</h4>
                        <p class="card-text text-left">Place some text for the service 1 here. </p>
                        <a href="#" class="btn btn-warning">More info</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="cardcus">
                    <img class="card-img-topcus" src="Images/Ba Giang Phong Te Thap 250V Nho.png" alt="the image alt text here">
                    <div class="card-body text-center">
                        <h4 class="Card-title">Services Title 1</h4>
                        <p class="card-text text-left">Place some text for the service 1 here. </p>
                        <a href="#" class="btn btn-warning">More info</a>
                    </div>
                </div>
            </div>
               
                 <div class="col-md-12"><p style="width:200px;white-space: normal;word-break: break-all"></p>
                    </div>
             <div class="col-md-12"><p style="width:200px;white-space: normal;word-break: break-all"></p>
                    </div>

            <div class="col-sm-4">
                <div class="cardcus">
                    <img class="card-img-topcus" src="Images/Ba Giang Phong Te Thap 250V Nho.png" alt="the image alt text here">
                    <div class="card-body text-center">
                        <h4 class="Card-title">Services Title Test</h4>
                        <p class="card-text text-left">Place some text for the service 1 here. </p>
                        <a href="#" class="btn btn-warning">More info</a>
                    </div>
                </div>
            </div>
            

         </div>
     </div>
</asp:Content>

