import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.*;
import java.sql.*;
import javax.sql.*;
@WebServlet("/pimage")
@MultipartConfig(maxFileSize=2097152000)


public class InputPracList extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
      PrintWriter out=resp.getWriter();
      resp.setContentType("text/html");


      String[] year=req.getParameterValues("year_prac");
  	 String yearName=year[0];
  		String[] sub=req.getParameterValues("subject_prac");
  		String subName=sub[0];

      String prac_no=req.getParameter("prac_no");
      int pracno1=Integer.parseInt(prac_no);
      String list_no=req.getParameter("list_no");
      int listno=Integer.parseInt(list_no);
      // String subName=req.getParameter("sub_dropdown");
      //out.println(yearName+subName+t);
        Part part=req.getPart("pic_prac");

        InputStream is=null;
        PreparedStatement ps=null;
        Connection conn=null;
        
    try{
       
           is=part.getInputStream();
  

		 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	     final String DB_URL="jdbc:mysql://localhost:3306/paperless";
	     final String USER = "root";
	     final String PASS = "root";
	     
          Class.forName(JDBC_DRIVER);
          conn = DriverManager.getConnection(DB_URL, USER, PASS);
          Statement st=conn.createStatement();
          String qry1=String.format("select ID from prac"+yearName+" where Subject='%s' and list_no=%d",subName,listno);
          ResultSet rs=st.executeQuery(qry1);

          if (rs.next()) {
          String sql1;
          sql1 ="update prac"+yearName+" set pracImage=?,pracno=?,list_no=? where Subject=?";
          ps=conn.prepareStatement(sql1);
          ps.setBlob(1,is);
          ps.setInt(2,pracno1);
          ps.setInt(3,listno);
          ps.setString(4,subName);
          int count=ps.executeUpdate();
          resp.sendRedirect("/Paperless/InputPracList.jsp");
          }

          else{

         String sql;
         sql = "insert into prac"+yearName+"(Subject,pracImage,pracno,list_no) values(?,?,?,?)";
          ps=conn.prepareStatement(sql);
         ps.setBlob(2,is);
         ps.setString(1,subName);
         ps.setInt(3,pracno1);
          ps.setInt(4,listno);

		 int count=ps.executeUpdate();
		 resp.sendRedirect("/Paperless/InputPracList.jsp");
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