<%-- 
    Document   : delhome
    Created on : Feb 5, 2018, 5:43:47 AM
    Author     : Neena
--%>
<!DOCTYPE html>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dynamic Route Planning</title>
        <meta name="description" content="">
        <meta name="author" content="templatemo">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <div id="container" class="container">
            <div style="width: 1200px;margin: 30px;color: white">
                <center><h1>Enhanced Automated Planning and Routing System for Product Delivery</h1></center>
            </div>
            <div> 
               <ul class="nav nav-justified">
                    <li class="active"><a href="delhome.jsp">Home</a></li>
                    <li><a href="ddetails.jsp">Profile</a></li>
                    <li><a href="delhome.jsp">Assigned Shipping</a></li>
                    <li><a href="delhome.jsp">Shipping History</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
            </div><br />
             <div style=" width:1200px" align="center">  <font color="white">
            <c:if test="${not empty param.msg}">
            <c:out value="${param.msg}" />
            </c:if></font></div>
            <div style="border:1px solid white;width: 1250px;height: 400px;margin-left: 30px;border-radius: 40px;background-image: url('images/wall1.jpg')">
               <br><h1 style="color: white;margin-right: 120px;margin-left: 500px;margin-top: -4px">Welcome Delivery Person</h1>
                <div style=" margin-left: 200px">
               
                </div>
            </div>
        </div> <!-- /container -->
        <div>
        </div>
    </body>
</html>