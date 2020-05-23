import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.*;
import java.sql.*;
import javax.sql.*;
@WebServlet("/forgotpasswordf")

public class ForgetPasswordf extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		PrintWriter out=resp.getWriter();
        resp.setContentType("text/html");
		String username=req.getParameter("username");
		String pass=req.getParameter("password");
		String repass=req.getParameter("repassword");
       
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
         if (pass.equals(repass))
		 {  
				  
			sql = String.format("update fsignup set password='%s' where username='%s'",repass,username); 
	     	stmt.executeUpdate(sql);		

	     	resp.sendRedirect("/Paperless/forgotpasswordf.jsp");   	  
	  }
	 else
	 {

	  resp.sendRedirect("/Paperless/forgotpasswordf.jsp");

	 }
        } catch(SQLException se) {
         out.println(se);
        } catch(Exception e) {
        
         out.println(e);
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

 



		 
		
