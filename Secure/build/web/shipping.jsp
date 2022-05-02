<%@page import="action.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
              
                <div style=" margin-left: 50px">
        
                <center><h1 style="color: white">Shipping Details</h1></center>
                <table style="margin-left: 275px;margin-top: -10px">
                    <tr>
                        <th style="background-color: blue">User Name</th>
                        <th style="background-color: blue">Product Item</th>
                       <th style="background-color: blue">Quantity</th>
                        <th style="background-color: blue">Location</th>
                        <th style="background-color: blue">Contact</th>
                    </tr>
                    <%
                        try {
                            Connection con = Database.getConnection();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from cart where status='YES'");
                            while (rs.next()) {
                    
                    %>
                    <tr>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("productitem")%></td>
                        <td><% out.println(rs.getString("quantity")); %></td><%
                        Statement st1 = con.createStatement();
                            ResultSet rs1 = st1.executeQuery("select location,contactno from user where name='"+rs.getString("name")+"'");
                            while (rs1.next()) {%>
                              <td><%=rs1.getString("location")%></td>
                        <td><%=rs1.getString("contactno")%></td>
                       <%     }
                        
                        %>
                      
                    </tr>
                    <% }
                        } catch (Exception e) {
                            e.printStackTrace();
                            System.out.println("Admin shipping Page" + e.getMessage());
                        }
                    %>
                </table>
        
                </div>
            </div>
          
        </div> <!-- /container -->
        <div>
        </div>
    </body>
</html>