<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestMessageBoxAlertBoostrap1.aspx.cs" Inherits="TestMessageBoxAlertBoostrap1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
.confirmed {
    margin: 0 auto;
    width: 300px;
    background: #fff;
    border: 1px solid #ccc;
    padding: 30px;
    text-align: center;
    position: fixed;
    top: 50%;
    transform: translate(-50%, -50%);
    left: 50%;
    box-shadow:0 0 10px rgba(0,0,0,0.4);
    font-family: 'Oswald', sans-serif;
}
.confirmed h5 {
    font-size: 50px;
    margin: 0px;
    color: #4CAF50;
}
.confirmed p {
    font-size: 20px;
    padding: 20px 0;
    font-weight: 300;
}
.confirmed button {
    background: #4CAF50;
    border-color: #4CAF50;
    color: #fff;
    font-size: 20px;
    padding: 8px 45px;
    border: 1px solid #4CAF50;
    border-radius: 4px;
}
.confirmed span.close {
    float: left;
    position: absolute;
    right: -15px;
    top: -18px;
    width: 30px;
    font-size: 30px;
    cursor: pointer;
    background: #4caf50;
    border-radius: 100px;
    height: 30px;
    color: #fff;
    line-height: 27px;
}
#loader {
    position: absolute;
    left: 50%;
    top: 50%;
    z-index: 1;
    width: 100px;
    height: 100px;
    margin: -75px 0 0 -75px;
    -webkit-animation: spin 2s linear infinite;
    animation: spin 2s linear infinite;
}
#loader img {
    max-width: 100%;
    height: auto;
    display: block;
}
@-webkit-keyframes spin {
    0% { -webkit-transform: rotate(0deg); }
    100% { -webkit-transform: rotate(360deg); }
}
@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>
      <title>Processing confirmation message popup with loader</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

</head>
<body onload="myLoder()">
    <form id="form1" runat="server">
        Hello World!<asp:Button ID="Button1" runat="server" Text="Button" />
    <div id="loader">
        <img src="Images/ajax-loading-icon-19.jpg">
    </div>
    <div class="confirmed" style="display:none;" id="confirmed">
        <span class="close">×</span>
        <h5>Done!</h5>
        <p> Your processing has been confirmed check your email for more info</p>
        <button class="close">OK</button>
        <button id="closebutton"  class="closebutton">Cancel</button>
    </div>
    </form>
    <script type="text/javascript">
            var timeOut;
            function myLoder() {
                timeOut = setTimeout(showConfirmedMessage, 1);
            }
            function showConfirmedMessage() {
                document.getElementById("loader").style.display = "none";
                document.getElementById("confirmed").style.display = "block";
            }
            $('.confirmed .close').click(function () {
                $('.confirmed').hide();
            });
            $('.confirmed .closebutton').click(function () {
                $('.confirmed').hide();
            });
    </script>
</body>
</html>
