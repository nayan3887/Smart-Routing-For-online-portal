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
            
            </div><br />
            <div style="border:1px solid white;width: 700px;height: 400px;margin-left: 300px;border-radius: 40px;background-color: #0099FF">
                <div style="height: 60px;border-top-left-radius: 40px;border-top-right-radius: 40px"><br>
                    <center> <h1 style="margin-top: 3px;color: white">Order Details</h1></center><br>
                </div>
                <div style="height: 338px;border-bottom-left-radius: 40px;border-bottom-right-radius: 40px">
                    <br><table style="margin-left: 100px">
                        <tr>
                            <th style="background-color: blue">Product Name</th>
                            <th style="background-color: blue">Product Item</th>
                            <th style="background-color: blue">Quantity</th>
                            <th style="background-color: blue">Total Price</th>
                        </tr>
                        <tr>
                            <%
                                String uname = session.getAttribute("n1").toString();
                                try 
                                {
                                Connection con = Database.getConnection();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from cart where status='NO' AND name='" + uname + "'");
                                ResultSet rs1 = st.executeQuery("select * from cart where status='NO' AND name='" + uname + "'");
                                while (rs1.next()) {
                            %>
                            <td><%=rs1.getString("productname")%></td>
                            <td><%=rs1.getString("productitem")%></td>
                            <td><%=rs1.getString("quantity")%></td>
                            <td><%=rs1.getString("total")%></td>
                        </tr>
                        <%
                                    }
                                }
                             catch (Exception e) {
                                System.out.println("Exception Error in cartdetails " + e.getMessage());
                            }
                        %>

                    </table><br />
                    <a href="bank.jsp?<%=uname%>"><button type="button" style="margin-left: 300px; width: 150px; font-size: 20px">Buy Item</button></a>
                </div>
            </div>
        </div> <!-- /container -->
        <div>
         </div>
    </body>
</html>