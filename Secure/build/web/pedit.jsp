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
                    <li><a href="block.jsp">Block List</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>

            </div><br/>
            <div class="abstract" style="background: ">
                <center><h1 style="color: white">Product Details</h1></center>
                <table style="margin-left: 200px;margin-top: -10px">
                    <tr>
                        <th style="background-color: blue">Product Name</th>
                        <th style="background-color: blue">Product Item</th>
                        <th style="background-color: blue">Brand Name</th>
                        <th style="background-color: blue">Price</th>
                        <th style="background-color: blue">Validity</th>
                        <th style="background-color: blue">Update</th>
                    </tr>
                    <tr>
                        <%
                            try {
                                String[] a = request.getQueryString().split(",");
                                System.out.println("Product Item " + a[0]);
                                System.out.println("Brand Name" + a[1]);
                                session.setAttribute("a1", a[0]);
                                session.setAttribute("a2", a[1]);
                                Connection con = Database.getConnection();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from product where pitems='" + a[0] + "' AND bname='" + a[1] + "'");
                                while (rs.next()) {%>
                    <form action="update.jsp" method="post">  
                        <td><input type="text"name="pname" value="<%=rs.getString("pname")%>"/></td>
                        <td><input type="text"name="pitems" value="<%=rs.getString("pitems")%>"/></td>
                        <td><input type="text"name="bname" value="<%=rs.getString("bname")%>"/></td>
                        <td><input type="text"name="price" value="<%=rs.getString("price")%>"/></td>
                        <td><input type="date"name="validity" value="<%=rs.getString("validity")%>"/></td>
                        <td><input type="submit" value="Update" style="width: 80px;height: 30px;background: transparent"/></td>
                        </tr>
                    </form>
                    <% }
                        } catch (Exception e) {
                            e.printStackTrace();
                            System.out.println("Admin product edit details Page" + e.getMessage());
                        }
                    %>
                </table>
            </div>
        </div> <!-- /container -->
       
    </body>
</html>