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
     try{
          PreparedStatement ps = null;
          Connection con=null;
          Class.forName("com.mysql.jdbc.Driver");
          con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/paperless", "root", "root"); 
          ps=con.prepareStatement("select * from "+year+" where username=? and PracNo=? and Subject=?");
          ps.setString(1,RegNo);
          ps.setString(2,pracNo);
          ps.setString(3,sub);
          ResultSet rs=ps.executeQuery();
          String userHomeFolder = System.getProperty("user.home");

          FileWriter fw=new FileWriter(userHomeFolder+"/"+RegNo+" "+sub+" "+pracNo+".txt");
          if(rs.next())
          {
          Reader r=rs.getCharacterStream("code");
          int i=r.read();
          while(i != -1)
          {
             fw.write(i);
             i=r.read();
          }
          fw.flush();
          }
          con.close();
          response.sendRedirect("/Paperless/Ftable.jsp");

        }
      catch(Exception e)
      {
      	out.println(e);
      }
    %>