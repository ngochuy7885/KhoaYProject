<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestCard2.aspx.cs" Inherits="TestCard2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
      @media (min-width:356px) {
      .card-columns {
        column-count: 3;
      }
  }

  @media (min-width:576px) {
      .card-columns {
        column-count: 3;
      }
  }
    @media (min-width:768px) {
      .card-columns {
        column-count: 5;
      }
  }
  @media (min-width:992px) {
      .card-columns {
        column-count: 4;
      }
  }
  @media (min-width:1200px) {
      .card-columns {
        column-count: 5;
        color:red;
      }
  }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
       <div class="card-columns">
           <div class="card">
            <img class="card-img-top img-fluid" src="Images/Ba Giang Phong Te Thap 250V Nho.png" alt="Card image cap">
               <div class="card-title">test</div>
        </div>
           <div class="card">
            <img class="card-img-top img-fluid" src="Images/Ba Giang Phong Te Thap 250V Nho.png" alt="Card image cap">
        </div>
           <div class="card">
            <img class="card-img-top img-fluid" src="Images/Ba Giang Phong Te Thap 250V Nho.png" alt="Card image cap">
        </div>
           <div class="card">
            <img class="card-img-top img-fluid" src="Images/Ba Giang Phong Te Thap 250V Nho.png" alt="Card image cap">
        </div>
        </div>
    </div>
</asp:Content>

