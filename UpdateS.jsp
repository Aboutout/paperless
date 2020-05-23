<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.servlet.*"%>
    <%@ page import="java.servlet.http.*"%>
    <%@ page import="java.io.*"%>
  <%
  String val="";
  String RegNo=(String)request.getParameter("RegNo");
 String year=(String)request.getParameter("year");
 String pracNo=(String)request.getParameter("pracNo");
 String sub=(String)request.getParameter("sub");

if(year!=null){
 session.setAttribute("RegNo789",RegNo);
 session.setAttribute("year789",year);
 session.setAttribute("pracNo789",pracNo);
 session.setAttribute("sub789",sub);
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

  <link href="extcss/index.css" rel="stylesheet">
<script src="extjs/index.js"></script>
<link rel="shortcut icon" href="images/clg.jpg">

</head>
<body>

<
    <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Update Status</div>
                        
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="loginform" class="form-horizontal" role="form" action="">
                             <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-sort-by-order"></i></span>
                                        <input id="login-password" type="text" class="form-control" name="status" value="" placeholder="Enter Status(range 1 to 5)">                                        
                            </div>
                                <button type="submit" class="btn btn-primary" name="status1" value="status1">Update</button>
                            </form>     
                          </div>                     
                    </div>  
        </div>
        </div>
    </body>
</html>

    <%
     val=(String)request.getParameter("status1");
     if(val!=null){
     String RegNo789=(String)session.getAttribute("RegNo789");
     String year789=(String)session.getAttribute("year789");
     String pracNo789=(String)session.getAttribute("pracNo789");
     String sub789=(String)session.getAttribute("sub789");
     String ss789=(String)request.getParameter("status");
     int s789=Integer.parseInt(ss789);        
            

      try{
          PreparedStatement ps = null;
          Connection con=null;
          Class.forName("com.mysql.jdbc.Driver");
          con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/paperless", "root", "root"); 
          ps=con.prepareStatement("update "+year789+" set status=?  where username=? and PracNo=? and Subject=?");
          ps.setString(2,RegNo789);
          ps.setString(3,pracNo789);
          ps.setString(4,sub789);
          ps.setInt(1,s789);
          ps.executeUpdate();
          
          response.sendRedirect("/Paperless/Ftable.jsp");

        }
      catch(Exception e)
      {
      	out.println(e);
      }
}
    %>