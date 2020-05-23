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
  <title>Paperless | Student's Records</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="css/bootstrap.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  
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




</style>
</head>
<body style="margin-top: 20px;">

     <div style="height: 70px;padding:20px;width:950px;
     box-shadow: 0px 0px 20px 3px black inset;border-radius: 6px;margin-left: 15px;">
      <!--  records*******************************************************************************************************-->
      <form action="">
      <table>
        <tr>
            <td>
              <div  style="margin-left: 0px;">
              <select id="year" name="year" required="required" class="form-control" style="width: 120px" onchange="changeYear()">
              <option value="FirstYear" >FirstYear</option>
              <option value="SecondYear">SecondYear</option>
              <option value="ThirdYear">ThirdYear</option>
              <option value="FinalYear">FinalYear</option>
              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=year_t2%></option>
              </select>
                </div>
              </td> 
             <td>
              <div  style="margin-left: 20px;">
              <select name="div" required="required" class="form-control" style="width: 100px">
              <option value="A">A</option>
              <option value="B">B</option>
              
              
              
              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=div_t2%></option>

              </select>
                </div>
              </td>  
          <td>
              <div  style="margin-left: 20px;">
              <select name="subject"  class="form-control" id="subchoose" onchange="subject1()">
               <option value="C">C</option>
              <option value="CPP">CPP</option>
              <option value="JAVA" >JAVA</option>
              <option value="PHP">PHP(CL3) </option>
              <option value="DBMS">DBMS</option>
              <option value="PYTHON">PYTHON</option>
              <option value="HTML(CL1)">HTML(CL1)</option>
              <option value="HTML(CL2)">HTML(CL2)</option>
              <option value="DS(C)">DS(C)</option>
              <option value="DS(C++)">DS(C++)</option>
              <option value="DAA">DAA</option>
              
              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;"><%=subject_t2%></option>

              </select>
                </div>
              </td>  
               <td>
                <div  style="margin-left: 20px;">
              <select name="pracno" class="form-control" style="width: 120px">
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
              </td>
               
              <td><input type="submit" name="submit123" id="submit123" value="Get Record"></td>
              <td>
              <div  style="margin-left: 5px;">
              <select id="ListSelector" onchange="changeListNo()" name="listno"  class="form-control  ListSelector">
              <option value="1">List 1</option>
              <option value="2">List 2</option>
              <option value="3">List 3</option>
              <option value="4">List 4</option>
              
              <option value="" selected="selected" disabled="disabled" style="visibility: hidden;">List</option>

              </select>
                </div>
              </td> 
              <td><input type="button" name="praclist" id="praclist" value="Get Prac List" onclick="getPracList()"></td>
        </tr>
      </table> 
      </form>
      </div>
      
<!-- table -->

<br><br>






<div style="margin-left: 20px;">
      <!--while loop -->
      <table border=1 class="display tab" id="table_id" >
      <thead>
     <tr  style="background-color:white;">
     <th>Sr.No</th><th>Roll No.</th><th>RegNo</th><th>Name</th><th>Date</th><th>Status</th><th>Action</th><th>Sr.No</th>
     </tr>
     </thead>
     <tbody>



<!--display records**************************************************************************************************************** -->

<%
  
int i=1;
// String No=(String)session.getAttribute("RegNo");

String branch=(String)session.getAttribute("fbranch");
//out.println(branch);
subject_t1=request.getParameter("subject");
div_t1=request.getParameter("div");
year_t1=request.getParameter("year");
pracNo_t1=request.getParameter("pracno");
x=request.getParameter("submit123");
if(x==null)x="";
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String pcode="";
if(x.equals("Get Record")){
session.setAttribute("subject_t1",subject_t1);
session.setAttribute("div_t1",div_t1);
session.setAttribute("year_t1",year_t1);
session.setAttribute("pracNo_t1",pracNo_t1);
}
subject_t=(String)session.getAttribute("subject_t1");
div_t=(String)session.getAttribute("div_t1");
year_t=(String)session.getAttribute("year_t1");
pracNo_t=(String)session.getAttribute("pracNo_t1");

try {

Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paperless","root","root");

stmt = con.createStatement();
 String qry="select  s.RollNo,s.RegNo,s.name,t.SDate,t.status from "+year_t+" as t , signup as s where t.username=s.RegNo and t.Subject='"+subject_t+"' and t.PracNo='"+pracNo_t+"' and s.branch= '"+branch+"' and s.RollNo like '"+div_t+"%' order by t.Subject,t. PracNo";
rs = stmt.executeQuery(qry);

while(rs.next()) {
String Reg_No=rs.getString("RegNo");
String name_s=rs.getString("name");
int status=rs.getInt("status");
String Roll_No=rs.getString("RollNo");
%>
<tr><td><%out.println(i);%></td><td><%out.println(Roll_No);%></td><td><a href="StudentPracList.jsp?RegNo=<%out.println(Reg_No);%>&year=<%out.println(year_t);%>&RollNo=<%out.println(Roll_No);%>&sub=<%out.println(subject_t);%>&name=<% out.println(name_s);%>" target="_blank"><% out.println(Reg_No);%></a></td><td><% out.println(name_s);%></</td><td><%out.println(rs.getDate("SDate"));%></td>
<td><% out.println(status+" "); %>
 <%
 if(subject1.equalsIgnoreCase(subject_t)|| subject2.equalsIgnoreCase(subject_t)|| subject3.equalsIgnoreCase(subject_t)){
%><a href="UpdateS.jsp?RegNo=<%out.println(Reg_No);%>&year=<%out.println(year_t);%>&pracNo=<%out.println(pracNo_t);%>&sub=<%out.println(subject_t);%>&c=1"  >(Update)</a><%}%></td>
<td><a href="Openf.jsp?RegNo=<%out.println(Reg_No);%>&year=<%out.println(year_t);%>&pracNo=<%out.println(pracNo_t);%>&sub=<%out.println(subject_t);%>" onClick="Open()"  target="_blank">Open</a>/<a href="Downloadf.jsp?RegNo=<%out.println(Reg_No);%>&year=<%out.println(year_t);%>&pracNo=<%out.println(pracNo_t);%>&sub=<%out.println(subject_t);%>" onClick="Down()">Download</a></td><td><%out.println(i);%></td></tr>
<%
  i++;
}
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

  $(document).ready( function () {
    $('#table_id').DataTable( {
               dom: 'Bfrtip',
        buttons: [
            {
                extend: 'print',
                exportOptions: {
                    columns: ':visible'
                }
            },
            'colvis'
        ],
        columnDefs: [ {
            targets: -1,
            visible: false
        } ]
        
    } );


});
 
</script>
</body>
</html>


