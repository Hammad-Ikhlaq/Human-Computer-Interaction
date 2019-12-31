<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AWL.aspx.cs" Inherits="proj.AWL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Television Database</title>
    <style>
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

        .newc {
        color : white;
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

        <style>

               .bb2 {
           align-content:center;
  padding: 15px 25px;
  font-size: 18px;
  text-align: center;
  cursor: pointer;
  outline: none;

  background-color: #0e6a89;
  border: none;
  border-radius: 15px;
 color:white;
}

.bb2:hover {background-color: #0d1315;
color:white;
             
}

.bb2:active {
  background-color:#0d1315;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
  color:white;

}
.bo{
    border: none;
    height: 2px;
    /* Set the hr color */
    color: #333; /* old IE */
    background-color: #333; /* Modern Browsers */
}
.bk{
    border: none;
    height: 1px;
    /* Set the hr color */
    color: #333; /* old IE */
    background-color: #333; /* Modern Browsers */
}
    </style>

	<!-- bootstrap-css -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<!--// bootstrap-css -->
	<!-- css -->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!--// css -->
	<!-- css -->
	<link rel="stylesheet" href="css/team.css" type="text/css" media="all" />
	<!--// css -->
	<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
	<!-- font-awesome icons -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- //font-awesome icons -->
	<!-- font -->
	<link href="//fonts.googleapis.com/css?family=Montserrat:200,200i,300,400,400i,500,600,700" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
	<!-- //font -->


</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div>
<div class="inner_agile_pages">
		<div class="main_agileits">
			<div class="agile_wthree_nav">
				<nav class="navbar navbar-default">
					<div class="navbar-header navbar-left">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>        <img src="111.png" width="100" height="100"><a class="myc" href="index.html"><h1><span><i aria-hidden="true"></i></span>&nbsp;ATDB</a></h1>
            
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->

					<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
						<nav class="link-effect-8" id="link-effect-8">
			      <ul class="nav navbar-nav">
                            <li ><a href="LoggedIn.aspx">Home</a></li>
                            <li ><a href="Polls.aspx">Polls</a></li>
                           <li class="active"><a href="WatchList.aspx">watchList</a></li>
                           <li ><a href="OpeningThisWeek.aspx">Opening This Week</a></li>
                            <li ><a href="ComingSoon.aspx">Coming Soon</a></li>
                            <li><a href="Details.aspx">Details</a></li>
                  <li><a href="News.aspx">NEWS</a></li>
                    
                            <li><a href="Help.aspx">HELP</a></li>
                <button class="button button2" type="button" id="Button2" OnServerClick="Logout_Click"  runat="server">
          LogOut </button>
          
                        </ul>
                  			</nav>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- //banner -->
	<!--/w3_short-->
	<div class="services-breadcrumb">
		<div class="agile_inner_breadcrumb">

			<ul class="w3_short">
				<li><a href="index.html">Home</a><span>|</span></li>
				<li>About</li>
			</ul>
		</div>
	</div>
	<!--//w3_short-->

	<!-- /banner_bottom_w3ls_agile -->
	<div class="banner_bottom_w3ls_agile">
		<div class="banner_bottom_w3ls_info">
            <h3 class="agile_heading">Add to list</h3>
            <hr class="bo"/>
		   <br /><br />
         <asp:PlaceHolder  runat="server" ID="pl"></asp:PlaceHolder>
                        <asp:Label ID="Message" runat="server" Text=""></asp:Label>

         <br /><br />
       </div>	</div>
	<!-- //banner_bottom_w3ls_agile -->
	<!-- //footer -->
	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/search.js"></script>
	<!-- start-smooth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
	    jQuery(document).ready(function ($) {
	        $(".scroll").click(function (event) {
	            event.preventDefault();
	            $('html,body').animate({
	                scrollTop: $(this.hash).offset().top
	            }, 1000);
	        });
	    });
	</script>
	<!-- start-smooth-scrolling -->
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
	    $(document).ready(function () {
	        /*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/

	        $().UItoTop({
	            easingType: 'easeOutQuart'
	        });

	    });
	</script>
	<!-- //here ends scrolling icon -->
		<!-- stats -->
	<script type="text/javascript" src="js/numscroller-1.0.js"></script>
	<!-- //stats -->
	<!-- carousel -->
	<script src="js/owl.carousel.js"></script>
	<script>
	    $(document).ready(function () {
	        $("#owl-demo").owlCarousel({
	            items: 1,
	            itemsDesktop: [768, 1],
	            itemsDesktopSmall: [414, 1],
	            lazyLoad: true,
	            autoPlay: true,
	            navigation: true,

	            navigationText: false,
	            pagination: true,

	        });

	    });
	</script>
	<script>
	    $(document).ready(function () {
	        $("#owl-demo2").owlCarousel({
	            items: 1,
	            itemsDesktop: [768, 1],
	            itemsDesktopSmall: [414, 1],
	            lazyLoad: true,
	            autoPlay: true,
	            navigation: true,

	            navigationText: false,
	            pagination: true,

	        });

	    });
	</script>
	<!-- //carousel -->
	<script src="js/bootstrap.js"></script>
    
        
      
    </div>
    </form>
</body>
</html>
