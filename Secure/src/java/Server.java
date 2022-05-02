
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.swing.JOptionPane;
 
public class Server
{
  private InetAddress thisIp;

    private static String thisIpAddress;
    private static Socket socket;
    
 public static void fun(){
     try{
   InetAddress thisIp = InetAddress.getLocalHost();
            thisIpAddress = thisIp.getHostAddress();
            System.out.println(thisIpAddress);
         
            
     }catch(Exception ex){System.out.println(ex);}
 }
    public static void main(String[] args)
    { 

try{
   fun();
String date = new SimpleDateFormat("dd/MM/yyyy").format(new Date());
    System.out.println(date);
 
    String time = new SimpleDateFormat("HH:mm").format(new Date());
    System.out.println(time);
   
}

    catch(Exception ex){System.out.println(ex);}
    try
    {
            Thread.currentThread().setPriority(1); //priority app
            int port = 25001; //socket prog
            ServerSocket serverSocket = new ServerSocket(port);//generate server socket
            System.out.println("port 25001");
            String loc="",longi="",lati="",cityn="",em="",un="kp",pas="kp";
            while(true)
            {
                socket = serverSocket.accept();
                InputStream is = socket.getInputStream();
                InputStreamReader isr = new InputStreamReader(is);//isr-input stream reader,store ip stream in is
                BufferedReader br = new BufferedReader(isr);
                String cre = br.readLine();
                System.out.println("Client Message "+cre);
                   String returnMessage="";
                             if(cre.contains("--"))
                {
                String[] tokecre=new String[3];
              //  String returnMessage="";
  if(cre.equals("--")){
      returnMessage="Enter Credentials"+"\n";
  }
  else if(cre.endsWith("--")){
 returnMessage="Enter Valid Credentials"+"\n";
  }  
  else if(cre.contains("markdeliver--")){
                String tok[]=cre.split("--");
                String nm=tok[1];String dloc=tok[2];
                  try
                {
                       String myDriver = "com.mysql.jdbc.Driver";//mysql db
      String myUrl = "jdbc:mysql://localhost:3306/user";//db url
            Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "");
      Statement st = conn.createStatement();     
      //here get all the deliveries for him
      String allitm="";
      String query = "update cart set status='SHIPPED' where name='"+nm+"' and dlocation='"+dloc+"'";
      st.executeUpdate(query); 
      String quer = "select pendingcount from delivery where email='"+un+"'";
      ResultSet rs = st.executeQuery(quer);
      int pc=0;
      if(rs.next()==true)
      {pc=rs.getInt(1);
      pc=pc-1;}
        String query6 = "UPDATE delivery set pendingcount='"+pc+"' where email='"+un+"'";
      PreparedStatement preparedStmt6 = conn.prepareStatement(query6);
      preparedStmt6.executeUpdate(); 
      returnMessage="marked\n";
        }
                  catch(Exception ex){System.out.println(ex);}
                 
                }
  else {
tokecre=cre.split("--");
 un=tokecre[0];//user name
 pas=tokecre[1];//paasword
 longi=tokecre[2];
 lati=tokecre[3];
 cityn=tokecre[4];
                try
                {
                       String myDriver = "com.mysql.jdbc.Driver";//mysql db
      String myUrl = "jdbc:mysql://localhost:3306/user";//db url
            Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "");
      Statement st = conn.createStatement();     
      String query = "select email from delivery where email='"+un+"' && pass='"+pas+"'";
      ResultSet rs = st.executeQuery(query);
      if(rs.next()==true)
      {
          
           returnMessage="LOGIN DONE"+"\n";//string initialization
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date1 = new Date();
            String dt=dateFormat.format(date1);
            System.out.println(dt);
            long time=date1.getTime();
            try{
             
                Class.forName(myDriver);
                     try{
   String query6 = "UPDATE delivery set currentloc='"+cityn+"' where email='"+un+"'";
      PreparedStatement preparedStmt6 = conn.prepareStatement(query6);
      preparedStmt6.executeUpdate(); 
                   
       }catch(Exception ex){System.out.println(ex);}
                
          
            }
            
               catch(Exception ex){System.out.println("HERE "+ex);}
      }
      else{
          returnMessage="No such user"+"\n";
      }
                }
                catch(Exception e)
                {
                    returnMessage = "No such user"+"\n";
                }
          }
               OutputStream os = socket.getOutputStream();//output stream display on mobile
               OutputStreamWriter osw = new OutputStreamWriter(os);
               BufferedWriter bw = new BufferedWriter(osw);
               bw.write(returnMessage);
               System.out.println("Message sent to the client is "+returnMessage);
               bw.flush();
            }
                else if(cre.contains("getpending ")){
                String tok[]=cre.split(" ");
                String uno=tok[1];System.err.println(uno);
                  try
                {
                       String myDriver = "com.mysql.jdbc.Driver";//mysql db
      String myUrl = "jdbc:mysql://localhost:3306/user";//db url
            Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "");
      Statement st = conn.createStatement();     
      //here get all the deliveries for him
      String allitm="";
      String query = "select name,productname,productitem,quantity,dlocation from cart where dperson='"+uno+"' and status='YES'";
      ResultSet rs = st.executeQuery(query);
      if(rs.next())
      {
          allitm=rs.getString(1).concat("--").concat(rs.getString(2).concat("--")+rs.getString(3)+"--"+rs.getString(4)+ "--"+rs.getString(5)+"\n");
      returnMessage=allitm;
      }
      else{returnMessage=""+"\n";} 
        }
                  catch(Exception ex){System.out.println(ex);}
                 
                }
               
                
                else{returnMessage=""+"\n";}
              OutputStream os = socket.getOutputStream();//output stream display on mobile
               OutputStreamWriter osw = new OutputStreamWriter(os);
               BufferedWriter bw = new BufferedWriter(osw);
               bw.write(returnMessage);
               System.out.println("Message sent to the client is "+returnMessage);
               bw.flush();  
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
              // socket.close();
            }
            catch(Exception e2){System.out.println("new" + e2);}
        }
    }
}