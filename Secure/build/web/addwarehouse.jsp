<%-- 
    Document   : adddel
    Created on : Feb 5, 2018, 5:56:50 AM
    Author     : Neena
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="action.Database"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dynamic Route Planning</title>
        <meta name="description" content="">
        <meta name="author" content="templatemo">
        <link href="css/style.css" rel="stylesheet">
        <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
    </head>
    <body>
        
        <div id="container" class="container">
                <div style="width: 1200px;margin: 30px;color: white">
                <center><h1>Enhanced Automated Planning and Routing System for Product Delivery</h1></center>
                </div>
            <div>
                <ul class="nav nav-justified">
                     <li><a href="ahome.jsp">Home</a></li>
                    <li><a href="additems.jsp">Add Item</a></li>
                    <li><a href="adddel.jsp">Add Delivery Person</a></li>
               <li><a href="addwarehouse.jsp">Add Warehouse</a></li>
                    <li><a href="pviewdetails.jsp">Product Details</a></li>
                   <li><a href="shipping.jsp">Shipping Details</a></li>
                   <li><a href="assigndp.jsp">Assigned Delivery Person</a></li>
                   <li><a href="shipped.jsp">Shipped Products</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
            </div><br />
            <div style=" width:700px" align="center">  <font color="white">
            <c:if test="${not empty param.msg}">
            <c:out value="${param.msg}" />
            </c:if></font></div>
            <div style="border: 1px solid white;border-radius: 20px;width: 500px;height: 500px;margin-left: 100px;">
                <center><h1 style="color: white">Add Warehouse Details</h1></center>
                <form action="actionaddwarehouse.jsp" method="post" style="margin-left: 50px">
                    <label style="font-size: 20px;color: white">Warehouse Name</label>&nbsp;&nbsp;<input type="text" name="wname" style="width: 200px;height: 20px;font-size: 20px;margin-left: 57px"/><br /><br />
                    <label style="font-size: 20px;color: white">Address</label>&nbsp;&nbsp;<input type="text" name="wadd" style="width: 200px;height: 20px;font-size: 20px;margin-left: 143px"/><br /><br />
                    <label style="font-size: 20px;color: white">Opening Time</label>&nbsp;&nbsp;<select name="ot" style="width: 200px;height: 30px;font-size: 20px;margin-left: 93px">
                        <option selected="">Select</option>
                        <option>8 AM</option>
                        <option>9 AM</option>
                        <option>10 AM</option>
                        <option>11 AM</option>
                        <option>12 PM</option>
                        <option>1 PM</option>
                        <option>2 PM</option>
                        <option>3 PM</option>
                        <option>4 PM</option>
                        <option>5 PM</option>
                        <option>6 PM</option>
                        <option>7 PM</option>
                        <option>8 PM</option>
                        <option>9 PM</option>
                        <option>10 PM</option>
                        <option>11 PM</option>
                    </select><br/><br/>
                   <label style="font-size: 20px;color: white">Closing Time</label>&nbsp;&nbsp;<select name="ct" style="width: 200px;height: 30px;font-size: 20px;margin-left: 100px">
                        <option selected="">Select</option>
                        <option>8 AM</option>
                        <option>9 AM</option>
                        <option>10 AM</option>
                        <option>11 AM</option>
                        <option>12 PM</option>
                        <option>1 PM</option>
                        <option>2 PM</option>
                        <option>3 PM</option>
                        <option>4 PM</option>
                        <option>5 PM</option>
                        <option>6 PM</option>
                        <option>7 PM</option>
                        <option>8 PM</option>
                        <option>9 PM</option>
                        <option>10 PM</option>
                        <option>11 PM</option>
                    </select><br/><br/>  <label style="font-size: 20px;color: white"></label>&nbsp;&nbsp;
                    <label style="font-size: 20px;color: white; margin-left: -10px">User Name</label>&nbsp;&nbsp;<input type="text" name="un" style="width: 200px;height: 20px;font-size: 20px;margin-left: 110px"/><br /><br />
                    <label style="font-size: 20px;color: white">Password</label>&nbsp;&nbsp;<input type="password" name="pass" style="width: 200px;height: 20px;font-size: 20px;margin-left: 125px"/><br /><br />
                    
                    <input type="submit" value="Add" style="width: 130px;height: 35px;margin-left: 80px;border-radius: 8px;font-size: 20px;background: white;margin-top: 10px"/>&nbsp;&nbsp;
                    <input type="reset" value="Reset" style="width: 130px;height: 35px;border-radius: 8px;font-size: 20px;background: white"/>
                </form>
                        <h4 style="color: red;margin-left: 50px">View All Warehouses/Stores</h4><a href="viewwarehouse.jsp" style="float: right;margin-top: -38px;margin-right: 180px;text-decoration: none;color: white">Click Here</a>
            
            </div>
            <div style="margin-left: 750px;margin-top: -350px;">
                <img id="blah" src="#" alt="" />
            </div>
        </div> <!-- /container -->
        <div>
        </div>
    </body>
</html>
