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
        <script>
            function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(450)
                    .height(300);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
            
        </script>
        <div id="container" class="container">
                <div style="width: 1200px;margin: 30px;color: white">
                <center><h1>Enhanced Automated Planning and Routing System for Product Delivery</h1></center>
                </div>
            <div>
                <ul class="nav nav-justified">
                    <li><a href="ahome.jsp">Home</a></li>
                    <li><a href="additems.jsp">Add Item</a></li>
                    <li><a href="adddel.jsp">Add Delivery Person</a></li>
                    <li><a href="pviewdetails.jsp">Product  Details</a></li>
                   <li><a href="shipping.jsp">Shipping Details</a></li>
                   <li><a href="assigndp.jsp">Assigned Delivery Person</a></li>
                   
                   <li><a href="shipped.jsp">Shipped Products</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
            </div><br />
             <div style=" width: 700px" align="center">  <font color="white">
            <c:if test="${not empty param.msg}">
            <c:out value="${param.msg}" />
            </c:if></font></div>
            <div style="border: 1px solid white;border-radius: 20px;width: 500px;height: 400px;margin-left: 100px;">
              
                
                <center><h1 style="color: white">Add Items Details</h1></center>
                <form action="Upload" method="post" enctype="multipart/form-data" style="margin-left: 50px">
                    <label style="font-size: 20px;color: white">Product Name</label>&nbsp;&nbsp;
                    <select name="pname" style="width: 200px;height: 30px;font-size: 20px">
                        <option selected="">Select</option>
                        <option>Camera</option>
                        <option>Car</option>
                        <option>Laptop</option>
                        <option>Phone</option>
                    </select><br/><br/>
                    <label style="font-size: 20px;color: white">Product Item</label>&nbsp;&nbsp;<input type="text" name="pitem" style="width: 200px;height: 20px;font-size: 20px;margin-left: 17px"/><br /><br />
                    <label style="font-size: 20px;color: white">Brand Name</label>&nbsp;&nbsp;<input type="text" name="bname" style="width: 200px;height: 20px;font-size: 20px;margin-left: 18px"/><br /><br />
                    <label style="font-size: 20px;color: white">Price</label>&nbsp;&nbsp;<input type="text" name="price" style="width: 200px;height: 20px;font-size: 20px;margin-left: 83px"/><br /><br />
                    <label style="font-size: 20px;color: white">Date</label>&nbsp;&nbsp;<input type="date" name="date" style="width: 200px;height: 20px;font-size: 20px;margin-left: 86px"/><br /><br />
                    <label style="font-size: 20px;color: white">Product Image</label><input type="file" name="image" onchange="readURL(this);" style="width: 280px;height: 30px;font-size: 20px;margin-left: 5px"/><br />
                    <input type="submit" value="Add" style="width: 130px;height: 35px;margin-left: 80px;border-radius: 8px;font-size: 20px;background: white;margin-top: 10px"/>&nbsp;&nbsp;
                    <input type="reset" value="Reset" style="width: 130px;height: 35px;border-radius: 8px;font-size: 20px;background: white"/>
                </form>
            </div>
            <div style="margin-left: 750px;margin-top: -350px;">
                <img id="blah" src="#" alt="" />
            </div>
        </div> <!-- /container -->
        <div>
        </div>
    </body>
</html>