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
  <title>Paperless | General</title>
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
 
  <link href="extcss/index.css" rel="stylesheet">
<script src="extjs/index.js"></script>
<link rel="shortcut icon" href="images/clg.jpg">

<!-- chart-->
<link rel="stylesheet" href="extjs/chart/morris.css">
<script src="extjs/chart/jquery.min.js"></script>
 <script src="extjs/chart/raphael-min.js"></script>
<script src="extjs/chart/morris.min.js"></script>

<style type="text/css">
  #area-chart,
#line-chart,
#bar-chart,
#stacked,
#pie-chart{
  min-height: 250px;
}
</style>
</head>

  <!--navbar ends*******************************************************************************-->
  <body>
    <h3 class="text-primary text-center">
   Practicals charts
  </h3>
  <div class="row">
    <!-- <div class="col-sm-6 text-center">
      <label class="label label-success">Practicals Area Chart</label>
      <div id="area-chart" ></div>
    </div>
    <div class="col-sm-6 text-center">
       <label class="label label-success">Practicals  Line Chart</label>
      <div id="line-chart"></div>
    </div> -->
   

    <div class="col-sm-6 text-center">
       <label class="label label-success">Practicals Pie Chart</label>
      <div id="pie-chart" ></div>
    </div>
    
  </div>
  </body>
  </html>

  
<script>
<%
 String No=(String)session.getAttribute("RegNo");
 String yr=(String)session.getAttribute("year");
Connection con = null;
Statement stmt = null;
Statement stmt1 = null;
ResultSet rs = null;
ResultSet rs1=null;
try {

Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paperless","root","root");

stmt = con.createStatement();
// stmt1 = con.createStatement();
 String qry=String.format("select count(pracNo),Subject from "+yr+" where username='2015bcs060' group by Subject");
rs = stmt.executeQuery(qry);
if(rs.next()){
  out.println("Morris.Donut({element: 'pie-chart',data: [{label: '"+rs.getString(2)+"', value:"+rs.getInt(1)+"}");
  }

while(rs.next()) {


  out.println(",{label: '"+rs.getString(2)+"', value:"+rs.getInt(1)+"}");
}
  out.println(" ],resize:true});");

}
catch(Exception e)
{
out.println(e);
}
%>

</script>
