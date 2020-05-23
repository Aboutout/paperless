import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.Part;
import java.io.*;
import javax.servlet.annotation.*;
import java.sql.*;
import javax.sql.*;
@WebServlet("/imageret")
@MultipartConfig(maxFileSize=2097152)

public class ImageRet extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		PrintWriter out=resp.getWriter();
        resp.setContentType("text/html");

        Blob image = null;

		Connection con = null;

		byte[ ] imgData = null ;

		Statement stmt = null;

		ResultSet rs = null;
		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paperless","root","root");

			stmt = con.createStatement();

			rs = stmt.executeQuery("select imgs from images where userid = 50");

			if (rs.next()) {

			image = rs.getBlob(1);
			imgData = image.getBytes(1,(int)image.length());

			} else {

			out.println("Display Blob Example");

			out.println("image not found for given id>");

			return;

			}

			// display the image

			resp.setContentType("image/gif");

			OutputStream o = resp.getOutputStream();
			o.write(imgData);
			o.flush();

			o.close();
		}
		catch(SQLException e){}
		catch(ClassNotFoundException e){}
    }
}
