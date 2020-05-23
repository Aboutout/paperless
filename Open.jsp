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
     session.setAttribute("sub",sub);
     session.setAttribute("pracNo",pracNo);

    
     if(sub.equals("JAVA")) session.setAttribute("lang","java");
     else if(sub.equals("PYTHON"))session.setAttribute("lang","python");
     else if(sub.equals("PHP"))session.setAttribute("lang","php");
     else if(sub.equals("DBMS"))session.setAttribute("lang","sql");
      else if(sub.equals("HTML(CL1)"))session.setAttribute("lang","html");
     else if(sub.equals("DS(C)"))session.setAttribute("lang","c_cpp");
     else if(sub.equals("DS(CPP)"))session.setAttribute("lang","c_cpp");
     else if(sub.equals("DAA"))session.setAttribute("lang","c_cpp");
     else if(sub.equals("HTML(CL2)"))session.setAttribute("lang","html");
     else if(sub.equals("CPP"))session.setAttribute("lang","c_cpp");
     else if(sub.equals("C"))session.setAttribute("lang","c_cpp");

    Clob file=null;
    Clob input=null;
     ResultSet rs=null;
     String fileData =null;
     String fileData1 =null;
     PreparedStatement ps = null;
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

		file = rs.getClob("code");
    input=rs.getClob("input");
		fileData = file.getSubString(1l,(int)file.length());
    fileData1 = input.getSubString(1l,(int)input.length());
    session.setAttribute("savecode",fileData);
    session.setAttribute("input",fileData1);
        //out.println(fileData);
		} else {


		out.println("data not found for given id");

		return;

		}
		
		          
      response.sendRedirect("/Paperless/dashboard.jsp");

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