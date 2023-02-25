<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Navbar.aspx.cs" Inherits="NavBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.8.3.min.js"></script>

    <script src="bootstrap-4.0.0-dist/js/jquery.min.js"></script>
    <script src="CSS/bootstrap-4.0.0-dist/js/bootstrap.min.js"></script>
    <link href="CSS/bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="CSS/bootstrap-4.0.0-dist/css/jquery-ui.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <div class="container">
                    <h1><a href="#" class="navbar-brand">Heavy Coding</a></h1>
                   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                      </button>
                    <div class="collapse navbar-collapse" id="mynav">
                        <ul class="navbar-nav ml-auto text-left">
                            <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                        </ul>
                    </div>
                </div>
         </nav>
        
    </div>

    </form>
</body>
</html>
