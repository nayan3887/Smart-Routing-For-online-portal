<%-- 
    Document   : viewdelivperson
    Created on : Feb 5, 2018, 6:42:13 AM
    Author     : Neena
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="action.Database"%>
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
                    <li><a href="ahome.jsp">Home</a></li>
                    <li><a href="additems.jsp">Add Item</a></li>
                    <li><a href="adddel.jsp">Add Delivery Person</a></li>
                    <li><a href="pviewdetails.jsp">Product Details</a></li>
                    <li><a href="shipping.jsp">Shipping Details</a></li>
                   <li><a href="shipped.jsp">Shipped Products</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
            </div><br />
            <div class="" style="background: "><br><br>
                <center><h1 style="color: white;margin-top: -10px">Delivery Person Details</h1></center>
                <br><table style="margin-left: 280px;margin-top: -20px" >
                    <tr>
                        <th style="background-color: blue">Name</th>
                        <th style="background-color: blue">Email</th>
                        <th style="background-color: blue">Contact</th>
                        <th style="background-color: blue">Location</th>
                        <th style="background-color: blue">Remove</th>
                      
                    </tr>
                    <tr>
                        <%
                            try {
                                Connection con = Database.getConnection();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from delivery");
                                while (rs.next()) {%>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("contactno")%></td>
                        <td><%=rs.getString("location")%></td>
                        <td><a href="ddelete.jsp?<%=rs.getString("email")%>,<%=rs.getString("name")%>">Remove</a></td>
                    </tr>
                    <% }
                        } catch (Exception e) {
                            e.printStackTrace();
                            System.out.println("Admin product details Page" + e.getMessage());
                        }
                    %>
                </table>
            </div>
        </div> <!-- /container -->
        <div>
        </div>
    </body>
</html>
