<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.servlet.*"%>
    <%@ page import="java.servlet.http.*"%>
    <% 
  
   
   String snippet=(String)session.getAttribute("ecode");
   String lang=(String)session.getAttribute("elang");
   String font=(String)session.getAttribute("efont");
   String input=(String)session.getAttribute("einput");
   String output=(String)session.getAttribute("eoutput");
  
   if(snippet==null)
   snippet="Your Code Goes Here.";
   
  if(lang==null) lang="Language ";
  if(font==null) font="Size";
 
  

  if(output==null)
    output="";
  

  if(input == null)
    input="";
  

  

  
   %>

<html lang="en">
<head>
  <title>Paperless | IDE</title>
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
      <!-- <ul class="nav navbar-nav">
        <li><p style="font-size:25px;color: white;margin-right: 9px;margin-top: 5px"><% out.println((String)session.getAttribute("fname")); %></p></li>
        <li><p style="font-size:15px;color: white;margin-right: 9px;margin-top: 5px"><% out.println((String)session.getAttribute("fbranch"));%></p></li>
      </ul> -->

      <ul class="nav navbar-nav navbar-left">
       <li>
      <a  href="/Paperless/index.jsp"><span class="glyphicon glyphicon-back"></span>&nbsp Home
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
            <h3 class="panel-title">Editor</h3>
        </td><td><div style="margin-left: 150px;"></td>
        <td >
              <div style="margin-bottom: :0px;">
              <div class="form-group elements">
              <select id="languageSelector" onchange="changeLanguage()" name="lang" required="required" class="form-control languageSelector">
              <option value="c_cpp" >C </option>
              <option value="c_cpp1">C++ </option>
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
  <form  action="/Paperless/edata"  method="post">
  <td>
 <div class="panel panel-default" style="margin-top: -2px;margin-left: 20px;">
        <div class="panel-heading">
          <h3 class="panel-title" style="margin:1px -10px 20px 20px;">Input goes here For Editor.....</h3>
          <textarea style="height: 220px;width:450px;box-shadow:2px -2px 10px 2px  black;" name="input" id="input"><%=input %></textarea>
    <td>
    <textarea style="height:0px;width:0px; visibility: hidden;" name="content1" id="content1"><%=snippet %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;" name="content2" id="content2"><%=font %></textarea>
    <textarea style="height:0px;width:0px; visibility: hidden;"  name="content3" id="content3"><%=lang %></textarea>
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
 var strUser1;

 window.onload = function() {
    var editor = ace.edit("editor");


 editor.setValue($("#content1").val(),1);
 $("#content7").val("false");


 strUser1=$("#content2").val();
 strUser=$("#content3").val();
 editor.getSession().setMode("ace/mode/"+strUser);
 document.getElementById('editor').style.fontSize=strUser1;


};

function changeLanguage(){
  var editor = ace.edit("editor");
   var e = document.getElementById("languageSelector");
   strUser = e.options[e.selectedIndex].value;
   
    editor.setTheme("ace/theme/twilight");
    if (strUser == "c_cpp1")
    editor.getSession().setMode("ace/mode/c_cpp");
    else
    editor.getSession().setMode("ace/mode/"+strUser);
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
  

 
  function checkFlag(){
    boolean = (flag == 'editor1');
    runflag=true;
  }

$(document).ready(function(){

    $("input").click(function(){
    
      checkFlag();
      if (flag == 'editor1') {
       
      $("form").attr("action", "/Paperless/edata?lang="+strUser+"&font="+strUser1);
     }
     
      
    });
});


</script>
</html>


