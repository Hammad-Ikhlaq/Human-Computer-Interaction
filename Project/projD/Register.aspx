<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="proj.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>All Television Database</title>

<style>
        .newc {
        color : white;
        }
            .button {
    background-color: red; /* Green */
    border: none;
    color: white;
    text-align: center;
    text-decoration: none;
    display: inline-block;
font-weight:400;
letter-spacing:2px;
font-family:'Roboto', sans-serif;
    text-transform: uppercase;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}
        .button2:hover {
    background-color: transparent; 
    color:  #feba02;
    border: 2px solid white;
}
        .button2 {
    background-color: transparent; 
    color: white; 
}

        </style>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Manor Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- bootstrap-css -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!--// bootstrap-css -->
    <!-- css -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
    <!--// css -->
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- font -->
    <link href="//fonts.googleapis.com/css?family=Montserrat:200,200i,300,400,400i,500,600,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    <!-- //font -->
    <!-- light-box -->
    <link rel="stylesheet" href="css/poposlides.css">
    <!-- //light-box -->


    <style>
       .button {
           align-content:center;
  padding: 15px 25px;
  font-size: 18px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #666;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: black
             
}

.button:active {
  background-color:black;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

        body {
    background-image: url('a2.jpg');
    background-repeat: no-repeat;
    }
      input {
        text-align :center;
      }
        .b {
    margin: 0;
    padding: 0;
    text-align: center; }
        .center {
    font-size: 18px;
      border-radius: 15px;

    text-align: center;
    width:40%;
    padding: 10px;
    margin: 80px auto;
    background: white;
  
}
       </style>
</head>
        
<script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
<script type="text/javascript">
    $(function () {
        $("#btnShowLogin").click(function () {
            $('#LoginModal').modal('show');

        });
    });
</script>
<script type="text/javascript">
    function ShowError() {
        $("#error").click();
    };
</script>

<body>
        <form id="form1" runat="server">

     <div>
          <button type="button" style="display:none;" id="error" class="btn btn-primary btn-lg" data-toggle="modal" 
              data-target="#ErrorModal"></button>
 
                      <div class="modal fade" id="ErrorModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;</button>
                <h4 class="modal-title" id="Error">
                    Error</h4>
            </div>
            <div class="modal-body">
                            <asp:Label ID="Er" runat="server" Text=""></asp:Label>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">
                    Close</button>
                
            </div>
        </div>
    </div>

</div>

              
              
              
                     <div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;</button>
                <h4 class="modal-title" id="ModalTitle">
                    Login</h4>
            </div>
            <div class="modal-body">
                <label for="Email1">
                    Email</label>
                <asp:TextBox ID="Email1" runat="server" CssClass="form-control" placeholder="Enter Email"
                    required />

                <br />
                <label for="Password">
                    Password</label>
                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"
                    placeholder="Enter Password" required />
                <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
                    <strong>Error!</strong>
                    <asp:Label ID="lblMessage" runat="server" />
                </div>
            </div>
            <div class="modal-footer">
           <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="loginAccount_Click" Class="btn btn-primary" />
            <button type="button" class="btn btn-default" data-dismiss="modal">
                    Close</button>
                
            </div>
        </div>
    </div>

</div>
          <div class="agile_wthree_nav">
            <nav class="navbar navbar-default">
                <div class="navbar-header navbar-left">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>


                    <img src="111.png" width="100" height="100"><a class="myc" href="index.html"><h1><span><i aria-hidden="true"></i></span>&nbsp;ATDB</a></h1>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->

                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                    <nav class="link-effect-8" id="link-effect-8">
                       <ul class="nav navbar-nav">
                            <li ><a href="INDEX.aspx">Home</a></li>
                            <li  id="btnShowLogin"><a>LogIn</a></li>
                           <li class="active" ><a href="Register.aspx">Sign Up</a></li>
                           <li><a href="Details.aspx">Details</a></li>
                           <li><a href="OpeningThisWeek.aspx">Opening This Week</a></li>
                            <li ><a href="ComingSoon.aspx">Coming Soon</a></li>
           <li><a href="News.aspx">NEWS</a></li>
                     
                            <li><a href="Help.aspx">HELP</a></li>
                        </ul>
               </nav>
                </div>
            </nav>

        </div>

        </nav>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
       <div class="b">
     <div class ="center">
        <img src="A.png" width ="120" height ="120">
    <h1>
        SIGNUP
        </h1 >
        <b>   Enter Username:<!--&nbsp;&nbsp;&nbsp;--></b>
      <br/>
           <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        <br /><br />
     
     <b>Enter Name:</b>
         <br />
        <asp:TextBox ID="Name" runat="server"></asp:TextBox>
        <br /><br />
     
        <b>Enter Email:</b>
         <br />
       <input  type="email" name="Email" placeholder="Enter Email" /><!-- <asp:TextBox ID="Email" placeholder="Enter Email" runat="server"></asp:TextBox>
       --> <br /><br />
      <b>  Enter Password:</b>
         <br />
       <input  type="password" name="Password" placeholder="Enter Password" /><br /><br />
        <b>   Enter Country:</b>
         <br />
        <asp:TextBox ID="Country" runat="server"></asp:TextBox>
        <br /><br />
     <b>   Enter Gender:(M/F)</b>
        <br />
         <asp:TextBox ID="Gender" runat="server"></asp:TextBox>
        <br /><br />
     <b>   Enter Age:</b>
        <br />
                 <asp:TextBox ID="Age" runat="server"></asp:TextBox>
        <br /><br />
     

        <asp:Button  class="button" ID="SignUp" runat="server" Text="Sign Up" 
          onclick="SignUp_Click" />
           <br /><br />
      <b>  <asp:Label ID="Message" runat="server" Text=""></asp:Label>
        </b>
        <br /><br />
    </div>
           </div>
    </form>
</body>
</html>
