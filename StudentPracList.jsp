<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.servlet.*"%>
    <%@ page import="java.servlet.http.*"%>
    <% 
   response.setHeader("cache-Control","no-cache,no-store,must-revalidate");
   response.setHeader("Pragma","no-cache");
   response.setHeader("Expires","0");
   String RollNo="",subject_t="",year_t="",name="",RegNo="";

   %>
<html lang="en">
<head>
  <title>Paperless | General</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="css/bootstrap.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="editorjs/lang.js"></script>
  <script src="https://rawgithub.com/ajaxorg/ace-builds/master/src/ext-emmet.js">  </script>
   <script src="https://rawgithub.com/nightwing/emmet-core/master/emmet.js"></script>
   <script type="text/javascript" src="js/fullscreen.js"></script>
   <link rel="stylesheet" type="text/css" href="extjs/DataTables/datatables.min.css"/>
 
  <script type="text/javascript" src="extjs/DataTables/datatables.min.js"></script>




  <link href="extcss/index.css" rel="stylesheet">
<script src="extjs/index.js"></script>
<link rel="shortcut icon" href="images/clg.jpg">
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
  width:80%;
  border-collapse: collapse;
  border:2px solid black;
}
.tab td{
  padding :7px;
  padding-top: 2px;
  border:2px solid black;

}
.tab tr:nth-child(odd){
  background-color:    #e5e8e8;
}
.tab tr:nth-child(even){
  background-color:   #ccd1d1 ;
}
th{
  text-align: center;
}
.abc{
  margin-top:-10px;
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
input[type="file"]{
  width:90;
}
input[type="submit"]{
  margin-left: 20px;
}
</style>
<script>
function color{
  document.bgColor='yellow';
}
</script>
</head>
<body>
<!--header starts***********************************************************************8-->  
<header>
  <div class="container"> 
 <div class="row">
    <div class="col-sm-5 col-md-3 col-lg-2">
      
    </div>
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
      <ul class="nav navbar-nav">
        <li><p style="font-size:25px;color: white;margin-right: 9px;margin-top: 5px"><% out.println((String)session.getAttribute("fname")); %></p></li>
        <li><p style="font-size:15px;color: white;margin-right: 9px;margin-top: 5px"><% out.println((String)session.getAttribute("fbranch"));%></p></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
    
      <li>
          <a  href="/Paperless/FProfile.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp Profile
          </a>
      </li>
      <li>
          <a  href="/Paperless/fdashboard.jsp"><span class="glyphicon glyphicon-edit"></span>&nbsp IDE
          </a>
      </li>
      <li>
      <a  href="/Paperless/forgotpasswordf.jsp"><span class="glyphicon glyphicon-lock"></span>&nbsp Change Password
          </a>
      </li>
       <li>
        <a  href="/Paperless/logout"><span class="glyphicon glyphicon-off"></span>&nbsp Log-out
          </a>
       </li>  
       
        
      </ul>
    </div>
  </div>
</nav>
  <!--navbar ends*******************************************************************************-->
  <%
	subject_t=request.getParameter("sub");
	RollNo=request.getParameter("RollNo");
	year_t=request.getParameter("year");
	name=request.getParameter("name");
	RegNo=request.getParameter("RegNo");
  %>
  <center>
 <div  class="pratik">
 <table>
  <td><p><%=RegNo%></p></td>
  <td><p><%=name%></p> </td>
   <td><p><%=RollNo%></p>  </td>
   <td><p><%=subject_t%></p>  </td>
   <td><p><%=year_t%></p></td>
   </table>
</div>
</center>
<br>
<style>
.pratik{
	box-shadow: 0px 0px 50px 8px black inset;
	width:450px;
	padding: 10px;
	line-height: 15px;
	border-radius: 6px;

}
.pratik td{
	padding: 15px;
	text-decoration: underline gray;
	
}
.dataTables_wrapper{
  max-width: 80% !important; 
}
</style>


  <center>
<table border=1 class="tab display" id="table_id">
     <thead><tr  style="background-color:white;"><th>Sr.No</th><th>Prac No.</th><th>Date</th><th>Status</th><th>Action</th></tr></thead><tbody>

     
<!--display records**************************************************************************************************************** -->

<%
  
int i=1;



Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String pcode="";

try {

Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paperless","root","root");

stmt = con.createStatement();
 String qry="select SDate,status,PracNo from "+year_t+" where  Subject='"+subject_t+"' and username='"+RegNo+"'  order by Subject,PracNo";
rs = stmt.executeQuery(qry);

while(rs.next()) {
String date=rs.getString("SDate");
String PracNo=rs.getString("PracNo");
int status=rs.getInt("status");
%>
<tr><td><%out.println(i);%></td><td><a href="#"><%out.println(PracNo);%></a></td><td><% out.println(date);%></td><td><% out.println(status);%></td><td><a href="Openf.jsp?RegNo=<%out.println(RegNo);%>&year=<%out.println(year_t);%>&pracNo=<%out.println(PracNo);%>&sub=<%out.println(subject_t);%>" onClick="Open()"  >Open</a>/<a href="Downloadf.jsp?RegNo=<%out.println(RollNo);%>&year=<%out.println(year_t);%>&pracNo=<%out.println(PracNo);%>&sub=<%out.println(subject_t);%>" onClick="Down()">Download</a></td></tr>
<%
  i++;
}
}
catch(Exception e)
{
out.println(e);
}
 %></tbody>
</table>
</center><br>
</body>
</html>
<script type="text/javascript">
$(document).ready( function () {
$('#table_id').DataTable();
} );
</script>
