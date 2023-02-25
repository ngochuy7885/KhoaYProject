<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestPopupMenu.aspx.cs" Inherits="TestPopupMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Dragable and resizable  bootstrap modal</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- font awesome  -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    
    <!-- <script src="static/js/jquery.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

 
      <style type="text/css">
    .border_dot{
  border:1px dashed #ccc;
}

#dragable_modal {
  position: relative;
}

#dragable_modal .modal-dialog {
  position: fixed;
  max-width: 100%;
  box-shadow: 0 0 5px rgba(0,0,0,.5);
  background: var(--white);
  /* width:500px; */
  margin: 0;
  /* padding: 20px; */
  /* overflow: hidden; */
  /* resize: both; */
}

#dragable_modal .modal-content {
  /* padding: 20px; */
  height: 400px;
  overflow: hidden;
  resize: both;
  width:500px;
}


#dragable_modal .modal-body{
  height:relative;
  overflow-x: hidden;
  overflow-y: auto;
}
#dragable_modal .modal-header{
  background: var(--dark);
  color: var(--white);
  border-bottom: 0px;
  padding: 0px;
}
#dragable_modal .modal-header h3{
  color: var(--white);
  font-size: 18px;
}
#dragable_modal .close_btn{
    top: -2px;
    margin: 0px !important;
    opacity: 1;
    width: 30px;
    height: 30px;
    padding: 0px;
    color: #fff;
}

.custom_tab_on_editor{
  background: var(--orange);
    padding: 0px;
    margin: 0px;
}

.custom_tab_on_editor .nav-item{
  margin-bottom: 0px;
}
.custom_tab_on_editor .nav-item .nav-link {
  min-width: 100px;
  text-align: center;
  border: 0px solid transparent;
  border-radius: 0px;
  padding: 10px;
  color:var(--white)
}

.custom_tab_on_editor .nav-item .nav-link:hover {
    color: #ffffff;
    border-width: 0px;
    background: #ffb586;
    border-bottom: 0px solid transparent;
}


.custom_tab_on_editor .nav-item.show .nav-link, .custom_tab_on_editor .nav-link.active {
  color: #ffffff;
  border-width: 0px;
  background: #ffb586;
  border-bottom: 0px solid transparent;
  position: relative;
}
.dragable_touch{
  cursor: move;
}

.custom_tab_on_editor .nav-item.show .nav-link:before, .custom_tab_on_editor .nav-link.active:before{
    content: '';
    border-bottom: 10px solid var(--white);
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    position: absolute;
    bottom: 0px;
    left:50%;
    transform: translateX(-50%);
}
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
  

   <div class="container-fluid">
        <div class="row d-flex justify-content-center pt-5  h-100">
            <div class="col-6 p-4 text-center border_dot">
                <button class="btn btn-primary" id="edit_row_btn">
                    <i class="fas fa-pencil-alt"></i>Open dragable modal
                  </button>
            </div>
        </div>
    </div>

    <!-- dragable and editable bootsttrap modal modal -->
    <div class="modal fade" id="dragable_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" data-backdrop="static" data-keyboard="false">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header w-100">
            <div class="row m-0 w-100">
              <div class="col-md-12 px-4 p-2 dragable_touch d-block">
                <h3 class="m-0 d-inline">Edit row settings</h3>
                <button type="button" class="close close_btn" data-dismiss="modal" aria-label="Close" data-backdrop="static" data-keyboard="false"><i class="fa fa-times"></i></button>
              </div>


              <div class="col-md-12 p-0">
                <ul class="nav nav-tabs custom_tab_on_editor" id="myTab" role="tablist">
                  <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#row_seetings_general_tab" role="tab" aria-controls="home" aria-selected="true">General</a>
                  </li>
                  <li class="nav-item" role="presentation">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#row_seetings_design_tab" role="tab" aria-controls="profile" aria-selected="false">Design</a>
                  </li>
                </ul>
              </div>
            </div>
            
          </div>

          <div class="modal-body p-3">
            
            <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade show active" id="row_seetings_general_tab" role="tabpanel" aria-labelledby="home-tab">
                <div class="form-group">
                  <label for="edit_project_name">Add row id</label>
                  <input type="text" class="form-control" id="row_id" >
                </div>
                <div class="form-group">
                  <label for="edit_project_name">Add extra class</label>
                  <input type="text" class="form-control" id="edit_project_name" />
                </div>
              </div>
              <div class="tab-pane fade" id="row_seetings_design_tab" role="tabpanel" aria-labelledby="profile-tab">...</div>
            </div>
          </div>

          <div class="modal-footer bg-light">
            <div class="row w-100">
              <div class="col-6">
                <button type="reset" class="btn btn-primary" data-dismiss="modal">Close</button>
              </div>
              <div class="col-6 text-right">
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>






<script type="text/javascript">

    // modal draggable

    $('#edit_row_btn').click(function () {


        //open modal
        $('#dragable_modal').modal({
            backdrop: false,
            show: true
        });
        // reset modal if it isn't visible
        if (!($('.modal.in').length)) {
            $('.modal-dialog').css({
                top: 20,
                left: 100
            });
        }

        $('.modal-dialog').draggable({
            cursor: "move",
            handle: ".dragable_touch"
        });
    });


    </script>

</asp:Content>

