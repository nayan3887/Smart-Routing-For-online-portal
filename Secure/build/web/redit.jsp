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
                    <li><a href="additems.jsp">Add New Item</a></li>
                    <li><a href="pviewdetails.jsp">Product view Details</a></li>
                    <li><a href="arating.jsp">Rating</a></li>
                    <li><a href="ulogin.jsp">Graph</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
            </div><br />
            <div class="abstract">
                <center><h1 style="color: white">Product Rating Details</h1></center>
                <table style="margin-left: 30px;margin-top: -10px">
                    <tr>
                        <th>User Name</th>
                        <th>Product Item</th>
                        <th>Rating Status</th>
                        <th>Rating</th>
                        <th>Comments</th>
                        <th>Ip Address</th>
                        <th>Date/Time</th>
                        <th>Update</th>
                    </tr>
                    <tr>
                        <%
                            try {
                                String[] k = request.getQueryString().split(",");
                                System.out.println("User Name " + k[0]);
                                System.out.println("Feedback Item " + k[1]);
                                session.setAttribute("k1", k[0]);
                                session.setAttribute("k2", k[1]);
    k[0]=k[0].replaceAll("%20", " ");
                                Connection con = Database.getConnection();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from feed where name='" + k[0] + "' AND feedback='" + k[1] + "'");
                                while (rs.next()) {%>
                    <form action="update1.jsp" method="post">
                        <td><input type="text" name="name" value="<%=rs.getString("name")%>" style="width: 50px" /></td>
                        <td><input type="text" name="feedback" value="<%=rs.getString("feedback")%>"/></td>
                        <td><input type="text" name="rating" value="<%=rs.getString("rating")%>"/></td>
                        <td><input type="text" name="ratingvalues" value="<%=rs.getString("ratingvalues")%>"/></td>
                        <td><input type="text" name="comments" value="<%=rs.getString("comments")%>"/></td>
                        <td><input type="text" name="ip" value="<%=rs.getString("ipaddr")%>" readonly=""/></td>
                        <td><input type="text" name="dt" value="<%=rs.getString("date_time")%>" readonly=""/></td>
                        <td><input type="submit" value="Update" style="width: 80px;height: 30px;background: transparent"/></td>
                        </tr>
                    </form>
                    <% }
                        } catch (Exception e) {
                            e.printStackTrace();
                            System.out.println("Admin rating edit Page" + e.getMessage());
                        }
                    %>

                </table>
            </div>
        </div> <!-- /container -->
      
    </body>
</html>