<html lang="en">
<head>
  <title>Paperless | Upload Practical List</title>
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
</head>
<body style="margin-top: 100px;">
<center>
<div style="height: 100px;padding:20px;width:950px;float:center;
     box-shadow: 0px 0px 20px 3px black inset;border-radius: 6px;padding-bottom: 100px;">
   <table>
   
   <tr >
   <td ><div style="margin-left: 2px"><b>Insert Practical List</b></div></td>
   </tr>
   <tr>
     <form action="/Paperless/pimage" method="post" enctype="multipart/form-data">
      <td >
      <div style="margin-right: 20px;">
      <select  name="subject_prac"  class="form-control" onchange="sub_prac_selector()" id="sub_prac_select">
              <option selected="selected">Subject</option>
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
      </select>

      </div>

      </td>
      <td>

         <div  style="margin-right: 20px;">
              <select name="year_prac"  class="form-control" onchange="year_prac_selector()" id="year_prac_select">
              <option selected="selected">Select Year</option>
              <option  value="FirstYear">FirstYear</option>
              <option value="SecondYear">SecondYear</option>
              <option value="ThirdYear">ThirdYear</option>
              <option value="FinalYear">FinalYear</option>
              </select>
        </div>
      </td>
     <td><input type="text" name="prac_no" placeholder="No. of Practicals"></td>
    <td><input type="text" name="list_no" placeholder="List Number"></td>

     
      
     <td>
      <input type="file" name="pic_prac" style="margin-right: 20px;width: 100px;">
      </td>
      <td>
<!--       <input type="text" id="year_dropdown" name="year_dropdown" style="visibility: hidden;width: 0px;height: 0px">
      <input type="text"  id="sub_dropdown" name="sub_dropdown" style="visibility: hidden;width: 0px;height: 0px">
 -->      
        <button type="submit" name="submit" name="submit" style="margin-right: 10px;margin-left:5PX">Insert</button>
      
      
      </td>
      </form> 
       </tr>
      </table>
      </div>
      </center>
      </body>
      </html>
      
