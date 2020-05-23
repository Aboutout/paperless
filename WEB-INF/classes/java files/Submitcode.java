import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import javax.servlet.annotation.*;
import java.lang.*;
import java.sql.*;
@WebServlet("/submitcode")

public class Submitcode extends HttpServlet
{

	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		PrintWriter out=resp.getWriter();
        resp.setContentType("text/html");
		String code=req.getParameter("content3");
		String lang=req.getParameter("lang");
		String font=req.getParameter("font");
    String input=req.getParameter("input");
    String id1=req.getParameter("id1");
    int id=Integer.parseInt(id1);       
          if(lang.equals("java"))
          {
          	  JavaCodeCompiler(code,out,input,id);
          }
          else if(lang.equals("c_cpp"))
          {
          	CPPCodeCompiler(code,out);
          }
          else
          {
          	out.println("please select language");
          }
          

		HttpSession session=req.getSession();
		session.setAttribute("code",code);
		session.setAttribute("lang",lang);
		session.setAttribute("font",font);

		
		//resp.sendRedirect("/Paperless/dashboard.jsp");


	}

	void JavaCodeCompiler(String code,PrintWriter out,String input,int id)throws ServletException,IOException
	{
    
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

            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = null;
            String output="";

            while((line = br.readLine()) != null){
            output+=line;
            out.println(line);
          }

            BufferedReader br2 = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            String line2 = null;
            String output2=null;

            while((line2 = br2.readLine()) != null){
            output2+=line2;
            out.println(line2);}

          
            BufferedReader br1 = new BufferedReader(new InputStreamReader(p1.getErrorStream()));
            String line1 = null;
            String output3=null;
            while((line1 = br1.readLine()) != null){
            output2+=line1;
            out.println(line1);
}

           
           if(output.equals("Good Morning123"))
           {
            try{
            out.println("Successfully Stored");
            PreparedStatement ps = null;
            Connection con=null;
            Statement st=null;            
              Class.forName("com.mysql.jdbc.Driver");
              con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/paperless", "root", "root"); 
              st=con.createStatement();
            String sql=String.format("select * from source where userid=50"); 
            ResultSet rs=st.executeQuery(sql); 
            if(!rs.next())
            {           
              try {
            ps = con.prepareStatement("insert into source(userid,file) values (?, ?)");
            
            ps.setInt(1,id);
            ps.setString(2,code);
            ps.executeUpdate();
            }catch(Exception e){
            System.out.println(e);
            }finally {
              try{
            ps.close();
          }catch(Exception e){}
            }
           }

           else{          

            try{
            ps = con.prepareStatement("update source set file=? where userid=?");
            
            ps.setInt(2,id);
            ps.setString(1,code);
            ps.executeUpdate();
            }catch(Exception e){
            System.out.println(e);
            }finally {
              try{
            ps.close();
          }catch(Exception e){}
            }
           }
         
         }
         catch(SQLException e){}
         catch(Exception e){}
         }
         
           else {
                out.println("Opration UnSuccessfull plz compile again");

           }
            br.close();
            br2.close();
            br1.close();
            myFile.delete();
          File fileclass=new File("/home/ankit/Desktop/DAA/"+fileName.trim()+".class");
          fileclass.delete();
	}
	void CPPCodeCompiler(String code,PrintWriter out)throws ServletException,IOException
	{
		     BufferedWriter bufferedWriter = null;
        File myFile=null;
        FileWriter fw=null;
        try {
             myFile = new File("/home/ankit/Desktop/DAA/Ankit.c");

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
             Process p1=rt.exec("gcc /home/ankit/Desktop/DAA/Ankit.c -o Ankit && /home/ankit/Desktop/DAA/./Ankit");

           // Process p = rt.exec("./a.out");

            BufferedReader br = new BufferedReader(new InputStreamReader(p1.getInputStream()));
             String line = null;

            while((line = br.readLine()) != null)
            out.println(line);

            BufferedReader br1 = new BufferedReader(new InputStreamReader(p1.getErrorStream()));
            String line1 = null;
            while((line1 = br1.readLine()) != null)
            out.println(line1);
           br.close();
          br1.close();
	}
	/*void CPPCodeCompiler(String code,PrintWriter out)throws ServletException,IOException
	{
		
	}
	void JavaCodeCompiler(String code,PrintWriter out)throws ServletException,IOException
	{
		
	}
	void JavaCodeCompiler(String code,PrintWriter out)throws ServletException,IOException
	{
		
	}
	void JavaCodeCompiler(String code,PrintWriter out)throws ServletException,IOException
    {

    }*/
}