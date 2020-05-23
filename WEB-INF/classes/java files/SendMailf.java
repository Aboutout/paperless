import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.*;

import javax.servlet.*;
import javax.servlet.http.*;
@WebServlet("/mailf")

public class SendMailf extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
	
		String to=request.getParameter("to");
		
		Mailerf.send(to,out);
		out.close();
	}

}
