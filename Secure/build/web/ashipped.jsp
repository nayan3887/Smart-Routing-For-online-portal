<%-- 
    Document   : delete
    Created on : 10 Mar, 2015, 11:38:27 AM
    Author     : USER
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page  import="java.sql.*"  %>
<%@ page  import="java.io.*"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@page import="java.net.InetAddress" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           try{
                    String name = request.getParameter("name"); 
    Class.forName("com.mysql.jdbc.Driver");                    
              Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/online?user=root&password=root");  
 
      
        PreparedStatement p=con1.prepareStatement("update cart set status='SHIPPED' where name='"+name+"'");
                                p.executeUpdate();
                                   response.sendRedirect("ashipped.jsp");
           }catch(Exception ex){out.println(ex);}
       %>
    </body>
</html>
