import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.*;
@WebServlet("/alogout")

public class ALogout extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
	   HttpSession  session=req.getSession();
	   session.removeAttribute("username_admin");
          session.invalidate();

      
       resp.sendRedirect("index.jsp");
		
	}
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
	   HttpSession  session=req.getSession();
	   session.removeAttribute("username_admin");
       
       session.invalidate();
       resp.sendRedirect("index.jsp");
		
	}

}
