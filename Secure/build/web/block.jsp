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
                    <li><a href="pviewdetails.jsp">Product Details</a></li>
                  
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
            </div><br />
            <div class="abstract" style="">
                <center><h1 style="color: white">Negative Rating Details </h1></center>
                <table style="margin-left: 300px;margin-top: -10px">
                    <tr>
                        <th style="background-color: blue">User Name</th>
                        <th style="background-color: blue">Email Address</th>
                        <th style="background-color: blue">Ip Address</th>
                        <th style="background-color: blue">Item</th>
                        <th style="background-color: blue">Comments</th>
                      
                    </tr>
                    <tr>
                    <%
                        try {
                            Connection con = Database.getConnection();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from blocklist");
                            while (rs.next()) {%>
                        <td><%=rs.getString("uname")%></td>
                        <td><%=rs.getString("ipaddress")%></td>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("product")%></td>
                        <td><%=rs.getString("comments")%></td>
                    
                     </tr>
                    <% }
                        } catch (Exception e) {
                            e.printStackTrace();
                            System.out.println("Admin Block Page" + e.getMessage());
                        }
                    %>
                </table>
            </div>
        </div> <!-- /container -->
        <div>
         </div>
    </body>
</html>