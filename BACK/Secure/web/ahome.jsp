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
            <div style="width: 1300px;margin: 30px;color: white">
                <center><h1>Enhanced Automated Planning and Routing System for Product Delivery</h1></center>
            </div>
            <div>
                <ul class="nav nav-justified">
                    <li><a href="audetails.jsp">User Details</a></li>
                    <li><a href="additems.jsp">Add Item</a></li>
                    <li><a href="adddel.jsp">Add Delivery Person</a></li>
                    <li><a href="pviewdetails.jsp">Product Details</a></li>
                    <li><a href="shipping.jsp">Shipping Details</a></li>
                    <li><a href="assigndp.jsp">Assigned Delivery Person</a></li>
                   <li><a href="shipped.jsp">Shipped Products</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
            </div><br />
            <div class="abstract" style="background-image: url('images/wall1.jpg')"><br />
                <div align="center">  <font color="red">
            <c:if test="${not empty param.msg}">
            <c:out value="${param.msg}" />
            </c:if></font></div>
                <center><h1 style="color: white">Welcome Admin</h1>  </center>
                <div style=" margin-left: 200px">
                 
                </div>
            </div>
          
        </div> <!-- /container -->
        <div>
        </div>
    </body>
</html>