<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.servlet.*"%>
    <%@ page import="java.servlet.http.*"%>
    <% 
   response.setHeader("cache-Control","no-cache,no-store,must-revalidate");
   response.setHeader("Pragma","no-cache");
   response.setHeader("Expires","0");
   Integer id1=(Integer)session.getAttribute("id");
   int id=0;
   if(id1!=null)
   {                                                        
    id=id1;
  }
 else
   {
 response.sendRedirect("index.jsp");
} 
   %>
<html lang="en">
<head>
  <title>Paperless | Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="css/bootstrap.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="editorjs/lang.js"></script>
  <!--<script src="https://rawgithub.com/ajaxorg/ace-builds/master/src/ext-emmet.js">  </script>
   <script src="https://rawgithub.com/nightwing/emmet-core/master/emmet.js"></script>
   <script type="text/javascript" src="js/fullscreen.js"></script> -->
  <link rel="stylesheet" type="text/css" href="extjs/DataTables/datatables.min.css"/>
 
  <script type="text/javascript" src="extjs/DataTables/datatables.min.js"></script>

  <link href="extcss/index.css" rel="stylesheet">
<script src="extjs/index.js"></script>
<link rel="shortcut icon" href="images/clg.jpg">
<!-- chart-->
<link rel="stylesheet" href="extcss/ssidebar.css">
<style>
.btn{
  margin-top:10px;
}
.round {
    border: 2px solid;
    border-radius: 10px;
}

.elements
{
  margin-top: 12px;
}
.tab{
  width:100%;
  border-collapse: collapse;
  border:1px solid black;
  
}
.tab td{
  padding :7px;
  padding-top: 2px;
  border:1px solid black;

}
.tab tr:nth-child(odd){
  background-color:    #e5e8e8 !important;
}
.tab tr:nth-child(even){
  background-color:   #ccd1d1 ;
}
th{
  text-align: center;
}
.abc button{
  width:90px;
  padding-left: 1px;
  margin-left: 10px;
  height:25px;
}
.abc button:hover{
  box-shadow: 0px 0px 5px 2px black;
  transition: .8s;
}
.select-wrapper {
  background: url("images/upload.png") no-repeat;
  background-size: cover;
  display: block;
  position: relative;
  width: 43px;
  height: 25px;
  float: right;
}
#upload1{
 width: 43px;
  height: 25px;
  margin-right: 100px;
  opacity: 0;
  float: left;
}
.dataTables_wrapper{
  max-width: 80% !important; 
  max-height: 5% !important;
}
form{
  margin-top: -24px;
}
form button{
  float:right;
  margin-right: -44px;
  margin-top: 7px;
}
</style>
<script>
function color{
  document.bgColor='yellow';
}
function abc()
{
  window.open("profile_submit.html");
}
</script>
</head>
<body>
<!--header starts***********************************************************************8-->  
<header>
  <div class="container"> 
 <div class="row">
        <div class="col-sm-5 col-md-3 col-lg-2"></div>

    <div class="col-sm-4 col-md-7 col-lg-9">
     <img src="images/clglogo.jpg">
    </div>
    <div class="col-sm-4 col-md-2 col-lg-1"> 
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
      <ul class="nav navbar-nav">
       <li><p style="font-size:25px;color: white;margin-right: 9px;margin-top: 5px"><% out.print((String)session.getAttribute("name")); %></p></li>
        <li><p style="font-size:15px;color: white;margin-right: 9px;margin-top: 5px"><% out.print((String)session.getAttribute("branch"));%>(<% out.print((String)session.getAttribute("RollNo"));%>)</p></li>
        <li><p style="font-size:15px;color: white;margin-right: 9px;margin-top: 5px"><% out.print((String)session.getAttribute("RegNo"));%></p></li>
        <li><p style="font-size:15px;color: white;margin-right: 9px;margin-top: 5px"><% out.print((String)session.getAttribute("year"));%></p></li>
        
      
    </div>
  </div>
</nav>
<!--navbar ends*******************************************************************************-->
<!--left sidebar***********************************************************-->
<div class="left">
<div style="background:url('images/image5s.jpeg') no-repeat left 0px; height:150px;width: 100%;">
<img src="imagereterive.jsp?id=<% out.println(id); %>" onerror="this.src = 'images/default.png'" class="img-circle"  width="100" height="100" style="margin-top: 20px;">
<form action="/Paperless/image?id=<% out.println(id); %>" method="post" enctype="multipart/form-data">
    <span class="select-wrapper">
    <input type="file" name="pic" id="upload1" >
    </span><br>
    <button type="submit" name="submit" title="Submit"><span class="glyphicon glyphicon-send"></span></button>
    </form>
</div>

<!-- <a  href="/Paperless/Stable.jsp" target="xyz"><button style="background-color: black;width: 100%;height: 30px;border:none;color:white;text-align: left;"><span class="glyphicon glyphicon-pencil"></span>&nbsp Your Submissions
          </button></a><hr style="margin-top: 0px;"> -->
 <ul type="none" style="margin-left: -50px;">
 <a href="/Paperless/Stable.jsp" target="xyz">
 <li>
      <span class="glyphicon glyphicon-pencil"></span>&nbsp Your Submissions
      </li>
    </a>
     <a  href="/Paperless/StudentCharts.jsp" target="xyz">
      <li>
      <span class="glyphicon glyphicon-picture"></span>&nbsp Charts
      </li>
      </a>
      <a  href="/Paperless/dashboard.jsp" target="_blank" onclick="window.open(this.href, this.href); return false">
      <li>
      <span class="glyphicon glyphicon-edit"></span>&nbsp IDE
      </li>
      </a>
     <a  href="/Paperless/forgetpassword.jsp" target="xyz">
      <li>
      <span class="glyphicon glyphicon-lock"></span>&nbsp Change Password
      </li>
       </a>
       <a  href="/Paperless/logout">
       <li>
        <span class="glyphicon glyphicon-off"></span>&nbsp Log-out
        </li>
        </a>
       </ul>
   </div >
<!--left sidebar ends***********************************************************-->
<!--rigth sidebar***********************************************************-->
  <div class="right">
  <iframe src="Stable.jsp" name="xyz" width="100%" height="100%" scrolling="no"></iframe>
</div>
<!-- footer starts********************************************************************--> <br>
<div class="footer" style="margin-top: 10px;">
   


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