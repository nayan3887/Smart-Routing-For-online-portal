<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.InputStream"%>
<!DOCTYPE html>
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
            </div><br /><br /><br />
            <div style="border:1px solid red;width: 500px;height: 300px;margin-left: 380px;border-radius: 40px;background-color: #0099FF">
                <div style="height: 60px;border-top-left-radius: 40px;border-top-right-radius: 40px">
                    <center> <h1 style="margin-top: 3px">Bank Details</h1></center>
                </div>
                <div style="height: 338px;border-bottom-left-radius: 40px;border-bottom-right-radius: 40px;margin: 15px">
                    <%
                         String uname = session.getAttribute("n1").toString();
                    %>
                    <form action="paction.jsp" method="post" style="margin: 10px;">
                        <label style="font-size: 20px">Card Holder Name</label>&nbsp;&nbsp;<input type="text" name="uname" value="<%=uname%>" readonly="" class="textbox1" style="margin-left: 20px"/><br /><br />
                        <label style="font-size: 20px">Bank Name</label>&nbsp;
                        <select style="width: 200px;height: 25px;font-size: 20px;margin-left: 84px" required="" name="bank">
                            <option selected="">Select Bank</option>   
                            <option value="ICIC">ICIC</option>   
                            <option value="KOTAK">KOTAK</option>   
                            <option value="CITIBANK">CITIBANK</option>   
                            <option value="SBI">SBI</option>   
                            <option value="HDFC">HDFC</option>   
                            <option value="AXIS">AXIS</option>   
                        </select><br /><br />
                        <label style="font-size: 20px">Credit/Debit Card No</label>&nbsp;&nbsp;<input type="text" name="cno" value="" required="" class="textbox1"/><br /><br />
                        <input type="submit" value="Purchase" class="button" style="margin-left: 200px"/>
                    </form>
                </div>
            </div>
        </div> <!-- /container --><br /><br /><br /><br />
        <div>
        </div>
    </body>
</html>