import java.util.Properties;
import java.io.PrintWriter;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.*;
public class Mailerf {
public static void send(String to,PrintWriter out){
   
	String msg="";

     ResultSet rs=null;
     String fileData =null;
     PreparedStatement ps = null;
     PreparedStatement ps1 = null;
     Connection con=null;
     try{
          
          Class.forName("com.mysql.jdbc.Driver");
          con =DriverManager.getConnection ("jdbc:mysql://localhost:3306/paperless", "root", "root"); 
          ps=con.prepareStatement("select * from fsignup where username=?");
          ps.setString(1,to);
          rs=ps.executeQuery();

          
       if (rs.next()) {
        
          String name=rs.getString("name");
          String password=rs.getString("password");
          String branch=rs.getString("branch");
          msg="Name="+name+"\n Password="+password+"\n Branch="+branch;
	
		} else {


		out.println("data not found for given id");

		return;

		}
		
		          
      con.close();

        }
      catch(Exception e)
      {
      	out.println(e);
      }
      finally {

try {

rs.close();

ps.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();

}

}



final String user="chopadeankit1997@gmail.com";//change accordingly
final String pass="30061997";
String subject="Credentials Of Paperless";
//1st step) Get the session object	
String host = "smtp.gmail.com";

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", "587");

Session session = Session.getDefaultInstance(props,
 new javax.mail.Authenticator() {
  protected PasswordAuthentication getPasswordAuthentication() {
   return new PasswordAuthentication(user,pass);
   }
});
//2nd step)compose message
try {
 MimeMessage message = new MimeMessage(session);
 message.setFrom(new InternetAddress(user));
 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
 message.setSubject(subject);
 message.setText(msg);
 
 //3rd step)send message
 Transport.send(message);

 System.out.println("Done");
out.print("message has been sent successfully");


 } catch (MessagingException e) {
	throw new RuntimeException(e);
 }
	
}
}
