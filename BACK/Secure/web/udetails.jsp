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
                    <li class="active"><a href="uview.jsp">Home</a></li>
                    <li><a href="udetails.jsp">Profile</a></li>
                    <li><a href="cartdetails.jsp">Cart</a></li>
                    <li><a href="search.jsp">Product Search</a></li>
                 
                    <li><a href="index.jsp">Logout</a></li>
               
                </ul>
            </div><br />
            <%
                String name = null, email = null, loc = null, cno = null;
                String n = session.getAttribute("n1").toString();
                String s = session.getAttribute("v").toString();
                Connection con = Database.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from user where email='" + s + "'");
                if (rs.next()== true) {
                    name = rs.getString("name");
                    System.out.println("Name " + name);
                    email = rs.getString("email");
                    System.out.println("Email " + email);
                    loc = rs.getString("location");
                    System.out.println("Location " + loc);
                    cno = rs.getString("contactno");
                    System.out.println("Contact No  " + cno);
                }
            %>
            <div style="border:1px solid white;width: 600px;height: 400px;margin-left: 320px;background-image: url('images/blue_line.jpg');border-radius: 50px;"><br /><br />
                <center>
                        <div style="height: 300px;color: white">
                            <h1>User Details</h1>
                        <label style="font-size: 20px">Name</label>&nbsp;&nbsp;<input type="text" value="<%=name%>" readonly="" style="margin-left: 48px;border: 0px" class="textbox1"/><br /><br />
                        <label style="font-size: 20px">Email ID</label>&nbsp;&nbsp;<input type="text" value="<%=email%>" readonly="" style="margin-left: 25px" class="textbox1"/><br /><br />
                        <label style="font-size: 20px">Location</label>&nbsp;&nbsp;<input type="text" value="<%=loc%>" readonly="" style="margin-left: 24px" class="textbox1"/><br /><br />
                        <label style="font-size: 20px">Contact No</label>&nbsp;&nbsp;<input type="text" value="<%=cno%>" readonly="" class="textbox1"/>
                    </div>
                </center>
            </div>
        </div> <!-- /container -->
        <div>
        </div>
    </body>
</html>