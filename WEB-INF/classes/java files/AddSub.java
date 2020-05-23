import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.Part;
import java.io.*;
import javax.servlet.annotation.*;
import java.sql.*;
import javax.sql.*;
@WebServlet("/add")

public class AddSub extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		   PrintWriter out=resp.getWriter();
           resp.setContentType("text/html");
           String username=req.getParameter("username");
           String subject1=req.getParameter("subject1");
           String[] yr=req.getParameterValues("year");
		   String year=yr[0];           
		   String subject2=req.getParameter("subject2");
           String subject3=req.getParameter("subject3");
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
	          String qry1=String.format("select year from Subjects where username='%s'",username);
	          ResultSet rs=st.executeQuery(qry1);
              
	          if (rs.next()) {
	          	String tempyear=rs.getString("year");
	          	if(year.equals(tempyear)){
              String sql1;
	          sql1 ="update Subjects set subject=?,subject2=?,subject3=?,year=? where username=?";
	          ps=conn.prepareStatement(sql1);
	          ps.setString(1,subject1);
	          ps.setString(2,subject2);
	          ps.setString(3,subject3);
	          ps.setString(4,year);
	          ps.setString(5,username);
	          int count=ps.executeUpdate();
	          resp.sendRedirect("/Paperless/Admin.jsp");
	          }
	          else{

	         String sql;
	         sql = "insert into Subjects values(?,?,?,?,?)";
	         ps=conn.prepareStatement(sql);
	         ps.setString(1,username);
	         ps.setString(5,year);
	         ps.setString(2,subject1);
	         ps.setString(3,subject2);
	         ps.setString(4,subject3);
			 int count=ps.executeUpdate();
			 resp.sendRedirect("/Paperless/Admin.jsp");
	      }
	  }

	          else{

	         String sql;
	         sql = "insert into Subjects values(?,?,?,?,?)";
	         ps=conn.prepareStatement(sql);
	         ps.setString(1,username);
	         ps.setString(5,year);
	         ps.setString(2,subject1);
	         ps.setString(3,subject2);
	         ps.setString(4,subject3);
			 int count=ps.executeUpdate();
			 resp.sendRedirect("/Paperless/Admin.jsp");
    	}
       }
       catch(Exception e)
       {
       	out.println(e);
       }

    }
}