import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.*;
import java.sql.*;
import javax.sql.*;
@WebServlet("/fsignup")

public class FSignup extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
      boolean flag=false;
		PrintWriter out=resp.getWriter();
    System.out.println("in sign up");
		//Set response content type
    System.out.println("in sign up");
      resp.setContentType("text/html");
		String branchname,yearname;
      String name=req.getParameter("name1");
    
		String username=req.getParameter("username");
		String pass=req.getParameter("password");
		String repass=req.getParameter("repassword");
      String phone=req.getParameter("phone");
		String[] branch=req.getParameterValues("branch");
		branchname=branch[0];
    
		
		

     if(pass.equals(repass))
     {
         System.out.println("in sign up");
     System.out.println("in sign up");
	  final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	  final String DB_URL="jdbc:mysql://localhost:3306/paperless";

	   final String USER = "root";
	  final String PASS = "root";

		 Statement stmt=null;
		 Connection conn=null;
    try {
      System.out.println("in sign up try");
         // Register JDBC driver
         Class.forName(JDBC_DRIVER);

         // Open a connection
          conn = DriverManager.getConnection(DB_URL, USER, PASS);

         // Execute SQL query
           Statement stmt1 = conn.createStatement();
            String qry=String.format("select username from fsignup where username='%s'",username);
           ResultSet rs=stmt1.executeQuery(qry);

           if(!rs.next()){
          stmt = conn.createStatement();
         String sql;
         sql = String.format("insert into fsignup(name,username,password,phone,branch) values('%s','%s','%s','%s','%s')",name,username,pass,phone,branchname);
         stmt.executeUpdate(sql);
         resp.sendRedirect("/Paperless/Admin.jsp");
         
       }else
         {
          resp.sendRedirect("/Paperless/Admin.jsp?ankit=no");
         
         }
      } catch(SQLException se) {
         flag=false;
      out.println(se);
      } catch(Exception e) {
         flag=false;
        
         out.println(e);
         
      } finally {
         
         try {
            if(stmt!=null)
               stmt.close();
         } catch(SQLException se2) {
           out.println(se2);            
         } 
         try {
            if(conn!=null)
            conn.close();
         } catch(SQLException se) {
            out.println(se);;
            
         } 
      }
    }
      else{
      resp.sendRedirect("/Paperless/Admin.jsp");
      
	}



	}
}
