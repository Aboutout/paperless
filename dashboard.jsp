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
   String snippet=(String)session.getAttribute("code");
   String lang=(String)session.getAttribute("lang");
   String font=(String)session.getAttribute("font");
   String input=(String)session.getAttribute("input");
   String sub=(String)session.getAttribute("sub");
   String pracNo=(String)session.getAttribute("pracNo");
   String sflag=(String)session.getAttribute("sflag");
   String savecode=(String)session.getAttribute("savecode");
   String output11=(String)session.getAttribute("output11");
   String listno=(String)session.getAttribute("list");


   String snippet2=(String)session.getAttribute("code2");
   String lang2=(String)session.getAttribute("lang2");
   String font2=(String)session.getAttribute("font2");
   String input2=(String)session.getAttribute("input2");
   String sub2=(String)session.getAttribute("sub2");
   String pracNo2=(String)session.getAttribute("pracNo2");
   String sflag2=(String)session.getAttribute("sflag2");
   String savecode2=(String)session.getAttribute("savecode2");
   String output21=(String)session.getAttribute("output21");



   if(snippet==null)
   snippet="Your Code Goes Here.";
   if (savecode==null) 
   savecode="Your Code Goes Here.";
  if (savecode2==null) 
   savecode2="Your Code Goes Here.";
  if(lang==null) lang="Language";
  if(font==null) font="Size";
  if(sub==null) sub="Subject";
  if(pracNo==null) pracNo="Practical";
  if(sub2==null) sub2="Subject";
  if(pracNo2==null) pracNo2="Practical";  
  if(snippet2==null)
    snippet2="Your Code Goes Here.";
  if(sflag==null)
    sflag="";
  if(sflag2==null)
    sflag2="";

  if(input == null)
    input="";
  if(input2==null)
    input2="";
  if(listno==null) listno="List";

  if(lang2==null) lang2="Language";
  if(font2==null) font2="Size";

  if(output11==null)output11=" ";
  if(output21==null)output21=" ";
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
  <title>Paperless | Dashboard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="css/bootstrap.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="editorjs/lang.js"></script>
  <script type="text/javascript" src="js/fullscreen.js"></script>
  <script src="https://rawgithub.com/ajaxorg/ace-builds/master/src/ext-emmet.js">  </script>
   <script src="https://rawgithub.com/nightwing/emmet-core/master/emmet.js"></script>
   <script type="text/javascript" src="js/fullscreen.js"></script> 
   <script src="src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
   <script src="src-noconflict/ext-language_tools.js"></script>


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
#editor { 
        width: 100%;
        height: 580px;
        position: relative;   
    }
#editor2{ 
        width: 100%;
        height: 580px;
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
</style>
<script>
function color{
  document.bgColor='yellow';
}

</script>
 <script>
  $(document).ready(function() {
    var ctrlDown = false,
        ctrlKey = 17,
        cmdKey = 91,
        vKey = 86,
        cKey = 67;

    $(document).keydown(function(e) {
        if (e.keyCode == ctrlKey || e.keyCode == cmdKey) ctrlDown = true;
    }).keyup(function(e) {
        if (e.keyCode == ctrlKey || e.keyCode == cmdKey) ctrlDown = false;
    });

    $(".no-copy-paste").keydown(function(e) {
        if (ctrlDown && (e.keyCode == vKey || e.keyCode == cKey)) return false;
    });
});
</script>
 
</head>
<body class="no-copy-paste" oncontextmenu="false">
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

<nav class="navbar navbar-inverse">
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
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <li>
      <a  href="/Paperless/StudentCharts.jsp"><span class="glyphicon glyphicon-picture"></span>&nbsp Charts
          </a>
      </li>
      <li>
      <a  href="/Paperless/profile.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp Profile
          </a>
      </li>
      <li>
      <a  href="/Paperless/forgetpassword.jsp"><span class="glyphicon glyphicon-lock"></span>&nbsp Change Password
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
 
<!--editor body starts****************************************************************************************************************-->
<!-- <div class="container">
  <div class="row"> 
    <div class="col-md-12"> -->
    <table>
    <tr>
    <td>
    <div class="panel panel-default" style="margin-left: 10px;height: 710px;width: 760px;box-shadow: 0px -2px 10px 2px black;">
        <div class="panel-heading">
        <table>
        <tr>
        <td>
            <h3 class="panel-title">Editor1</h3>
        </td><td><div style="margin-left: 10px;"></td></tr><tr>
        <td >
              <div style="margin-bottom:0px;margin-left: 0px;">
              <div class="form-group elements">
              <select id="languageSelector" onchange="changeLanguage()" name="lang" required="required" class="form-control languageSelector">
              <option value="c_cpp" >C </option>
              <option value="c_cpp">C++ </option>
              <option value="php">PHP</option>
              <option value="java">Java</option>
              <option value="python">Python </option>
              <option value="html">HTML </option>
              <option value="sql">SQL</option>
              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=lang %></option>

              </select>
              </div>
              </div>
              </td>
              <td>
                <div  style="margin-left:5px;">
              <select id="fontSelector" onchange="changeFont()" name="font" required="required" class="form-control  fontSelector">
              <option value="10px" >10px</option>
              <option value="11px">11px </option>
              <option value="12px">12px</option>
              <option value="13px">13px</option>
              <option value="14px">14px</option>
              <option value="15px" >15px</option>
              <option value="16px">16px</option>
              <option value="17px">17px</option>
              <option value="18px">18px</option>
              <option value="19px">19px</option>
              <option value="20px">20px</option>
              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=font %></option>

              </select>
                </div>
              </td>
              <td>
              <div  style="margin-left: 5px;">
              <select id="SubjectSelector" onchange="changeSubject()" name="subject" required="required" class="form-control  SubjectSelector">
              <option value="C">C</option>
              <option value="CPP">CPP</option>
              <option value="JAVA" >JAVA</option>
              <option value="PHP">PHP(CL3) </option>
              <option value="DBMS">DBMS</option>
              <option value="PYTHON">PYTHON</option>
              <option value="HTML(CL1)">HTML(CL1)</option>
              <option value="HTML(CL2)">HTML(CL2)</option>
              <option value="DS(C)">DS(C)</option>
              <option value="DS(CPP)">DS(CPP)</option>
              <option value="DAA">DAA</option>
              
              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=sub%></option>

              </select>
                </div>
              </td>  
               <td>
                <div  style="margin-left: 5px;max-width: 150px"">
              <select id="pracSelector" onchange="changePrac()" name="prac" required="required" class="form-control  pracSelector">
              <option value="p1" >Practical No.1</option>
              <option value="p2">Practical No.2</option>
              <option value="p3">Practical No.3</option>
              <option value="p4">Practical No.4</option>
              <option value="p5">Practical No.5</option>
              <option value="p6" >Practical No.6</option>
              <option value="p7">Practical No.7</option>
              <option value="p8">Practical No.8</option>
              <option value="p9">Practical No.9</option>
              <option value="p10">Practical No.10</option>
              <option value="p11">Practical No.11</option>
             <option value="p12">Practical No.12</option>
             <option value="p13">Practical No.13</option>
              <option value="p14">Practical No.14</option>
              <option value="p15">Practical No.15</option>
              <option value="p16">Practical No.16</option>

              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=pracNo%></option>

              </select>
                </div>
              </td>  
                
              <td><div style="margin-left:5px;margin-bottom: 8px"><input type="button" class="btn btn-primary"  name="run" value="Run" onclick="data()"></div></td>

              <td>
              <div  style="margin-left: 5px;">
              <select id="ListSelector" onchange="changeListNo()" name="listno" required="required" class="form-control  ListSelector">
              <option value="1">List 1</option>
              <option value="2">List 2</option>
              <option value="3">List 3</option>
              <option value="4">List 4</option>
              
              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;">List</option>

              </select>
                </div>
              </td>  
              <td ><div style="margin-left: 5px;margin-bottom: 8px;"> <input type="button" class="btn btn-default " name="submit" value="Prac List" onclick="submitCode()" id="submit2"></div></td>
              <td> <div style="margin-left: 5px;padding-bottom:13px;margin-top: 10px;"><button type="button" class="btn btn-default btn-sm" onclick="toggleFullScreen()">
            <span class="glyphicon glyphicon-fullscreen"></span> Fullscreen 
              </button></div></td>
                  
             
              </tr>
            
              </table>
             </div>


        <div class="panel-body">
            <div id="editor" class="preventcopy">
                </div>
        </div>
        
    </div>
    </td>
    
    <!-- </div>
    
</div>
</div> -->
<td>

<table style="margin:0px 10px 0px 10px;">
  <tr>
  <td>
    <form  action="/Paperless/data"  method="post">

 <div class="panel panel-default" style="margin-top: -2px;">
        <div class="panel-heading">
          <h3 class="panel-title">Input goes here For 1st IDE.....</h3><br>
          <textarea style="height: 205px;width:450px;box-shadow:2px -2px 10px 2px  black;" name="input" id="input"><%=input %></textarea>
    
    <textarea  style="height:0px;width:0px; visibility: hidden;" name="content1" id="content1"><%=snippet %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;"  name="content2" id="content2"><%=font %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;"  name="content3" id="content3"><%=lang %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;"  name="content4" id="content4"><%=sub %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;"  name="content5" id="content5"><%=pracNo %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;" name="content6" id="content6"><%=savecode %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;" name="content7" id="content7"><%=sflag%></textarea>
    <input type="submit" name="submit" id="submit" style="visibility: hidden;height:0px;width:0px;">

    </form> 
    </td>
    </tr><tr>
 <td>
 <div class="panel panel-default" style="margin-left:0px;">
        <div class="panel-heading">
          <h3 class="panel-title">Output For 1st IDE.....</h3><br>
          <textarea style="height: 333px;width:450px;box-shadow:2px -2px 10px 2px  black;" name="input" id="input"><%=output11 %></textarea>
          </div>
          </div>

    </td> </tr></table>

    
   </td></tr></table>
 <!--editor body ends****************************************************************************************************************-->
<button onclick="myFunction()" style="height:50px;width:150px;background-color: #081b3a;color:white;
font-family:sans-serif; position:fixed;top:10px;right:10px;
border-radius: 8px;">Go to 2nd IDE</button>
 
<!-- editor body starts****************************************************************************************************************-->
 <!-- <div class="container">
  <div class="row"> 
    <div class="col-md-12"> -->
    <div id="hideshow">
     <table>
    <tr>
    <td>
    <div class="panel panel-default" style="margin-left: 10px;height: 710px;width: 760px;box-shadow: 0px -2px 10px 2px black;">
        <div class="panel-heading">
        <table>
        <tr>
        <td>
            <h3 class="panel-title">Editor2</h3>
        </td><td><div style="margin-left: 50px;"></td>
        <td >
              <div style="margin-bottom: :0px;">
              <div class="form-group elements">
              <select id="languageSelector2" onchange="changeLanguage2()" name="lang" required="required" class="form-control languageSelector2">
              <option value="c_cpp" >C </option>
              <option value="c_cpp">C++ </option>
              <option value="php">PHP</option>
              <option value="java">Java</option>
              <option value="python">Python </option>
              <option value="html">HTML </option>
              <option value="sql">SQL</option>
              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=lang2 %></option>

              </select>
              </div>
              </div>
              </td>
              <td>
                <div  style="margin-left: 20px;">
              <select id="fontSelector2" onchange="changeFont2()" name="font" required="required" class="form-control  fontSelector2">
              <option value="10px" >10px</option>
              <option value="11px">11px </option>
              <option value="12px">12px</option>
              <option value="13px">13px</option>
              <option value="14px">14px</option>
              <option value="15px" >15px</option>
              <option value="16px">16px</option>
              <option value="17px">17px</option>
              <option value="18px">18px</option>
              <option value="19px">19px</option>
              <option value="20px">20px</option>

              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=font2 %></option>

              </select>
                </div>
              </td>
              <td>
              <div  style="margin-left: 20px;">
              <select id="SubjectSelector2" onchange="changeSubject2()" name="subject2" required="required" class="form-control  SubjectSelector2">
              <option value="C">C</option>
              <option value="CPP">C++</option>
              <option value="JAVA" >JAVA</option>
              <option value="PHP">PHP(CL3) </option>
              <option value="DBMS">DBMS</option>
              <option value="PYTHON">PYTHON</option>
              <option value="HTML(CL1)">HTML(CL1)</option>
              <option value="HTML(CL2)">HTML(CL2)</option>
              <option value="DS(C)">DS(C)</option>
              <option value="DS(CPP)">DS(C++)</option>
              <option value="DAA">DAA</option>
              
              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=sub2%></option>

              </select>
                </div>
              </td>  
               <td>
                <div  style="margin-left: 20px;">
              <select id="pracSelector2" onchange="changePrac2()" name="prac2" required="required" class="form-control  pracSelector2">
              <option value="p1" >Practical No.1</option>
              <option value="p2">Practical No.2</option>
              <option value="p3">Practical No.3</option>
              <option value="p4">Practical No.4</option>
              <option value="p5">Practical No.5</option>
              <option value="p6" >Practical No.6</option>
              <option value="p7">Practical No.7</option>
              <option value="p8">Practical No.8</option>
              <option value="p9">Practical No.9</option>
              <option value="p10">Practical No.10</option>
              <option value="p11">Practical No.11</option>
             <option value="p12">Practical No.12</option>
             <option value="p13">Practical No.13</option>
              <option value="p14">Practical No.14</option>
              <option value="p15">Practical No.15</option>
              <option value="p16">Practical No.16</option>

              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=pracNo2%></option>

              </select>
                </div>
              </td>  
              
              <!-- <td ><div style="margin-left: 20px;"> <input type="button" onclick="submitCode55()" class="btn btn-default " name="submit" value="Submit"></td></div>  -->
               <td><div style="margin-left: 20px;"><input type="button" class="btn btn-primary" id="run2" name="run" value="Run" onclick="data2()"></div></td>

              <td> <div style="margin-left: 20px;"><button type="button" class="btn btn-default btn-sm" onclick="toggleFullScreen()">
              <span class="glyphicon glyphicon-fullscreen"></span> Fullscreen 
              </button></div></td>
                  
             
              </tr>
            
              </table>

        </div>


        <div class="panel-body">
            <div id="editor2">
                </div>
        </div>
        
    </div>
    </td>
    <td>
    <!-- </div>
    
</div>
</div> -->

  
   <table style="margin-left: 10px;margin-top: -3px;">
   <tr>
   <td>
    <form   action="/Paperless/data2" method="post">
    <textarea name="content21" id="content21"  style="height:0px;width:0px; visibility: hidden;"><%=snippet2%></textarea>
    <textarea name="content22" id="content22" style="height:0px;width:0px; visibility: hidden;"><%=font2 %></textarea>
    <textarea  name="content23" id="content23" style="height:0px;width:0px; visibility: hidden;"><%=lang2 %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;"  name="content24" id="content24"><%=sub2 %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;"  name="content25" id="content25"><%=pracNo2 %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;" name="content26" id="content26"><%=savecode2 %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;" name="content27" id="content27"><%=sflag2 %></textarea>
     <div class="panel panel-default" style="margin-left:-2px;margin-top: -10px;">
         <div class="panel-heading">
          <h3 class="panel-title">Input goes here For 2nd IDE.....</h3><br>
          <textarea style="height: 208px;width:470px;box-shadow:2px -2px 10px 2px  black;" name="input2" id="input2"><%=input2 %></textarea>
    </div></div>
    <input type="submit" name="submit55" id="submit55" style="visibility: hidden;height:0px;width:0px;" >
    </form></td>

    </tr><tr><td>
    <div class="panel panel-default" style="margin-left:0px;margin-top:-30px;">
        <div class="panel-heading">
          <h3 class="panel-title">Output For 2nd IDE.....</h3><br>
          <textarea style="height: 360px;width:470px;box-shadow:2px -2px 10px 2px  black;" name="input" id="input"><%=output21  %></textarea>
          </div>
          </div>
    </td>
   </tr></table>
   </td></tr></table></div>
   
   <%
   String yr3= (String)session.getAttribute("year");
   %>
    <form action="/Paperless/PracList.jsp" target="_blank">
      <textarea id="pracList" name="pracList" style="visibility: hidden;width: 0px;height: 0px"></textarea>
      <textarea id="yr3" name="yr3" style="visibility: hidden;width: 0px;height: 0px"><%=yr3%></textarea>
      <textarea id="listno" name="listno" style="visibility: hidden;width: 0px;height: 0px"><%=listno%></textarea>
      <input type="submit" name="submit" id="ankit" style="visibility: hidden;width: 0px;height: 0px">
    </form>




<!-- <div class="row"  >
  <div class="col-md-5" >
  <table>
  <tr>
  <td>
 <div class="panel panel-default" style="margin-left:50px;">
        <div class="panel-heading">
          <h3 class="panel-title">Output For 1st Editor.....</h3>
          <textarea style="height: 205px;width:500px;" name="input" id="input"><%=output11 %></textarea>
          </div>
          </div>

    <td>
  <td>
 <div class="panel panel-default" style="margin-left:20px;">
        <div class="panel-heading">
          <h3 class="panel-title">Output For 2nd Editor.....</h3>
          <textarea style="height: 205px;width:500px;" name="input" id="input"><%=output21  %></textarea>
          </div>
          </div>
    <td>
  </tr>
  </table>
  </div>
  </div> -->
<br>
 <!--editor body ends****************************************************************************************************************-->
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
<!-- java starts  here *************************************************************************************************--> 





<!--Editor2 starts######################################################################################################-->
<script type="text/javascript">
    var flag="";
 var strUser2;
 var strUser21;
  var editor2 = ace.edit("editor2");
var code;
 
function changeLanguage2(){
   var e = document.getElementById("languageSelector2");
   strUser2 = e.options[e.selectedIndex].value;
    editor2.setTheme("ace/theme/twilight");
    editor2.getSession().setMode("ace/mode/"+strUser2);
        ace.require("ace/ext/language_tools");
    editor2.setOptions({
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: false
    });
  }    editor2.setTheme("ace/theme/twilight");
    editor2.getSession().setMode("ace/mode/c_cpp");
    document.getElementById('editor2').style.fontSize='15px';

  require("ace/ext/emmet");
  editor2.setOption("enableEmmet", true);
   
  
  function changeFont2(){
    var e1 = document.getElementById("fontSelector2");
    strUser21= e1.options[e1.selectedIndex].value;
    document.getElementById('editor2').style.fontSize=strUser21;
  }
</script>

<script type="text/javascript">
  var editor2 = ace.edit("editor2");

  function data2()
  { 
     flag="editor2";
    var textarea1 = $('#content21');
    textarea1.val(editor2.getSession().getValue());
    code=editor2.getSession().getValue();
   document.getElementById("submit55").click();
  }

 

  

</script>

<!-- Editor2 ends#####################################################################################################-->


<!-- Editor1#######################################################################################################-->
<script>


 var strUser;
 var strUser1,subName,pracNo;
 var subName2,pracNo2;
  var editor2 = ace.edit("editor2");

 window.onload = function() {
    var editor = ace.edit("editor");

var f=$("#content7").val();
 if(f == "true"){
   //window.scrollTo(0,document.body.scrollHeight);
 editor.setValue($("#content1").val(),1);
 $("#content7").val("false");
  // window.scrollTo(0,document.body.scrollHeight);

}
 else 
 {
  editor.setValue($("#content6").val(),1);
}
 strUser1=$("#content2").val();
 strUser=$("#content3").val();
 subName=$("#content4").val();
 pracNo=$("#content5").val();
 editor.getSession().setMode("ace/mode/"+strUser);
 document.getElementById('editor').style.fontSize=strUser1;
 //editor.setValue($("#content6").val(),1);
 var x = document.getElementById("hideshow");
  x.style.display = "none";


 editor2.setValue($("#content21").val(),1);
 strUser21=$("#content22").val();
 strUser2=$("#content23").val();
 subName2=$("#content24").val();
 pracNo2=$("#content25").val();
 editor2.getSession().setMode("ace/mode/"+strUser2);
 document.getElementById('editor2').style.fontSize=strUser21;
 editor.getSession().setUseSoftTabs(true);
 editor.getSession().setUseWrapMode(true);
 editor.setHighlightActiveLine(false);
};

function changeLanguage(){
  var editor = ace.edit("editor");
   var e = document.getElementById("languageSelector");
   strUser = e.options[e.selectedIndex].value;
    editor.setTheme("ace/theme/twilight");
    editor.getSession().setMode("ace/mode/"+strUser);
        ace.require("ace/ext/language_tools");
    editor.setOptions({
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: false
    });
    
  }

  var editor = ace.edit("editor");

    editor.setTheme("ace/theme/twilight");
    editor.getSession().setMode("ace/mode/c_cpp");
    document.getElementById('editor').style.fontSize='15px';

  require("ace/ext/emmet");
  editor.setOption("enableEmmet", true);
   

   function changeSubject()
   {
      var e1 = document.getElementById("SubjectSelector");
    subName= e1.options[e1.selectedIndex].value;
    $("#pracList").val(subName);
   
   }
   function changeSubject2()
   {
      var e1 = document.getElementById("SubjectSelector2");
    subName2= e1.options[e1.selectedIndex].value;
   
   }

  
  function changeFont(){
    var e1 = document.getElementById("fontSelector");
    strUser1= e1.options[e1.selectedIndex].value;
    document.getElementById('editor').style.fontSize=strUser1;


  }
  function changePrac()
  {
     var e1 = document.getElementById("pracSelector");
    pracNo= e1.options[e1.selectedIndex].value;
  }
  function changePrac2()
  {
     var e1 = document.getElementById("pracSelector2");
    pracNo2= e1.options[e1.selectedIndex].value;
  }

   function Open()
  {

        runflag=false;
        $('#content7').val("false");

  }
</script>

<script type="text/javascript">
  var editor = ace.edit("editor");
  var boolean,runflag=false;
  var index=0,index2=0;
  function data()
  { 
    flag="editor1";
    var textarea = $('#content1');
    textarea.val(editor.getSession().getValue());
    document.getElementById("submit").click();
  }

 
  function checkFlag(){
    boolean = (flag == 'editor1');
    runflag=true;
  }

$(document).ready(function(){
    $("input").click(function(){
    
      checkFlag();
      if (flag == 'editor1') {
       
      $("form").attr("action", "/Paperless/data?lang="+strUser+"&font="+strUser1+"&sub="+subName+"&prac="+pracNo+"&flag="+runflag);
     }
     else if(flag=='editor2')
     {
           $("form").attr("action", "/Paperless/data2?lang="+strUser2+"&font="+strUser21+"&sub="+subName2+"&prac="+pracNo2);
     }
    
      
    });
});
function down()
{
  alert("Your File is Downloaded to home Directory");
}

function submitCode()
{
  document.getElementById("ankit").click();
}

function myFunction() {
    var x = document.getElementById("hideshow");
    if (x.style.display == "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
function changeListNo()
{
  var l = document.getElementById("ListSelector");
   var list = l.options[l.selectedIndex].value;
  $("#listno").val(list);
}
</script>
<!-- Editor1 ends########################################################################################################-->
</html>
<% session.removeAttribute("sflag");%>
<% session.removeAttribute("sflag2");%>
