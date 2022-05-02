
<%@page import="java.sql.ResultSet"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="edu.stanford.nlp.tagger.maxent.MaxentTagger" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
              String com = request.getParameter("comments");
              MaxentTagger tagger = new MaxentTagger(
                "E:\\MEGA PROJECT\\Secure\\web\\tagger/english-bidirectional-distsim.tagger");
  String tagged = tagger.tagString(com);
 // out.println(tagged);
  tagged=tagged.replace("_\\.", " ");
  String[] optarget=new String[20];
  String[] opword=new String[20];
  String[] sentence=tagged.split("\\. ");
  int cnt=0;
  String[] comp=new String[100];
  String comp1="",compp="",compp1="",comp9="";
  int neg=0,pos=0;
  String target="";
  //out.println(sentence.length);
  //out.println(tagged);
  for(int g=0;g<sentence.length;g++)
  {
    neg=0;pos=0;  
    String[] token=sentence[g].split(" ");
    if(sentence[g].contains("_CC") || sentence[g].contains(","))
    {
    for(int t=0;t<token.length;t++)
    {
    if(token[t].contains("_CC"))
    {
      
  if((token[t-1].contains("_NNP") || token[t-1].contains("_NN") || token[t-1].contains("_NNPS")
          || token[t-1].contains("_NNS") || token[t-1].contains("_FW") || token[t-1].contains("_CD")) 
          && !token[t+1].contains("_NN") && !token[t+1].contains("_FW") 
          && !token[t+1].contains("_CD"))
       {  int flag1=1;   int flag2=0;  int flag3=0;
          if(t-2>0) {
         if(token[t-2].contains("_NNP") || token[t-2].contains("_NN") || 
         token[t-2].contains("_NNPS") || token[t-2].contains("_NNS") || token[t-2].contains("_FW") 
         || token[t-2].contains("_CD")) {     
          flag2=1;
          if(t-3>0) {
          if(token[t-3].contains("_NNP") || token[t-3].contains("_NN") || token[t-3].contains("_NNPS") 
         || token[t-3].contains("_NNS") || token[t-3].contains("_FW") || token[t-3].contains("_CD"))   {
          flag3=1;
             }    }    }   }
          if(flag1==1 && flag2==0 && flag3==0)     {
           comp1=token[t-1];
           comp[g]=token[t-1];
           compp=comp1.concat(", ");  }
          else if(flag1==1 && flag2==1 && flag3==0)   {      
              comp1=token[t-2].concat(" ");
              comp1=comp1.concat(token[t-1]);
              comp[g]=comp1.concat(" ").concat(token[t-1]).concat(", ");
              compp=comp1.concat(", ");    }
          else if(flag1==1 && flag2==1 && flag3==1)
          { 
              comp1=token[t-3].concat(" ");
           comp1=comp1.concat(token[t-2]).concat(" ");
                       comp1=comp1.concat(token[t-1]);
          compp=comp1.concat(", ");
                     comp[g]=token[t-1];
         
                                 compp=comp1.concat(", ");
          }
      }
  else if(token[t-1].contains("_JJ") && token[t+3].contains("_JJ"))
       {
           int co=0;
           String t3=token[t-3].substring(0, token[t-3].indexOf("_"));
           String t33=token[t+3].substring(0, token[t+3].indexOf("_"));
           String t11=token[t+1].substring(0, token[t+1].indexOf("_"));
           String t1=token[t-1].substring(0, token[t-1].indexOf("_"));
       target=target.concat(t3).concat(", ").concat(t11);
       opword[co]=token[t-1];
       optarget[co]=t3;
           co++;
           opword[co]=token[t+3];
       optarget[co]=t11;
      // out.println(co);
       co++;
       
       String email = session.getAttribute("v").toString();
                String n = request.getParameter("uname");
                String p = request.getParameter("pitem");
              Calendar cal = Calendar.getInstance();
                SimpleDateFormat dateFormat = new SimpleDateFormat();
                String startD = cal.getTime().toGMTString().replaceAll("GMT", " ");
                InetAddress ip;
                ip = InetAddress.getLocalHost();
                String userip = ip.getHostAddress();
                System.out.println("System Ip " + userip);
                Connection con = Database.getConnection();
                Statement st = con.createStatement();
                
                
       for(int g1=0;g1<co;g1++){
           pos=0;neg=0;
        String[] fintk=opword[g1].split("_");
        out.println("fintknew "+fintk[0]);
        
         ResultSet rs1 = st.executeQuery("select list from positive");
         
                while(rs1.next())
                {
                   if(fintk[0].equalsIgnoreCase(rs1.getString(1)))
                   {
                       out.println("positive");
                       pos++;
                       break;
                   }
                }
               
                ResultSet rs2 = st.executeQuery("select list from negative");
         
                while(rs2.next())
                {
                   if(fintk[0].equals(rs2.getString(1)))
                   {
                       out.println("negative");
                       neg++;
                       break;
                   }
                } 
       
       
       if (pos==0 && neg>0) {
                    try{
                     out.println("yes1");
                   st.executeUpdate("insert into blocklist (uname, email, ipaddress, product, rating,optarget,comments) values ('"+n+"','"+userip+"','"+email+"','" + p + "','Negative','"+optarget[g1]+"','"+com+"')");
                    response.sendRedirect("search.jsp?thank you for your feedack");
                   out.println("VERDICT: NEGATIVE");
                  
                    }catch(Exception ex){out.println(ex);}
                } else if(pos>0 && neg==0){
                    try{
                    int i = st.executeUpdate("insert into feed (feedback, rating , comments, ipaddr, date_time, name,optarget) values('" + p + "','Positive','" + com + "','" + userip + "','" + startD + "','" + n + "','"+optarget[g1]+"')");
                    if (i != 0) {
                       response.sendRedirect("search.jsp?thank you for purchased items");
                          out.println("VERDICT: POSITIVE");
                    }
                    
                    }catch(Exception ex){out.println(ex);}
                }
       }
    }
  else if((token[t-1].contains("_N") || token[t-1].contains("_FW") || token[t-1].contains("_CD")) || (token[t+1].contains("_N") || token[t+1].contains("_FW") || token[t+1].contains("_FW")))
       {//quality[t-1] and[t] screen[t+1] is[t+2 good[t+3]
           int co=0;
           String t33=token[t+3].substring(0, token[t+3].indexOf("_"));
           String t11=token[t+1].substring(0, token[t+1].indexOf("_"));
           String t1=token[t-1].substring(0, token[t-1].indexOf("_"));
       opword[co]=token[t+3];
       optarget[co]=t1;
           co++;
           opword[co]=token[t+3];
       optarget[co]=t11;
      // out.println(co);
       co++;
       
       String email = session.getAttribute("v").toString();
                String n = request.getParameter("uname");
                String p = request.getParameter("pitem");
              Calendar cal = Calendar.getInstance();
                SimpleDateFormat dateFormat = new SimpleDateFormat();
                String startD = cal.getTime().toGMTString().replaceAll("GMT", " ");
                InetAddress ip;
                ip = InetAddress.getLocalHost();
                String userip = ip.getHostAddress();
                System.out.println("System Ip " + userip);
                Connection con = Database.getConnection();
                Statement st = con.createStatement();
                
                
       for(int g1=0;g1<co;g1++){
           pos=0;neg=0;
        String[] fintk=opword[g1].split("_");
        out.println("fintknew "+fintk[0]);
        
         ResultSet rs1 = st.executeQuery("select list from positive");
         
                while(rs1.next())
                {
                   if(fintk[0].equalsIgnoreCase(rs1.getString(1)))
                   {
                       out.println("positive");
                       pos++;
                       break;
                   }
                }
               
                ResultSet rs2 = st.executeQuery("select list from negative");
         
                while(rs2.next())
                {
                   if(fintk[0].equals(rs2.getString(1)))
                   {
                       out.println("negative");
                       neg++;
                       break;
                   }
                } 
       
       
       if (pos==0 && neg>0) {
                    try{
                     out.println("yes2 ");
                   st.executeUpdate("insert into blocklist (uname, email, ipaddress, product, rating,optarget,comments) values ('"+n+"','"+userip+"','"+email+"','" + p + "','Negative','"+optarget[g1]+"','"+com+"')");
                    response.sendRedirect("search.jsp?thank you for your feedack");
                   out.println("VERDICT: NEGATIVE");
                  
                    }catch(Exception ex){out.println(ex);}
                } else if(pos>0 && neg==0){
                    try{
                    int i = st.executeUpdate("insert into feed (feedback, rating , comments, ipaddr, date_time, name,optarget) values('" + p + "','Positive','" + com + "','" + userip + "','" + startD + "','" + n + "','"+optarget[g1]+"')");
                    if (i != 0) {
                       response.sendRedirect("search.jsp?thank you for purchased items");
                          out.println("VERDICT: POSITIVE");
                    }
                    
                    }catch(Exception ex){out.println(ex);}
                }
       }
       }
  pos=0;neg=0;
  target="";
    } 
  }
  if(!comp9.contains(compp.concat(compp1)))
  {comp9=comp9.concat(compp.concat(compp1));
  out.println("comp "+comp9);
  
       }
    
       }
       else{
    for(int t=0;t<token.length;t++)
    {
       
        if(token[t].contains("_NN")){
        
        optarget[cnt]=token[t];
        out.println(optarget[cnt]);
        String[] nnt=token[t].split("_");
        target=nnt[0];
       }
       
     if(token[t].contains("_JJ"))
        {
            opword[cnt]=token[t];
        out.println(opword[cnt]);
    //check if adj is positive or negative.
        String[] fintk=opword[cnt].split("_");
        out.println("fintk "+fintk[0]);
          Connection con = Database.getConnection();
                Statement st = con.createStatement();
         ResultSet rs1 = st.executeQuery("select list from positive");
         
                while(rs1.next())
                {
                   if(fintk[0].equalsIgnoreCase(rs1.getString(1)))
                   {
                       out.println("positive");
                       pos++;
                       break;
                   }
                }
               
                ResultSet rs2 = st.executeQuery("select list from negative");
         
                while(rs2.next())
                {
                   if(fintk[0].equals(rs2.getString(1)))
                   {
                       out.println("negative");
                       neg++;
                       break;
                   }
                }   
        }
        
    }
    
    }
   
 
            try {
                out.println("tt "+target);
                String email = session.getAttribute("v").toString();
                String n = request.getParameter("uname");
                String p = request.getParameter("pitem");
              String[] tartok=target.split(", ");
               Calendar cal = Calendar.getInstance();
                SimpleDateFormat dateFormat = new SimpleDateFormat();
                String startD = cal.getTime().toGMTString().replaceAll("GMT", " ");
                InetAddress ip;
                ip = InetAddress.getLocalHost();
                String userip = ip.getHostAddress();
                System.out.println("System Ip " + userip);
                Connection con = Database.getConnection();
                Statement st = con.createStatement();
              
              for(int h=0;h<tartok.length;h++){
               
                if (pos==0 && neg>0) {
                    try{
                     out.println("yes");
                   st.executeUpdate("insert into blocklist (uname, email, ipaddress, product, rating,optarget,comments) values ('"+n+"','"+userip+"','"+email+"','" + p + "','Negative','"+tartok[h]+"','"+com+"')");
                    response.sendRedirect("search.jsp?thank you for your feedack");
                   out.println("VERDICT: NEGATIVE");
                  
                    }catch(Exception ex){out.println(ex);}
                } else if(pos>0 && neg==0){
                    try{
                    int i = st.executeUpdate("insert into feed (feedback, rating , comments, ipaddr, date_time, name,optarget) values('" + p + "','Positive','" + com + "','" + userip + "','" + startD + "','" + n + "','"+tartok[h]+"')");
                    if (i != 0) {
                       response.sendRedirect("search.jsp?thank you for purchased items");
                          out.println("VERDICT: POSITIVE");
                    }
                    
                    }catch(Exception ex){out.println(ex);}
                }
                else if(pos>0 && neg>0){
                    int i = st.executeUpdate("insert into feed (feedback, rating , comments, ipaddr, date_time, name,optarget) values('" + p + "','Neutral','" + com + "','" + userip + "','" + startD + "','" + n + "','"+tartok[h]+"')");
                    if (i != 0) {
                      response.sendRedirect("search.jsp?thank you for purchased items");
                    }
                     out.println("VERDICT: NEUTRAL");
                }
                else{
                    
                }
            }
            } catch (Exception e) {
                out.println("Exception Error in Rate " + e);
            }
            }
        %>
    </body>
</html>
