import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.*;
@WebServlet("/logout")

public class Logout extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
//PrintWriter out=resp.getWriter();
	   //System.out.println("Logout");
	   HttpSession  session=req.getSession();
     String RegNo=(String)session.getAttribute("RegNo");
     File f1=new File("/opt/lampp/htdocs/Trash/"+RegNo+".html");
     File f2=new File("/opt/lampp/htdocs/Trash/"+RegNo+".php");
     f1.delete();
     f2.delete();
    // out.println(RegNo);
	   session.removeAttribute("username");
       session.removeAttribute("name");
       session.removeAttribute("year");
       session.removeAttribute("id");
       session.removeAttribute("code");
       session.removeAttribute("lang");
       session.removeAttribute("font");
       session.removeAttribute("input");
       session.removeAttribute("sub");
       session.removeAttribute("pracNo");
       session.removeAttribute("savecode");
       session.removeAttribute("RegNo");
       session.removeAttribute("subject_t1");
       session.removeAttribute("div_t1");
       session.removeAttribute("year_t1");
       session.removeAttribute("pracNo_t1");
       session.removeAttribute("RegNo789");
       session.removeAttribute("year789");
       session.removeAttribute("pracNo789");
       session.removeAttribute("sub789");
       session.removeAttribute("output");




       session.removeAttribute("code2");
       session.removeAttribute("lang2");
       session.removeAttribute("font2");
       session.removeAttribute("input2");
       session.removeAttribute("sub2");
       session.removeAttribute("pracNo2");
       session.removeAttribute("savecode2");
       session.invalidate();
       resp.sendRedirect("index.jsp");
		
	}
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		PrintWriter out=resp.getWriter();

	   //System.out.println("Logout");
	   HttpSession  session=req.getSession();
	   String RegNo=(String)session.getAttribute("RegNo");
     File f1=new File("/opt/lampp/htdocs/Trash/"+RegNo+".html");
     File f2=new File("/opt/lampp/htdocs/Trash/"+RegNo+".php");
          //out.println(RegNo);

     f1.delete();
     f2.delete();
	   session.removeAttribute("username");
       session.removeAttribute("name");
       session.removeAttribute("year");
       session.removeAttribute("id");
       session.removeAttribute("code");
       session.removeAttribute("lang");
       session.removeAttribute("font");
       session.removeAttribute("input");
       session.removeAttribute("sub");
       session.removeAttribute("pracNo");
       session.removeAttribute("savecode");
       session.removeAttribute("RegNo");
       session.removeAttribute("subject_t1");
       session.removeAttribute("div_t1");
       session.removeAttribute("year_t1");
       session.removeAttribute("pracNo_t1");
       session.removeAttribute("RegNo789");
       session.removeAttribute("year789");
       session.removeAttribute("pracNo789");
       session.removeAttribute("sub789");
       session.removeAttribute("output");




       session.removeAttribute("code2");
       session.removeAttribute("lang2");
       session.removeAttribute("font2");
       session.removeAttribute("input2");
       session.removeAttribute("sub2");
       session.removeAttribute("pracNo2");
       session.removeAttribute("savecode2");
       session.invalidate();
       resp.sendRedirect("index.jsp");
		
	}

}
