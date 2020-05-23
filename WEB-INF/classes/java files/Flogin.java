import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.*;
import java.sql.*;
import javax.sql.*;
@WebServlet("/flogin")

public class Flogin extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		PrintWriter out=resp.getWriter();
        resp.setContentType("text/html");
		String username1=req.getParameter("username");
		String pass=req.getParameter("password");
       
		 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	     final String DB_URL="jdbc:mysql://localhost:3306/paperless";
	     final String USER = "root";
	     final String PASS = "root";

		 Statement stmt=null;
		 Connection conn=null;
         try {
         
         Class.forName(JDBC_DRIVER);
          conn = DriverManager.getConnection(DB_URL, USER, PASS);
          stmt = conn.createStatement();
         String sql;
         sql = String.format("SELECT * FROM fsignup where username='%s'",username1);       
		ResultSet rs= stmt.executeQuery(sql);

		    if(rs.next()){
            String pass1 = rs.getString("password");
			  if (pass1.equals(pass))
			  {  
			  HttpSession session=req.getSession();
			  String name = rs.getString("name");
			  String branch = rs.getString("branch");
			  int id = rs.getInt("ID");
 
			   session.setAttribute("fusername",username1);
			   session.setAttribute("fbranch",branch);
               session.setAttribute("fname",name);
               session.setAttribute("fid",id);



			   resp.sendRedirect("/Paperless/FProfile.jsp");
			  }
			  else{
			  resp.sendRedirect("/Paperless/flogin.jsp?c=1");
			 
	          }
		 }
		 else
			 {
			
			  resp.sendRedirect("/Paperless/flogin.jsp?c=1");
	
			 }
        } catch(SQLException se) {
         se.printStackTrace();
        } catch(Exception e) {
        
         e.printStackTrace();
        } finally {
         
         try {
            if(stmt!=null)
               stmt.close();
         } catch(SQLException se2) {
            se2.printStackTrace();
         } 
         try {
            if(conn!=null)
            conn.close();
         } catch(SQLException se) {
            se.printStackTrace();
         } 
      }

	}
 }

 



		 
		