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
                    <li><a href="assigndp.jsp">Assigned Delivery Person</a></li>
                    <li><a href="shipped.jsp">Shipped Products</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
            </div><br />
            <div class="abstract">
                <center><h1 style="color: white">User Details</h1></center>
                <center><table style="margin-top: -10px">
                    <tr>
                        <th style="background-color: blue">User ID</th>
                        <th style="background-color: blue">Name</th>
                        <th style="background-color: blue">Email</th>
                        <th style="background-color: blue">Date of Birth</th>
                        <th style="background-color: blue">Location</th>
                        <th style="background-color: blue">Contact No</th>
                    </tr>
                    <%
                        try {
                            Connection con = Database.getConnection();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from user");
                            while (rs.next()) {%>
                    <tr>
                        <td><%=rs.getString("id")%></td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("dob")%></td>
                        <td><%=rs.getString("location")%></td>
                        <td><%=rs.getString("contactno")%></td>
                    </tr>
                    <% }
                        } catch (Exception e) {
                            e.printStackTrace();
                            System.out.println("Admin user details Page" + e.getMessage());
                        }
                    %>
                </table></center>
            </div>
        </div> <!-- /container -->
        <div>
        </div>
    </body>
</html>