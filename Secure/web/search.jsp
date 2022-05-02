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
                    <li class="active"><a href="uview.jsp">Home</a></li>
                    <li><a href="udetails.jsp">Profile</a></li>
                    <li><a href="cartdetails.jsp">Cart</a></li>
                    <li><a href="search.jsp">Product Search</a></li>
               
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
            </div><br />
            <div style="border:1px solid white;width: 1250px;height: 400px;margin-left: 30px;border-radius: 40px;background-color: "><br />
              <div style=" width:1200px" align="center">  <font color="white">
            <c:if test="${not empty param.msg}">
            <c:out value="${param.msg}" />
            </c:if></font></div>  
                <div style="">
                    <center><h4 style="font-size: 20px;font-family: Times New Roman;color: #FFFFFF">Enter product to search </h4></center>
                    <center> <form action="sview.jsp" method="post">
                            <input type="text" name="focus" required class="search-box" placeholder="Enter Word Alignment" />
                            <button class="close-icon" type="reset"></button><br /><br />
                            <input type="submit" value="Search" style="width: 120px;height: 30px;border-radius: 10px;background: white"/>
                        </form>
                    </center>
                </div> 
            </div>
        </div> <!-- /container -->
        <div>
        </div>
    </body>
</html>