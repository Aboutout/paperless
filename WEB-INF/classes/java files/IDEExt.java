import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import javax.servlet.annotation.*;
import java.lang.*;
import java.sql.*;
@WebServlet("/edata")

public class IDEExt extends HttpServlet
{
  String output="";

	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		    PrintWriter out=resp.getWriter();
        resp.setContentType("text/html");
		    String code=req.getParameter("content1");
		    String lang=req.getParameter("lang");
		    String font=req.getParameter("font");
        String input=req.getParameter("input");
  

        HttpSession session=req.getSession();
		

       
          if(lang.equals("java"))
          {
          	JavaCodeCompiler(code,out,input,session,resp);
          }
          else if(lang.equals("c_cpp"))
          {
          	CCodeCompiler(code,out,input,session,resp);
          }
          else if(lang.equals("c_cpp1"))
          {
            CPPCodeCompiler(code,out,input,session,resp);
          }
          else if(lang.equals("sql"))
          {
          	SQLCodeCompiler(code,out,input,session,resp);
          }
          else if(lang.equals("python"))
          {
          	PYCodeCompiler(code,out,input,session,resp);
          }
          else if(lang.equals("html"))
          {
          	HTMLCodeCompiler(code,out,input,session);
          }
          else if(lang.equals("php"))
          {
          	PHPCodeCompiler(code,out,input,session);
          }
          else
          {
          	output="please select language";
            session.removeAttribute("eoutput");
          session.setAttribute("eoutput",output);
          resp.sendRedirect("/Paperless/IDEExt.jsp");
          }
          
        session.setAttribute("ecode",code);
      	session.setAttribute("elang",lang);
      	session.setAttribute("efont",font);
      	session.setAttribute("einput",input);
      	

	}

	void JavaCodeCompiler(String code,PrintWriter out,String input,HttpSession session,HttpServletResponse resp)throws ServletException,IOException
	{
    output=" ";

		int startIndex = code.indexOf("class");
         int endIndex = code.indexOf(" ", startIndex);
        int endIndex1 = code.indexOf(" ", endIndex+1);

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

            BufferedReader br1 = new BufferedReader(new InputStreamReader(p1.getErrorStream()));
            String line1 = null;
            String linee1="";
            while((line1 = br1.readLine()) != null)
            //out.println(line1);
              //linee1+=line1;
            output+=line1;


             BufferedReader br2 = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            String line2 = null;
            String linee2="";
            while((line2 = br2.readLine()) != null)
           //out.println(line2);
             // linee2+=line2;
            output+=line2;

            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = null;
            String linee="";
            while((line = br.readLine()) != null)
           //out.println(line);
             // linee+=line;
            output+=line;

         

          
            
          br.close();
          br2.close();
          br1.close();
          myFile.delete();
          File fileclass=new File("/home/ankit/Desktop/DAA/"+fileName.trim()+".class");
          fileclass.delete();
          session.removeAttribute("eoutput");
          session.setAttribute("eoutput",output);
          resp.sendRedirect("/Paperless/IDEExt.jsp");

           


         


	}
	void CCodeCompiler(String code,PrintWriter out,String input,HttpSession session,HttpServletResponse resp)throws ServletException
  {
    Process p=null;
    output=" ";
    int random_num=(int)Math.floor(Math.random()*1000);
    BufferedWriter bufferedWriter = null;
    File myFile=null;
    FileWriter fw=null;

    try{
    
       
        try {
             myFile = new File("/home/ankit/Desktop/DAA/"+random_num+".c");

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
               //myFile.close();
               bufferedWriter.close();
               fw.close();
        }


             Runtime rt = Runtime.getRuntime();
           p=rt.exec("gcc  /home/ankit/Desktop/DAA/"+random_num+".c -o  /home/ankit/Desktop/DAA/"+random_num);
         try{
              p.waitFor();
           }
           catch(InterruptedException e){
            out.println("InterruptedException");
           }

           
          
          Process p1=   rt.exec("/home/ankit/Desktop/DAA/./"+random_num);
        
        

        OutputStream out1 = p1.getOutputStream();
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(out1));
        writer.write(input);
        writer.flush();
        writer.close();
        out1.close();

             String line = null;

             BufferedReader br2 = new BufferedReader(new InputStreamReader(p.getErrorStream()));
           while((line = br2.readLine()) != null)
             //out.println(line);  
            output+=line;
           
            

            BufferedReader br1 = new BufferedReader(new InputStreamReader(p1.getErrorStream()));
            //String line1 = null;
            while((line = br1.readLine()) != null)
           // out.println(line);
              output+=line;

            BufferedReader br = new BufferedReader(new InputStreamReader(p1.getInputStream()));
             //String line = null;

            while((line = br.readLine()) != null)
            //out.println(line);
              output+=line;
        
  
          br.close();
          br1.close();
          br2.close();
          myFile.delete();
          File fileclass=new File("/home/ankit/Desktop/DAA/"+random_num);
          fileclass.delete();  
          session.removeAttribute("eoutput");
          session.setAttribute("eoutput",output);
          resp.sendRedirect("/Paperless/IDEExt.jsp");        
        
          }
        catch(IOException e)
        {
        try{
            myFile.delete();
            File fileclass=new File("/home/ankit/Desktop/DAA/"+random_num);
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
            session.removeAttribute("eoutput");
            session.setAttribute("eoutput",output);
            resp.sendRedirect("/Paperless/IDEExt.jsp"); 
         }
         catch(IOException e456){}
        }
        
 
      }
           



 void CPPCodeCompiler(String code,PrintWriter out,String input,HttpSession session,HttpServletResponse resp)throws ServletException
  {
    int random_num=(int)Math.floor(Math.random()*1000);
    output=" ";
    Process p=null;
    BufferedWriter bufferedWriter = null;
    File myFile=null;
    FileWriter fw=null;
    try{

    
        try {
             myFile = new File("/home/ankit/Desktop/DAA/"+random_num+".cpp");

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
               //myFile.close();
        }


             Runtime rt = Runtime.getRuntime();
            p=rt.exec("g++  /home/ankit/Desktop/DAA/"+random_num+".cpp -o  /home/ankit/Desktop/DAA/"+random_num);
           try{
              p.waitFor();
           }
           catch(InterruptedException e){}

           BufferedReader br2 = new BufferedReader(new InputStreamReader(p.getErrorStream()));
         String line2 = null;
         while((line2 = br2.readLine()) != null)
         //out.println(line2);  
         output+=line2;
           

          Process p1=   rt.exec("/home/ankit/Desktop/DAA/./"+random_num);

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
          File fileclass=new File("/home/ankit/Desktop/DAA/"+random_num);
          fileclass.delete(); 
            
         session.removeAttribute("eoutput");
         session.setAttribute("eoutput",output);
         resp.sendRedirect("/Paperless/IDEExt.jsp");
         }
        catch(IOException e)
        {
         try{
            myFile.delete();
            File fileclass=new File("/home/ankit/Desktop/DAA/"+random_num);
            fileclass.delete(); 
            String line="";
            BufferedReader br2=null;
            try{
             br2= new BufferedReader(new InputStreamReader(p.getErrorStream()));
            while((line = br2.readLine()) != null)
            output+=line;
           }
           catch(Exception o)
           {
           out.println(o);
           }
           finally
           {
            br2.close();
           }
            session.removeAttribute("eoutput");
            session.setAttribute("eoutput",output);
            resp.sendRedirect("/Paperless/IDEExt.jsp"); 
         }
         catch(IOException e789){}
    }


           



  }
	void SQLCodeCompiler(String code,PrintWriter out,String input,HttpSession session,HttpServletResponse resp)throws ServletException,IOException
	{
    output=" ";
            
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
    session.removeAttribute("eoutput");
    session.setAttribute("eoutput",output);
    resp.sendRedirect("/Paperless/IDEExt.jsp");


             
	 }
           
           else
           {
           	int row =stmt.getUpdateCount();
           	//out.println("Number Of rows effected"+row);
            output="Number Of rows effected"+row;
           session.removeAttribute("eoutput");
          session.setAttribute("eoutput",output);
          resp.sendRedirect("/Paperless/IDEExt.jsp");
           }
       }
       catch(Exception e){

       	out.println(e);
       }


          
	}
            
         


  void PYCodeCompiler(String code,PrintWriter out,String input,HttpSession session,HttpServletResponse resp)throws ServletException,IOException
  {
        int random_num=(int)Math.floor(Math.random()*1000);

    output=" ";
    
    BufferedWriter bufferedWriter = null;
        File myFile=null;
        FileWriter fw=null;
        try {
             myFile = new File("/home/ankit/Desktop/DAA/"+random_num+".py");

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
             Process p=rt.exec("python3  /home/ankit/Desktop/DAA/"+random_num+".py");
            
            
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

          session.removeAttribute("eoutput");
            session.setAttribute("eoutput",output);
            resp.sendRedirect("/Paperless/IDEExt.jsp");


  }
  void HTMLCodeCompiler(String code,PrintWriter out,String input,HttpSession session)throws ServletException,IOException
  {
        int random_num=(int)Math.floor(Math.random()*1000);

    
    BufferedWriter bufferedWriter = null;
        File myFile=null;
        FileWriter fw=null;
        try {
             myFile = new File("/opt/lampp/htdocs/Trash/"+random_num+".html");

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
         String path="http://localhost:1234/Trash/"+random_num+"..html";
        out.println("<iframe src="+path+" width=100% height=100%></iframe>");
        myFile.delete();


  }
  void PHPCodeCompiler(String code,PrintWriter out,String input,HttpSession session)throws ServletException,IOException
    {

    int random_num=(int)Math.floor(Math.random()*1000);

      BufferedWriter bufferedWriter = null;
        File myFile=null;
        FileWriter fw=null;
        try {
             myFile = new File("/opt/lampp/htdocs/Trash/"+random_num+".php");

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
         String path="http://localhost:1234/Trash/"+random_num+".php";
        out.println("<iframe src="+path+" width=100% height=100%></iframe>");
        myFile.delete();

    }

   
   
}