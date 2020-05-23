import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.*;
import java.sql.*;
import javax.sql.*;
@WebServlet("/slogin")

public class Slogin extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		PrintWriter out=resp.getWriter();
        resp.setContentType("text/html");
		String username=req.getParameter("username");
		String pass=req.getParameter("password");
       
		 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	     final String DB_URL="jdbc:mysql://localhost:3306/paperless";
	     final String USER = "root";
	     final String PASS = "root";

		 Statement stmt=null,stmt1=null;
		 Connection conn=null;
         try {
         
         Class.forName(JDBC_DRIVER);

         
          conn = DriverManager.getConnection(DB_URL, USER, PASS);

        
          stmt = conn.createStatement();
          stmt1 = conn.createStatement();
         String sql,sql1;
         sql = String.format("SELECT * FROM signup where username='%s'",username); 
		ResultSet rs= stmt.executeQuery(sql);

		    if(rs.next()){
            String pass1 = rs.getString("password");
			  
			  if (pass1.equals(pass))
			  {  
			  HttpSession session=req.getSession();
			  String usrname = rs.getString("username");
			  String name = rs.getString("name");
			  String branch = rs.getString("branch");
			  int id = rs.getInt("id");
			  String RegNo = rs.getString("RegNo");
			  String RollNo = rs.getString("RollNo");
			  String year = rs.getString("year");


               
         //       sql1 = String.format("SELECT * FROM images where userid='%d'",id);       
		       // ResultSet rs1= stmt.executeQuery(sql1);
         //          if(rs1.next()){
                     
         //          }
			   session.setAttribute("username",username);
			   session.setAttribute("branch",branch);
               session.setAttribute("name",name);
               session.setAttribute("year",year);
               session.setAttribute("id",id);
               session.setAttribute("RollNo",RollNo);
               session.setAttribute("RegNo",RegNo);
               session.setMaxInactiveInterval(900);
			  resp.sendRedirect("/Paperless/profile.jsp");
			  }
			  else{
			  resp.sendRedirect("/Paperless/slogin.jsp");
	          }
		 }
		 else
			 {
			
			  resp.sendRedirect("/Paperless/slogin.jsp");
	
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

 



		 
		
