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
   <html>
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
 <style type="text/css">
    .dataTables_wrapper{
  max-width: 80% !important; 
  max-height: 5% !important;
}
.tab{
  width:100%;
  border-collapse: collapse;
  border:1px solid black;
  line-height: 18px;
  
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
  </style>
  </head>
  <body>
    <div id="profile">
  <div class="container abc" style="margin: 20px 0px 0px 20px !important;width: 120%;">
    



  <!-- <p style="font-size:30px;"><% out.println((String)session.getAttribute("name")); %>  <% out.println((String)session.getAttribute("branch"));%>(<% out.println((String)session.getAttribute("RollNo"));%>) <% out.println((String)session.getAttribute("RegNo"));%> <% out.println((String)session.getAttribute("year"));%></p> -->

  
  
     <table border=1 class="display tab" id="table_id">
     <thead><tr style="background-color:white !important;"><th>Sr.No</th><th>Subject</th><th>Practical No.</th><th>Date</th><th>Status</th><th>Action</th></tr></thead><tbody>



<!--display records**************************************************************************************************************** -->

<%
int i=1;
 String No=(String)session.getAttribute("RegNo");
 String yr=(String)session.getAttribute("year");
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String pcode="";

try {

Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paperless","root","root");

stmt = con.createStatement();
 String qry=String.format("select * from "+yr+" where username='%s' order by Subject,PracNo",No);
rs = stmt.executeQuery(qry);

while(rs.next()) {
String Sub=rs.getString("Subject");
String Prac=rs.getString("PracNo");
int status=rs.getInt("status");
 pcode=rs.getString("code");
%>
<tr style="height:20px;"><td><%out.println(i);%></td><td><% out.println(Sub);%></td><td><% out.println(Prac);%></</td><td><%out.println(rs.getDate("SDate"));%></td><td><% out.println(status); %></td><td><a href="Open.jsp?RegNo=<%out.println(No);%>&year=<%out.println(yr);%>&pracNo=<%out.println(Prac);%>&sub=<%out.println(Sub);%>" onClick="Open()" target="_blank" >Open</a>/<a href="Download.jsp?RegNo=<%out.println(No);%>&year=<%out.println(yr);%>&pracNo=<%out.println(Prac);%>&sub=<%out.println(Sub);%>" onClick="down()">Download</a>/<a href="Delete.jsp?RegNo=<%out.println(No);%>&year=<%out.println(yr);%>&pracNo=<%out.println(Prac);%>&sub=<%out.println(Sub);%>">Delete</a></td></tr>
<%
  i++;
}
}
catch(Exception e)
{
 out.println(e);
}
 %>
 </tbody>
</table>

    <br>

</div>

  </div>

  </body>
  </html>
  <script type="text/javascript">
  $(document).ready( function () {
    $('#table_id').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'print'
        ]
    } );
} );
  
</script>
