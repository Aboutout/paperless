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
   String snippet=(String)session.getAttribute("fcode");
   String sub=(String)session.getAttribute("fsub");
   String lang=(String)session.getAttribute("flang");
   String font=(String)session.getAttribute("ffont");
   String input=(String)session.getAttribute("finput");
   String sflag=(String)session.getAttribute("fsflag");
   String savecode=(String)session.getAttribute("fsavecode");
   String output=(String)session.getAttribute("foutput");
   String subject_t2=(String)session.getAttribute("subject_t1");
	 String div_t2=(String)session.getAttribute("div_t1");
	 String year_t2=(String)session.getAttribute("year_t1");
	 String pracNo_t2=(String)session.getAttribute("pracNo_t1");
   String div_t="",subject_t="",year_t="",pracNo_t="";
   String div_t1="",subject_t1="",year_t1="",pracNo_t1="",x="";
   if(div_t2==null)div_t2="Select Division";
   if(subject_t2==null)subject_t2="Select Subject";
   if(year_t2==null)year_t2="Select Year";
   if(pracNo_t2==null)pracNo_t2="Select Practical";

   if(snippet==null)
   snippet="Your Code Goes Here.";
   if (savecode==null) 
   savecode="Your Code Goes Here.";
  
  if(lang==null) lang="Select Language ";
  if(font==null) font="Select Size";
  if(sub==null) sub="Select Subject";
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
  <script src="https://rawgithub.com/ajaxorg/ace-builds/master/src/ext-emmet.js">  </script>
   <script src="https://rawgithub.com/nightwing/emmet-core/master/emmet.js"></script>
   <script type="text/javascript" src="js/fullscreen.js"></script>

   


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

.elements
{
  margin-top: 12px;
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
          <a  href="/Paperless/FProfile.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp Profile
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
  

      <!--editor body starts****************************************************************************************************************-->
<!-- <div class="container">
  <div class="row">  -->

  <table>
  <tr>
  <td>
    
    <div class="panel panel-default" style="margin-left: 10px;height: 710px;width: 760px;box-shadow: 0px -2px 10px 2px black;">
        <div class="panel-heading">
        <table>
        <tr>
        <td>
            <h3 class="panel-title">Editor1</h3>
        </td><td><div style="margin-left: 50px;"></td>
        <td >
              <div style="margin-bottom: :0px;">
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
              <div  style="margin-left: 20px;">
              <select id="SubjectSelector" onchange="changeSubject()" name="subject" required="required" class="form-control  SubjectSelector">
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
              
              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=sub%></option>

              </select>
                </div>
              </td>  
              <td>
                <div  style="margin-left: 20px;">
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
              
              
           <!--   <td ><div style="margin-left: 20px;"> <input type="button" class="btn btn-default " name="submit" value="Submit" onclick="submitCode()" id="submit2"></td></div> -->
              <td><div style="margin-left: 20px;padding-bottom:13px;">
              <input type="button" class="btn btn-primary"  name="run" value="Run" onclick="data()" href="#inp">
              </div></td>

              <td> <div style="margin-left: 20px;padding-bottom:13px;"><button type="button" class="btn btn-default btn-sm" onclick="toggleFullScreen()">
              <span class="glyphicon glyphicon-fullscreen"></span> Fullscreen 
              </button></div></td>
              
              </tr>
            
              </table>

        </div>


        <div class="panel-body" >
            <div id="editor">
                </div>
        </div>
        
    </div>
    </td><td>
    
<!-- </div>
</div> -->

<!-- <div class="row" height="300px" cellspacing="10px" id="inp" >
  <div class="col-md-5" > -->

  <table >
  <tr>
  <form  action="/Paperless/fdata"  method="post">
  <td>
 <div class="panel panel-default" style="margin-top: -2px;margin-left: 20px;">
        <div class="panel-heading">
          <h3 class="panel-title" style="margin:1px -10px 20px 20px;">Input goes here For Editor.....</h3>
          <textarea style="height: 220px;width:450px;box-shadow:2px -2px 10px 2px  black;" name="input" id="input"><%=input %></textarea>
    <td>
    <textarea style="height:0px;width:0px; visibility: hidden;" name="content1" id="content1"><%=snippet %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;" name="content2" id="content2"><%=font %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;"  name="content3" id="content3"><%=lang %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;"  name="content4" id="content4"><%=sub %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;" name="content6" id="content6"><%=savecode %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;" name="content7" id="content7"><%=sflag%></textarea>
    <input type="submit" name="submit" id="submit" style="visibility: hidden;height:0px;width:0px;">
    </td></div></div></td></form></tr><tr>

    <td>
      <div class="panel panel-default" style="margin-left: 20px;" >
        <div class="panel-heading">
          <h3 class="panel-title" style="margin:1px -10px 20px 20px;">Output For Editor.....</h3>
          <textarea style="height: 350px;width:450px;box-shadow:2px -2px 10px 2px  black;" name="output" id="output"><%=output %></textarea>

    </td>
   </tr>
   </table></td></tr>
   </table>
   

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
<script src="src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
 <script src="src-noconflict/ext-language_tools.js"></script>

<script type="text/javascript">
	 var editor = ace.edit("editor");
     editor.setValue($("#content1").val(),1);

    editor.setTheme("ace/theme/twilight");
    editor.getSession().setMode("ace/mode/c_cpp");
    document.getElementById('editor').style.fontSize='15px';

  require("ace/ext/emmet");
  editor.setOption("enableEmmet", true);
</script>
<!-- Editor1#######################################################################################################-->
<script>


 var strUser;
 var strUser1,subName;

 window.onload = function() {
    var editor = ace.edit("editor");

var f=$("#content7").val();
 if(f == "true"){
 editor.setValue($("#content1").val(),1);
 $("#content7").val("false");
   $('#textBox').val($("#content1").val());

   // window.scrollTo(0,document.body.scrollHeight);

}
  else
  {
  editor.setValue($("#content6").val(),1);
  $('#textBox').val($("#content6").val());

}

 strUser1=$("#content2").val();
 strUser=$("#content3").val();
 subName=$("#content4").val();
 editor.getSession().setMode("ace/mode/"+strUser);
 document.getElementById('editor').style.fontSize=strUser1;


};

function changeLanguage(){
  var editor = ace.edit("editor");
   var e = document.getElementById("languageSelector");
   strUser = e.options[e.selectedIndex].value;
    editor.getSession().setMode("ace/mode/"+strUser);
    editor.setTheme("ace/theme/twilight");
    ace.require("ace/ext/language_tools");
    editor.setOptions({
    enableBasicAutocompletion: true,
    enableSnippets: true,
    enableLiveAutocompletion: false
    });
    
  }
   
  function changeFont(){
    var e1 = document.getElementById("fontSelector");
    strUser1= e1.options[e1.selectedIndex].value;
    document.getElementById('editor').style.fontSize=strUser1;

  }

  function changeSubject()
   {
      var e1 = document.getElementById("SubjectSelector");
    subName= e1.options[e1.selectedIndex].value;

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
      $("#output").val(" ");

    flag="editor1";
    var textarea = $('#content1');
    textarea.val(editor.getSession().getValue());
    document.getElementById("submit").click();
  }
  function update()
  {
  	var s=prompt("Enter value");
  	$('#status').val(s);
  	document.getElementById("status_s").click();

  }

 
  function checkFlag(){
    boolean = (flag == 'editor1');
    runflag=true;
  }

$(document).ready(function(){

    $("input").click(function(){
    
      checkFlag();
      if (flag == 'editor1') {
       
      $("form").attr("action", "/Paperless/fdata?lang="+strUser+"&font="+strUser1+"&flag="+runflag+"&sub="+subName);
     }
     
      
    });
});

function Down()
{
  alert("File is Downloaded to Home Directory");
}

function year_prac_selector()
{
  var e1 = document.getElementById("year_prac_select");
  var year_value= e1.options[e1.selectedIndex].value;
  $('#year_dropdown').val(year_value);
}
function sub_prac_selector()
{
  var e1=document.getElementById("sub_prac_select");
  var sub_value=e1.options[e1.selectedIndex].value;
  $("#sub_dropdown").val(sub_value);
}
$(document).ready( function () {
    $('#table_id').DataTable();
} );
</script>
<!-- Editor1 ends########################################################################################################-->
<!-- PrepostSEO Plagiarism Checker Widget -->
<script type="text/javascript" src="//www.prepostseo.com/widget.js?"></script><div style="text-align: center; font-size:12px; color:#333;"><p ><a href="https://www.prepostseo.com/plagiarism-checker" target="_blank" style="color:#000;"></p></div>
</html>
<% session.removeAttribute("fsflag");%>



