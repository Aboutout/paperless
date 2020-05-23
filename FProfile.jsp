<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.servlet.*"%>
    <%@ page import="java.servlet.http.*"%>
    <% 
   response.setHeader("cache-Control","no-cache,no-store,must-revalidate");
   response.setHeader("Pragma","no-cache");
   response.setHeader("Expires","0");
   Integer id1=(Integer)session.getAttribute("fid");
   String snippet=(String)session.getAttribute("code");
   String lang=(String)session.getAttribute("lang");
   String font=(String)session.getAttribute("font");
   String input=(String)session.getAttribute("input");
   String sflag=(String)session.getAttribute("sflag");
   String savecode=(String)session.getAttribute("savecode");
   String output=(String)session.getAttribute("output");
  String subject_t2=(String)session.getAttribute("subject_t1");
	String div_t2=(String)session.getAttribute("div_t1");
	String year_t2=(String)session.getAttribute("year_t1");
	String pracNo_t2=(String)session.getAttribute("pracNo_t1");
   String div_t="",subject_t="",year_t="",pracNo_t="";
   String div_t1="",subject_t1="",year_t1="",pracNo_t1="",x="";
   if(div_t2==null)div_t2="Division";
   if(subject_t2==null)subject_t2="Subject";
   if(year_t2==null)year_t2="Year";
   if(pracNo_t2==null)pracNo_t2="Practical";

   if(snippet==null)
   snippet="Your Code Goes Here.";
   if (savecode==null) 
   savecode="Your Code Goes Here.";
  
  if(lang==null) lang="Language ";
  if(font==null) font="Size";
 
  if(sflag==null)
    sflag="";

  if(output==null)
    output="";
  

  if(input == null)
    input="";
  
   int id=0;
   if(id1!=null)
   {                                                        
    id=id1;
  }
 else
   {
 response.sendRedirect("index.jsp");
} 


  

  String subject3="",subject1="",subject2="";

   String username_fac=(String)session.getAttribute("fusername");
   final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   final String DB_URL="jdbc:mysql://localhost:3306/paperless";
   final String USER = "root";
   final String PASS = "root";

   PreparedStatement ps=null;
   Connection conn=null;
       
     try
     {
   
      Class.forName(JDBC_DRIVER);
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      Statement st=conn.createStatement();
      String qry1=String.format("select subject,subject2,subject3 from Subjects where username='%s'",username_fac);
      ResultSet rs=st.executeQuery(qry1);

      if (rs.next()) {
       subject1=rs.getString("subject");
       subject2=rs.getString("subject2");
       subject3=rs.getString("subject3");
     } 
    }
    catch(Exception e)
    {
    out.println(e);
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
  <script src="https://rawgithub.com/ajaxorg/ace-builds/master/src/ext-emmet.js">  </script>
   <script src="https://rawgithub.com/nightwing/emmet-core/master/emmet.js"></script>
   <script type="text/javascript" src="js/fullscreen.js"></script>

   <link rel="stylesheet" type="text/css" href="extjs/DataTables/datatables.min.css"/>
 
  <script type="text/javascript" src="extjs/DataTables/datatables.min.js"></script>


  <link href="extcss/index.css" rel="stylesheet">
<script src="extjs/index.js"></script>
<link rel="shortcut icon" href="images/clg.jpg">
<link rel="stylesheet" href="extcss/ssidebar.css">
<style>
.btn{
  margin-top:10px;
}
.round {
    border: 2px solid;
    border-radius: 10px;
}
#editor { 
        width: 100%;
        height: 500px;
      
      position: relative;

       
    }
#editor2{ 
    width: 100%;
    height: 500px;
  
  position: relative;

   
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



/*tables styling*/

.dataTables_wrapper{
  max-width: 80% !important; 
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
        </div>
  </div>
</nav>
  <!--navbar ends*******************************************************************************-->
<!--left sidebar***********************************************************-->
<div class="left">
<div style="background:url('images/image5s.jpeg') no-repeat left 0px; height:150px;width: 100%;">

<div style="background:url('images/image5s.jpeg') no-repeat left 0px; height:150px;width: 100%;">
<img src="fimageretrive.jsp?id=<% out.println(id); %>" onerror="this.src = 'images/default.png'" class="img-circle"  width="100" height="100" style="margin-top: 20px;">
<form action="/Paperless/fimage?id=<% out.println(id); %>" method="post" enctype="multipart/form-data">
    <span class="select-wrapper" style="margin-top: -30px;">
    <input type="file" name="pic" id="upload1" >
    </span><br><br>
    <button type="submit" name="submit" title="Submit" style="float: right;margin-top: -40px;"><span class="glyphicon glyphicon-send"></span></button>
    </form>
</div>

</div>

<!-- <a  href="/Paperless/Stable.jsp" target="xyz"><button style="background-color: black;width: 100%;height: 30px;border:none;color:white;text-align: left;"><span class="glyphicon glyphicon-pencil"></span>&nbsp Your Submissions
          </button></a><hr style="margin-top: 0px;"> -->
 <ul type="none" style="margin-left: -50px;">
 <a  href="/Paperless/fdashboard.jsp" target="_blank">
 <li>
      <span class="glyphicon glyphicon-edit"></span>&nbsp IDE
          
      </li>
      </a>
      <a  href="/Paperless/Ftable.jsp" target="xyz">
      <li>
      <span class="glyphicon glyphicon-import"></span>&nbsp Get Student's Records
          
      </li>
      </a>
       <a  href="" target="xyz">
      <li>
      <span class="glyphicon glyphicon-import"></span>&nbsp Get Student's Practicals Records
          
      </li>
      </a>
      <a  href="/Paperless/InputPracList.jsp" target="xyz">
      <li>
      <span class="glyphicon glyphicon-upload"></span>&nbsp Upload Practical List
         
      </li>
       </a>
       <a  href="/Paperless/forgotpasswordf.jsp" target="xyz">
      <li>
      <span class="glyphicon glyphicon-user"></span>&nbsp Change Password
          
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
  <iframe src="Ftable.jsp" name="xyz" width="100%" height="100%" scrolling="no"></iframe>

<!--rigth sidebar ends***********************************************************-->
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

<!-- footer starts********************************************************************-->

<!-- footer ends********************************************************************-->
<!-- <%
   String yr3= (String)session.getAttribute("year");
      String listno=(String)session.getAttribute("list");
  if(listno==null) listno="List";
  if(yr3==null) yr3="Year";

%>
<form action="/Paperless/PracList.jsp" target="_blank">
      <textarea id="pracList" name="pracList" style="visibility: hidden;width: 0px;height: 0px"></textarea>
      <textarea id="yr3" name="yr3" style="visibility: hidden;width: 0px;height: 0px"></textarea>
      <textarea id="listno" name="listno" style="visibility: hidden;width: 0px;height: 0px"></textarea>
      <input type="submit" name="submit" id="ankit" style="visibility: hidden;width: 0px;height: 0px">
    </form>
<script type="text/javascript">
function changeListNo()
{
  var l = document.getElementById("ListSelector");
   var list = l.options[l.selectedIndex].value;
   $("#listno").val(list);
}
function changeYear()
{
var l = document.getElementById("year");
   var list = l.options[l.selectedIndex].value;
   $("#yr3").val(list);
}
function subject1()
{
var l = document.getElementById("subchoose");
   var list = l.options[l.selectedIndex].value;
   $("#pracList").val(list);
}
function getPracList()
{
  document.getElementById("ankit").click();
}
  
</script> -->

<form action="/Paperless/PracwiseList.jsp">
      <table>
        <tr>
            <td>
              <div  style="margin-left: 0px;">
              <select id="year" name="year" required="required" class="form-control" style="width: 120px" onchange="changeYear()">
              <option selected="selected">Year</option>
              <option value="FirstYear" >FirstYear</option>
              <option value="SecondYear">SecondYear</option>
              <option value="ThirdYear">ThirdYear</option>
              <option value="FinalYear">FinalYear</option>
              </select>
                </div>
              </td> 
             <td>
              <div  style="margin-left: 20px;">
              <select name="div" required="required" class="form-control" style="width: 100px">
              <option selected="selected">Division</option>
              <option value="A">A</option>
              <option value="B">B</option>
              
              
              

              </select>
                </div>
              </td>  
          <td>
              <div  style="margin-left: 20px;">
              <select name="subject"  class="form-control" id="subchoose" onchange="subject1()">
              <option selected="selected">Subject</option>
               <option value="C">C</option>
              <option value="C++">C++</option>
              <option value="JAVA" >JAVA</option>
              <option value="PHP">PHP(CL3) </option>
              <option value="DBMS">DBMS</option>
              <option value="PYTHON">PYTHON</option>
              <option value="HTML(CL1)">HTML(CL1)</option>
              <option value="HTML(CL2)">HTML(CL2)</option>
              <option value="DS(C)">DS(C)</option>
              <option value="DS(C++)">DS(C++)</option>
              <option value="DAA">DAA</option>
              

              </select>
                </div>
              </td> 
             <!--  <td>
                <div  style="margin-left: 20px;">
              <select name="pracno" class="form-control" style="width: 120px" multiple>
              <option value="p1" >Practical 1</option>
              <option value="p2">Practical 2</option>
              <option value="p3">Practical 3</option>
              <option value="p4">Practical 4</option>
              <option value="p5">Practical 5</option>
              <option value="p6" >Practical 6</option>
              <option value="p7">Practical 7</option>
              <option value="p8">Practical 8</option>
              <option value="p9">Practical 9</option>
              <option value="p10">Practical 10</option>
              <option value="p11">Practical 11</option>
             <option value="p12">Practical 12</option>
             <option value="p13">Practical 13</option>
              <option value="p14">Practical 14</option>
              <option value="p15">Practical 15</option>
              <option value="p16">Practical 16</option>

              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=pracNo_t2%></option>

              </select>
                </div>
              </td>  -->
              <td><input type="submit" name="submit" value="Get Records"></td>
              </tr>
              </table>
              </form>

 