<html lang="en">
<head>
  <title>Paperless | Admin Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="css/bootstrap.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

  <link href="extcss/index.css" rel="stylesheet">
  <link href="extcss/login.css" rel="stylesheet">
<script src="extjs/index.js"></script>
<link rel="shortcut icon" href="images/clg.jpg">
</head>
<body>
<!--header starts***********************************************************************8-->	
<header>
	<div class="container">	
 <div class="row">
    
    <div class="col-sm-2 col-md-6 col-lg-8">
     <img src="images/clglogo.jpg"></img>
    </div>
    <div class="col-sm-5 col-md-3 col-lg-2">
      
    </div>
  </div>
</div>
</header>
<!--hader ends*******************************************************************************-->
<!--hnavbar starts*******************************************************************************-->

<nav class="navbar navbar-inverse" >
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"></a>
    </div>
     <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-left">
        <li><a href="index.jsp">Home</a></li>

      </ul>

      <!-- <ul class="nav navbar-nav navbar-right">
      
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span>&nbspsign Up<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="fsignup.jsp">Faculty</a></li>
            <li><a href="ssignup.jsp">Student</a></li>
            
          </ul>
        </li>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-log-in"></span>&nbspLogin<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="flogin.jsp">Faculty</a></li>
            <li><a href="slogin.jsp">Student</a></li>
            
          </ul>
        </li>
        
      </ul> -->
    </div>
  </div>
</nav>
  <!--navbar ends*******************************************************************************-->
  <!-- /container -->
  
  <div class="container">
    <center>
    <p style="font-family:tahoma;font-size: 30px;text-decoration: underline">Admin Login</p>
   <div class="bottomShadow">
   
        <div class="card card-container">

            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
<!-- 
            <img id="profile-img" class="profile-img-card" src="images/student.gif" />
            <p id="profile-name" class="profile-name-card"></p> -->
            <form class="form-signin" action="/Paperless/alogin" method="post">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="username" required autofocus>
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
                <div id="remember" class="checkbox">
                   
                </div>
                <input  class="btn btn-lg btn-primary btn-block btn-signin" type="submit" value="Sign in">
            </form><!-- /form -->
            <a href="forgotpassword.html" class="forgot-password">
                Forgot the password?
            </a>
        </div>
      </div>
    </center>
    </div>
    <br>

      <!-- /card-container -->
<!-- footer starts********************************************************************-->
<div class="footer">
	 <li class="dropdown">

          <a class="dropdown-toggle" data-toggle="dropdown" style="color:white;cursor:pointer;margin-top:100px;font-family:robotoRegular;font-size: 12px;" href="#">@Suggestions<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Page 1-1</a></li>
            <li><a href="#">Page 1-2</a></li>
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li>


	         <div align="center">
	            <div style="margin-top: 10px;font-family: robotoRegular;font-size: 12px;">Copyright @ 2017 SGGSIE & T | 
	           <a style="color:white;cursor:pointer;" href="https://www.sggs.ac.in" target="_blank">About College</a></div>
	         <div><div class="sprite sprite-Top" data-ng-click="scrollTop();"></div></div>
	        </div>
		</div>
<!-- footer ends********************************************************************-->
</body>
</html>
