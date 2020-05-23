import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.Part;
import java.io.*;
import javax.servlet.annotation.*;
import java.sql.*;
import javax.sql.*;
@WebServlet("/fimage")
@MultipartConfig(maxFileSize=2097152000)

public class FImage extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		PrintWriter out=resp.getWriter();
        resp.setContentType("text/html");
		//String pic=req.getParameter("pic");
		String id1=req.getParameter("id");
       int id=Integer.parseInt(id1);

        Part part=req.getPart("pic");

        InputStream is=null;
        PreparedStatement ps=null;
        Connection conn=null;
        
    try{
       if (part!=null) {
           long size=part.getSize();
           String content=part.getContentType();
           is=part.getInputStream();
       }
		 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	     final String DB_URL="jdbc:mysql://localhost:3306/paperless";
	     final String USER = "root";
	     final String PASS = "root";
	     
          Class.forName(JDBC_DRIVER);
          conn = DriverManager.getConnection(DB_URL, USER, PASS);
          Statement st=conn.createStatement();
          String qry1=String.format("select userid from fimage where userid=%d",id);
          ResultSet rs=st.executeQuery(qry1);

          if (rs.next()) {
            String sql1;
          sql1 ="update fimage set imgs=? where userid=?";
          ps=conn.prepareStatement(sql1);
          ps.setBlob(1,is);
          ps.setInt(2,id);
          int count=ps.executeUpdate();
          resp.sendRedirect("/Paperless/FProfile.jsp");
          }

          else{

         String sql;
         sql = "insert into fimage(imgs,userid) values(?,?)";
          ps=conn.prepareStatement(sql);
         ps.setInt(2,id);    
         ps.setBlob(1,is);
		 int count=ps.executeUpdate();
          resp.sendRedirect("/Paperless/FProfile.jsp");
    	}
    }
    	 catch(SQLException se) {
         out.println(se);
        } catch(Exception e) {
        
         out.println(e);
        } finally {
         
         try {
            if(ps!=null)
               ps.close();
         } catch(SQLException se2) {
         out.println(se2);
         } 
         try {
            if(conn!=null)
            conn.close();
         } catch(SQLException se) {
         out.println(se);
         } 
      }
		
	}
}
