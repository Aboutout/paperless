<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.servlet.*"%>
    <%@ page import="java.servlet.http.*"%>
    <%@ page import="java.io.*"%>
    <%
     String RegNo=(String)request.getParameter("RegNo");
     String year=(String)request.getParameter("year");
     String pracNo=(String)request.getParameter("pracNo");
     String sub=(String)request.getParameter("sub");

     ResultSet rs=null;
     String fileData =null;
     PreparedStatement ps = null;
     PreparedStatement ps1 = null;
     Connection con=null;
     try{
          
          Class.forName("com.mysql.jdbc.Driver");
          con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/paperless", "root", "root"); 
          ps=con.prepareStatement("select * from "+year+" where username=? and PracNo=? and Subject=?");
          ps.setString(1,RegNo);
          ps.setString(2,pracNo);
          ps.setString(3,sub);
          rs=ps.executeQuery();

          
    if (rs.next()) {
        ps1=con.prepareStatement("delete from "+year+" where username=? and PracNo=? and Subject=?");
        ps1.setString(1,RegNo);
        ps1.setString(2,pracNo);
        ps1.setString(3,sub);
        ps1.executeUpdate();
	
		} else {


		out.println("data not found for given id");

		return;

		}
		
		          
      con.close();
      response.sendRedirect("/Paperless/Stable.jsp");

        }
      catch(Exception e)
      {
      	out.println(e);
      }
      finally {

try {

rs.close();

ps.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();

}

}
%>