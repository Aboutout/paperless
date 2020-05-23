<html lang="en">
<head>
  <title>Paperless</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="css/bootstrap.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

  <link href="extcss/index.css" rel="stylesheet">
<script src="extjs/index.js"></script>
<link rel="shortcut icon" href="images/clg.jpg">
<style type="text/css">
  .info{
    background-color: white;
    width:1140px;
    text-align: left;
    padding:20px;
    margin-top: 20px;
    margin-bottom: 20px;
    line-height:30px;

}
.footer{
  height: 100px;
}
</style>
</head>
<body oncontextmenu="return false">
<!--header starts***********************************************************************8-->	
<header>
	<div class="container">	
 <div class="row">
    <div class="col-sm-5 col-md-3 col-lg-2"></div>

    <div class="col-sm-2 col-md-6 col-lg-8">
     <img src="images/clglogo.jpg"></img>
    </div>
    <div class="col-sm-5 col-md-3 col-lg-2">
      
    </div>
  </div>
</div>
</header>
<!--hader ends*******************************************************************************-->
<nav class="navbar navbar-inverse " >
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
      <li>
      <a  href="/Paperless/AdminLogin.jsp"><span class="glyphicon glyphicon-pushpin"></span>&nbsp Admin
          </a>
      </li>
       
      </ul>  

      <ul class="nav navbar-nav navbar-right">
                   <li>
          <a  href="/Paperless/IDEExt.jsp"><span class="glyphicon glyphicon-edit"></span>&nbsp IDE
          </a>
      </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span>&nbspsign Up<span class="caret"></span></a>

          <ul class="dropdown-menu">
<!--             <li><a href="fsignup.jsp">Faculty</a></li>
-->            <li><a href="ssignup.jsp">Student</a></li>
            
          </ul>
        </li>


        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-log-in"></span>&nbspLogin<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="flogin.jsp">Faculty</a></li>
            <li><a href="slogin.jsp">Student</a></li>
            
          </ul>
        </li>
        
      </ul>
    </div>
  </div>
</nav>
  
<div class="container">

<!--corousel starts************************************************************************************-->
<div class="allblur">
  <div class="slider">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="images/Paperless1.jpg" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="images/Paperless2.jpg" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="images/3.jpg" alt="New york" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</div>
</div>
<!-- <center>
<div class="info">
<ul>
<li>We have designed this project to make the practical
      submissions paperless.</li>
<li>Through this webapp students of 
      Computer science stream can code online through 
     our IDE and can submit their codes.</li>
<li>Students can be able to  code in 
      different programming languages like C,C++,JAVA,Python,
       HTML,PHP,MySQL.</li>
<li>Faculty can also check student’s submitted practicals and 
      give them grading.</li>
<li>Faculty can also check whether the code is 
      plagiarised or not.</li>
<li>Our project is step towards saving papers leads to 
      conservation of  environment.</li>
<li>Our project is step towards saving papers leads to 
      conservation of  environment.</li>
<li> For different Programming languages we need different
     compilers but our webapp avoid this problem student
     does not need<br> to install any compiler on their own 
     system.</li>      


      </ul>                                                   
</div>
</center>
<div class="container">
  <div class="row">
    <div class="col-md-3">
      <img src="images/charts.png" height="500px" width="500px">
    </div>
    <div class="col-md-3"></div>
    <div class="col-md-6">Students can use graphical UI to examine their progress and Practical Submission</div>
  </div>
  <div class="row" style="margin-top: 10px">
    <div class="col-md-5">Students can use graphical UI to examine their progress and Practical Submission</div>
    <div class="col-md-2"></div>
    <div class="col-md-5">
      <img src="images/IDE.png" height="500px" width="500px">
    </div>
  </div>
   <div class="row">
    <div class="col-md-3">
      <img src="images/FProfile.png" height="500px" width="500px">
    </div>
    <div class="col-md-3"></div>
    <div class="col-md-6">Students can use graphical UI to examine their progress and Practical Submission</div>
  </div>
</div>
<div style="margin-bottom: 50px;"></div>



<!-- footer starts********************************************************************--> <br>
<div class="footer">
   


           <div align="center">
              <div style="margin-top:-15px;font-family: robotoRegular;font-size: 12px;color:black;"> 
              Designed and Developed by<br>
              <h4>Pratik Lahase and Ankit Chopade</h4>
             
          </div>
    </div>
</div>
<!-- footer ends********************************************************************-->
</body>
</html>
