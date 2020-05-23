<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.util.*"%>
    <%@ page import="javax.servlet.http.*"%>
    <% 
   response.setHeader("cache-Control","no-cache,no-store,must-revalidate");
   response.setHeader("Pragma","no-cache");
   response.setHeader("Expires","0");
   Integer id1=(Integer)session.getAttribute("fid");

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
  <title>Paperless | Records</title>
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


<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.0/css/buttons.dataTables.min.css">
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
table, th, td {
    border: 1px solid black;
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
      <!-- <li>
      <a  href="/Paperless/FacultyCharts.jsp"><span class="glyphicon glyphicon-picture"></span>&nbsp Charts
          </a>
      </li> -->
      <li>
      <a  href="/Paperless/FProfile.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp profile
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
  
String year = request.getParameter("year");
String div=request.getParameter("div");
String subject=request.getParameter("subject");
String s_code="";
if(subject.equals("CSE"))s_code="CS";
else if(subject.equals("IT"))s_code="IT";

String branch=(String)session.getAttribute("fbranch");
String[] prac_a=request.getParameterValues("pracno");


int i=1,c1=-1,c2=0,c3=0,c4=1;
boolean flag=false;
PreparedStatement ps=null;
PreparedStatement ps1=null;
ResultSet rs=null;
ResultSet rs1=null;
Connection con=null;
LinkedList<String> name_l=new LinkedList<String>();
LinkedList<String> username_l=new LinkedList<String>();
LinkedList<String> username_y_l=new LinkedList<String>();
LinkedList<String> pracno_l=new LinkedList<String>();
LinkedList<java.sql.Date>sdate_l=new LinkedList<java.sql.Date>();
LinkedList<Integer> status_l=new LinkedList<Integer>();
LinkedList<String> rollno_l=new LinkedList<String>();
Iterator username_y_i;
Iterator pracno_i;
Iterator sdate_i;
Iterator status_i;
Iterator username_y_i_d,pracno_i_d;
Iterator name_i=null;
Iterator username_i=null;
try
{
Class.forName("com.mysql.jdbc.Driver");
con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/paperless", "root", "root"); 
ps=con.prepareStatement("select * from signup where year=? and branch=?  and RollNo like '"+div+"%'  order by username");
ps.setString(1,year);
ps.setString(2,branch);

rs=ps.executeQuery();
while(rs.next())
{
name_l.add(rs.getString("name"));
username_l.add(rs.getString("username"));
rollno_l.add(rs.getString("RollNo"));
}
name_i=name_l.iterator();
username_i=username_l.iterator();

ps1=con.prepareStatement("select * from "+year+" where Subject=? and username like '%"+s_code+"%' ");
ps1.setString(1,subject);

rs1=ps1.executeQuery();
while(rs1.next())
{
username_y_l.add(rs1.getString("username"));
pracno_l.add(rs1.getString("PracNo"));
sdate_l.add(rs1.getDate("SDate"));
status_l.add(rs1.getInt("status"));
}

}
catch(Exception e){}
%>
<button onclick="printDiv('printableArea')">Print</button>
<div id="printableArea">
<table class="display" id="table_id">
  <thead>
  <tr>
  <th>Sr.No</th>
  <th>Reg.No</th>
  <th>Roll.No</th>
  <th>Name</th>
  <th colspan="16">Practicals(Date)(Status)</th>
  </tr>
  </thead>
<tbody>

<%
try{
while(username_i.hasNext())
{
%><%
c1++;
String uname_d=(String)username_i.next();
username_y_i=username_y_l.iterator();
while(username_y_i.hasNext())
{ 

String uname_y_d=(String)username_y_i.next();//out.println(uname_y_d+uname_d+"<br>");
if(uname_d.contains(uname_y_d))
{
  if(flag==false)
  {
  flag=true;
  %><tr><td><%=c1+1%></td><td><%=username_y_l.get(c2)%></td><td><%=rollno_l.get(c1)%></td><td><%=name_l.get(c1)%></td><%
  }
  %>
  <td><%=pracno_l.get(c2)%> (<%=sdate_l.get(c2)%>) (<%=status_l.get(c2)%>)</td>
  <%
}
c2++;
}
c2=0;
%></tr><%
flag=false;
}
c1=0;
}
catch(Exception e)
{
//out.println(e);
}


%>
</tbody>
</table>
</div>
<script type="text/javascript">
$(document).ready(function() {
    $('#table_id').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'print'
        ]
    } );
} );

function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
</script>
</body>

</html>
