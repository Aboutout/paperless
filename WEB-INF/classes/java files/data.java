import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import javax.servlet.annotation.*;
import java.lang.*;
import java.sql.*;
@WebServlet("/data")

public class data extends HttpServlet
{
	   String RegNo="";
     String output="";


	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		    PrintWriter out=resp.getWriter();
        resp.setContentType("text/html");
      	String code=req.getParameter("content1");
      	String lang=req.getParameter("lang");
      	String font=req.getParameter("font");
        String input=req.getParameter("input");
        String sub=req.getParameter("sub");
        String pracNo=req.getParameter("prac");
        String sflag=req.getParameter("flag");
  

        HttpSession session=req.getSession();
        RegNo=(String)session.getAttribute("RegNo");
		

          if(lang.equals("java"))
          {
          	JavaCodeCompiler(code,out,input,sub,pracNo,session,resp);
          }
          else if(lang.equals("c_cpp") && sub.equals("C"))
          {
          	CCodeCompiler(code,out,input,sub,pracNo,session,resp);
          }
          else if(lang.equals("c_cpp") && sub.equals("DS(C)"))
          {
            CCodeCompiler(code,out,input,sub,pracNo,session,resp);
          }
          else if(lang.equals("c_cpp") && sub.equals("DAA"))
          {
            CCodeCompiler(code,out,input,sub,pracNo,session,resp);
          }
          else if(lang.equals("c_cpp") && sub.equals("DS(CPP)"))
          {
            CPPCodeCompiler(code,out,input,sub,pracNo,session,resp);
          }
          else if(lang.equals("c_cpp") && sub.equals("CPP"))
          {
            CPPCodeCompiler(code,out,input,sub,pracNo,session,resp);
          }
          else if(lang.equals("sql"))
          {
          	SQLCodeCompiler(code,out,input,sub,pracNo,session,resp);
          }
          else if(lang.equals("python"))
          {
          	PYCodeCompiler(code,out,input,sub,pracNo,session,resp);
          }
          else if(lang.equals("html"))
          {
          	HTMLCodeCompiler(code,out,input,sub,pracNo,session);
          }
          else if(lang.equals("php"))
          {
          	PHPCodeCompiler(code,out,input,sub,pracNo,session);
          }
             
          else
          {
          output="please select language";
            session.removeAttribute("output11");
          session.setAttribute("output11",output);
          resp.sendRedirect("/Paperless/dashboard.jsp");          }
          
        session.setAttribute("code",code);
		session.setAttribute("lang",lang);
		session.setAttribute("font",font);
		session.setAttribute("input",input);
		session.setAttribute("sub",sub);
		session.setAttribute("pracNo",pracNo);
		session.setAttribute("sflag",sflag);
		

		
		//resp.sendRedirect("/Paperless/dashboard.jsp");


	}

	void JavaCodeCompiler(String code,PrintWriter out,String input,String sub,String pracNo,HttpSession session,HttpServletResponse resp)throws ServletException,IOException
	{
         output=" ";

		     int startIndex = code.indexOf("class");
         int endIndex = code.indexOf(" ", startIndex);
         //int endIndex2 = code.indexOf("{");
         int endIndex1 = code.indexOf(" ", endIndex+1);
        //out.println(endIndex2+" "+endIndex1+" "+endIndex);

         String fileName = code.substring(endIndex,endIndex1);  

		    BufferedWriter bufferedWriter = null;
        File myFile=null;
        FileWriter fw=null;
        try {
             myFile = new File("/home/ankit/Desktop/DAA/"+fileName.trim()+".java");

            if (!myFile.exists()) {
                myFile.createNewFile();
            }
            fw=new FileWriter(myFile);
            bufferedWriter = new BufferedWriter(fw);
            bufferedWriter.write(code);
        }
         catch (IOException e) {
            e.printStackTrace();
        }
        finally{
               bufferedWriter.close();
               fw.close();
        }   

             Runtime rt = Runtime.getRuntime();
             Process p1=rt.exec("javac -sourcepath /home/ankit/Desktop/DAA/  /home/ankit/Desktop/DAA/"+fileName.trim()+".java ");
             try{
              p1.waitFor();
          }
          catch(InterruptedException e){}
            Process p = rt.exec("java -cp /home/ankit/Desktop/DAA/ "+fileName.trim());
            
          OutputStream out1 = p.getOutputStream();
      	  BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(out1));
      	  writer.write(input);
      	  writer.flush();
      	  writer.close();
      	  out1.close();

            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = null;

            while((line = br.readLine()) != null)
            //out.println(line);
            output+=line;

            BufferedReader br2 = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            String line2 = null;

            while((line2 = br2.readLine()) != null)
            //out.println(line2);
            output+=line2;

          
            BufferedReader br1 = new BufferedReader(new InputStreamReader(p1.getErrorStream()));
            String line1 = null;
            while((line1 = br1.readLine()) != null)
            //out.println(line1);
            output+=line1;
          br.close();
          br2.close();
          br1.close();
          myFile.delete();
          File fileclass=new File("/home/ankit/Desktop/DAA/"+fileName.trim()+".class");
          fileclass.delete();
          CodeStorage(code,out,input,sub,pracNo,session);

          session.removeAttribute("output11");
          session.setAttribute("output11",output);
          resp.sendRedirect("/Paperless/dashboard.jsp");
         


	}
	void CCodeCompiler(String code,PrintWriter out,String input,String sub,String pracNo,HttpSession session,HttpServletResponse resp)throws ServletException
	{
        output=" ";
		    BufferedWriter bufferedWriter = null;
        File myFile=null;
        FileWriter fw=null;
        Process p=null;


      try{
        try {
             myFile = new File("/home/ankit/Desktop/DAA/"+RegNo+".c");

            if (!myFile.exists()) {
                myFile.createNewFile();
            }
            fw=new FileWriter(myFile);
            bufferedWriter = new BufferedWriter(fw);
            bufferedWriter.write(code);
        }
         catch (IOException e) {
            e.printStackTrace();
        }
        finally{
               bufferedWriter.close();
               fw.close();
        }


             Runtime rt = Runtime.getRuntime();
           p=rt.exec("gcc  /home/ankit/Desktop/DAA/"+RegNo+".c -o  /home/ankit/Desktop/DAA/"+RegNo);
         try{
              p.waitFor();
           }
           catch(InterruptedException e){}

          BufferedReader br2 = new BufferedReader(new InputStreamReader(p.getErrorStream()));
         String line2 = null;
         while((line2 = br2.readLine()) != null)
         //out.println(line2);
         output+=line2;  
           

          Process p1=   rt.exec("/home/ankit/Desktop/DAA/./"+RegNo);

        OutputStream out1 = p1.getOutputStream();
			  BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(out1));
			  writer.write(input);
			  writer.flush();
			  writer.close();
			  out1.close();
        BufferedReader br = new BufferedReader(new InputStreamReader(p1.getInputStream()));
        String line = null;

        while((line = br.readLine()) != null)
        //out.println(line);
          output+=line;

        BufferedReader br1 = new BufferedReader(new InputStreamReader(p1.getErrorStream()));
        String line1 = null;
        while((line1 = br1.readLine()) != null)
        //out.println(line1);
          output+=line1;

          br.close();
          br1.close();
          br2.close();
          myFile.delete();
          File fileclass=new File("/home/ankit/Desktop/DAA/"+RegNo);
          fileclass.delete(); 
          
           
        CodeStorage(code,out,input,sub,pracNo,session);
        session.removeAttribute("output11");
        session.setAttribute("output11",output);
        resp.sendRedirect("/Paperless/dashboard.jsp");
      }
      catch(IOException e4){
         try{
            myFile.delete();
            File fileclass=new File("/home/ankit/Desktop/DAA/"+RegNo);
            fileclass.delete(); 
            BufferedReader br2=null;
            String line="";
            try{
            br2 = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            while((line = br2.readLine()) != null)
            output+=line;
        }
        catch(IOException t){
          out.println(t);
        }
        finally{
          br2.close();
          }
          session.removeAttribute("output11");
          session.setAttribute("output11",output);
          resp.sendRedirect("/Paperless/dashboard.jsp");
      }
      catch(IOException e456){}


	}
}
  void CPPCodeCompiler(String code,PrintWriter out,String input,String sub,String pracNo,HttpSession session,HttpServletResponse resp)throws ServletException,IOException
  {
        output=" ";
        BufferedWriter bufferedWriter = null;
        File myFile=null;
        FileWriter fw=null;
        Process p=null;

        try{

        try {
             myFile = new File("/home/ankit/Desktop/DAA/"+RegNo+".cpp");

            if (!myFile.exists()) {
                myFile.createNewFile();
            }
            fw=new FileWriter(myFile);
            bufferedWriter = new BufferedWriter(fw);
            bufferedWriter.write(code);
        }
         catch (IOException e) {
            e.printStackTrace();
        }
        finally{
               bufferedWriter.close();
               fw.close();
        }


          Runtime rt = Runtime.getRuntime();
          p=rt.exec("g++  /home/ankit/Desktop/DAA/"+RegNo+".cpp -o  /home/ankit/Desktop/DAA/"+RegNo);
          try{
              p.waitFor();
           }
           catch(InterruptedException e){}

           BufferedReader br2 = new BufferedReader(new InputStreamReader(p.getErrorStream()));
         String line2 = null;
         while((line2 = br2.readLine()) != null)
         //out.println(line2);
         output+=line2;  
           

            Process p1=   rt.exec("/home/ankit/Desktop/DAA/./"+RegNo);

            OutputStream out1 = p1.getOutputStream();
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(out1));
            writer.write(input);
            writer.flush();
            writer.close();
            out1.close();
            BufferedReader br = new BufferedReader(new InputStreamReader(p1.getInputStream()));
            String line = null;

            while((line = br.readLine()) != null)
            //out.println(line);
              output+=line;

            BufferedReader br1 = new BufferedReader(new InputStreamReader(p1.getErrorStream()));
            String line1 = null;
            while((line1 = br1.readLine()) != null)
            //out.println(line1);
            output+=line1;

          br.close();
          br1.close();
          br2.close();
          myFile.delete();
          File fileclass=new File("/home/ankit/Desktop/DAA/"+RegNo);
          fileclass.delete(); 
           
        CodeStorage(code,out,input,sub,pracNo,session);
        session.removeAttribute("output11");
        session.setAttribute("output11",output);
        resp.sendRedirect("/Paperless/dashboard.jsp");
      }
      catch(IOException e4){
         try{
            myFile.delete();
            File fileclass=new File("/home/ankit/Desktop/DAA/"+RegNo);
            fileclass.delete(); 
            BufferedReader br2=null;
            String line="";
            try{
            br2 = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            while((line = br2.readLine()) != null)
            output+=line;
        }
        catch(IOException t){
          out.println(t);
        }
        finally{
          br2.close();
          }
          session.removeAttribute("output11");
          session.setAttribute("output11",output);
          resp.sendRedirect("/Paperless/dashboard.jsp");
      }
      catch(IOException e456){}


  }


  }
	void SQLCodeCompiler(String code,PrintWriter out,String input,String sub,String pracNo,HttpSession session,HttpServletResponse resp)throws ServletException,IOException
	{
          String result="";
          final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	      final String DB_URL="jdbc:mysql://localhost:3306/xyz";

	      final String USER = "root";
	      final String PASS = "root";

		 Statement stmt=null;
		 Connection conn=null;
		 
		  try {
           Class.forName(JDBC_DRIVER);

          conn = DriverManager.getConnection(DB_URL, USER, PASS);

          stmt= conn.createStatement();
           boolean b=stmt.execute(code);
           if(b){
           	ResultSet rs=stmt.getResultSet();
           ResultSetMetaData rsmd=rs.getMetaData();
	      int count=rsmd.getColumnCount();
	      String[] type=new String[count+1];
	      for(int i=1;i<=count;i++)
	      {
	      	result+=rsmd.getColumnName(i)+" ";
	      }
	      result+="<br>";
          while(rs.next())
	    {
	      for(int i=1;i<=count;i++)
	      {
	      	int columntype=rsmd.getColumnType(i);
	      	if(columntype==4)
	      	{
               //type[i]=".getInt("+i+")";
	      		result+=rs.getInt(i)+" ";
	      	}
	      	else if(columntype==12)
	      	{
               //type[i]=".getString("+i+")";
	      		result+=rs.getString(i)+" ";
	      	}
	      	else if(columntype==8)
	      	{
               //type[i]=".getDouble("+i+")";
              result+=rs.getDouble(i)+" "+"<br>";
	      	}
	      	
	      	//out.println(i+" "+rsmd.getColumnName(i)+" "+rsmd.getColumnType(i));
	      }
	  }
	  //out.println(result);
    output=result;
             
	 }
           
           else
           {
           	int row =stmt.getUpdateCount();
           	//out.println("Number Of rows effected"+row);
            output="Number Of rows effected"+row;
           }
       }
       catch(Exception e){

       	out.println(e);
       }

              CodeStorage(code,out,input,sub,pracNo,session);
          session.removeAttribute("output11");
          session.setAttribute("output11",output);
          resp.sendRedirect("/Paperless/dashboard.jsp");

          
	}
            
         


	void PYCodeCompiler(String code,PrintWriter out,String input,String sub,String pracNo,HttpSession session,HttpServletResponse resp)throws ServletException,IOException
	{
    output=" ";
		
		BufferedWriter bufferedWriter = null;
        File myFile=null;
        FileWriter fw=null;
        try {
             myFile = new File("/home/ankit/Desktop/DAA/"+RegNo+".py");

            if (!myFile.exists()) {
                myFile.createNewFile();
            }
            fw=new FileWriter(myFile);
            bufferedWriter = new BufferedWriter(fw);
            bufferedWriter.write(code);
        }
         catch (IOException e) {
            e.printStackTrace();
        }
        finally{
               bufferedWriter.close();
               fw.close();
        }   

             Runtime rt = Runtime.getRuntime();
             Process p=rt.exec("python3  /home/ankit/Desktop/DAA/"+RegNo+".py");
            
            
          OutputStream out1 = p.getOutputStream();
		  BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(out1));
		  writer.write(input);
		  writer.flush();
		  writer.close();
		  out1.close();

            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = null;

            while((line = br.readLine()) != null)
            //out.println(line);
              output+=line;

          BufferedReader br2 = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            String line2 = null;

            while((line2 = br2.readLine()) != null)
            //out.println(line2);
              output+=line2;

          
          br.close();
          br2.close();
          
          myFile.delete();
         CodeStorage(code,out,input,sub,pracNo,session);

          session.removeAttribute("output11");
          session.setAttribute("output11",output);
          resp.sendRedirect("/Paperless/dashboard.jsp");

	}
	void HTMLCodeCompiler(String code,PrintWriter out,String input,String sub,String pracNo,HttpSession session)throws ServletException,IOException
	{
		
		BufferedWriter bufferedWriter = null;
        File myFile=null;
        FileWriter fw=null;
        try {
             myFile = new File("/opt/lampp/htdocs/Trash/"+RegNo+".html");

            if (!myFile.exists()) {
                myFile.createNewFile();
            }
            fw=new FileWriter(myFile);
            bufferedWriter = new BufferedWriter(fw);
            bufferedWriter.write(code);
        }
         catch (IOException e) {
            e.printStackTrace();
        }
        finally{
               bufferedWriter.close();
               fw.close();
        }   
         String path="http://localhost:1234/Trash/"+RegNo+".html";
        out.println("<iframe src="+path+" width=100% height=100%></iframe>");
        CodeStorage(code,out,input,sub,pracNo,session);


	}
	void PHPCodeCompiler(String code,PrintWriter out,String input,String sub,String pracNo,HttpSession session)throws ServletException,IOException
    {

    	BufferedWriter bufferedWriter = null;
        File myFile=null;
        FileWriter fw=null;
        try {
             myFile = new File("/opt/lampp/htdocs/Trash/"+RegNo+".php");

            if (!myFile.exists()) {
                myFile.createNewFile();
            }
            fw=new FileWriter(myFile);
            bufferedWriter = new BufferedWriter(fw);
            bufferedWriter.write(code);
        }
         catch (IOException e) {
            e.printStackTrace();
        }
        finally{
               bufferedWriter.close();
               fw.close();
        }   
         String path="http://localhost:1234/Trash/"+RegNo+".php";
        out.println("<iframe src="+path+" width=100% height=100%></iframe>");
       // myFile.delete();
        CodeStorage(code,out,input,sub,pracNo,session);


    }

    /* void ServletCodeCompiler(String code,PrintWriter out,String input,String sub,String pracNo,HttpSession session)throws ServletException,IOException
    {
       
       int startIndex = code.indexOf("class");
         int endIndex = code.indexOf(" ", startIndex);
        int endIndex1 = code.indexOf(" ", endIndex+1);

         String fileName = code.substring(endIndex,endIndex1);  

    BufferedWriter bufferedWriter = null;
        File myFile=null;
        FileWriter fw=null;
        try {
             myFile = new File("/home/ankit/apache-tomcat-8.5.20/webapps/Paperless/WEB-INF/classes/"+fileName.trim()+".java");

            if (!myFile.exists()) {
                myFile.createNewFile();
            }
            fw=new FileWriter(myFile);
            bufferedWriter = new BufferedWriter(fw);
            bufferedWriter.write(code);
        }
         catch (IOException e) {
            e.printStackTrace();
        }
        finally{
               bufferedWriter.close();
               fw.close();
        }  

        Runtime rt = Runtime.getRuntime();
        Process p1=rt.exec("javac -sourcepath /home/ankit/apache-tomcat-8.5.20/webapps/Paperless/WEB-INF/classes/  /home/ankit/apache-tomcat-8.5.20/webapps/Paperless/WEB-INF/classes/"+fileName.trim()+".java ");
              
      String path="http://localhost:8080/"+fileName.trim();
        out.println("<iframe src="+path+" width=100% height=100%></iframe>");     

          myFile.delete();
          File fileclass=new File("/home/ankit/apache-tomcat-8.5.20/webapps/Paperless/WEB-INF/classes/"+fileName.trim()+".class");
          fileclass.delete();
           

          CodeStorage(code,out,input,sub,pracNo,session); 
    } */


   void CodeStorage(String code,PrintWriter out,String input,String sub,String pracNo,HttpSession session)throws ServletException,IOException
   {
       
              java.util.Date d=new java.util.Date();
              long l=d.getTime();
              java.sql.Date sdate=new java.sql.Date(l);
             String RegNo=(String)session.getAttribute("RegNo");
             String year=(String)session.getAttribute("year"); 
            try{
            PreparedStatement ps = null;
            Connection con=null;
            Statement st=null;            
              Class.forName("com.mysql.jdbc.Driver");
              con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/paperless", "root", "root"); 
              st=con.createStatement();
              


            String sql=String.format("select * from "+year+" where username='"+RegNo+"' and PracNo='"+pracNo+"' and Subject='"+sub+"'"); 
            ResultSet rs=st.executeQuery(sql); 

            if(!rs.next())
            {           
              try {
            ps = con.prepareStatement("insert into "+year+"(username,PracNo,code,Subject,SDate,input) values (?,?,?,?,?,?)");
            ps.setString(1,RegNo);
            ps.setString(2,pracNo);
            ps.setString(3,code);
            ps.setString(4,sub);
            ps.setDate(5,sdate);
            ps.setString(6,input);
            ps.executeUpdate();
            }catch(Exception e){
            out.println(e);
            }finally {
              try{
            ps.close();
          }catch(Exception e){out.println(e);}
            }
           }

           else{          

            try{
            ps = con.prepareStatement("update "+year+" set code=?,PracNo=?,Subject=?,input=? where username=? and PracNo=? and Subject=?");
            
            //ps.setString(1,year);
            ps.setString(1,code);
            ps.setString(2,pracNo);
            ps.setString(3,sub);
            ps.setString(4,input);
            ps.setString(5,RegNo);
            ps.setString(6,pracNo);
            ps.setString(7,sub);
            ps.executeUpdate();
            }catch(Exception e){
            out.println(e);
            }finally {
              try{
            ps.close();
          }catch(Exception e){out.println(e+"else");}
            }
           }
         
         }
         catch(Exception e){out.println(e+"outer");}
         

   }
}