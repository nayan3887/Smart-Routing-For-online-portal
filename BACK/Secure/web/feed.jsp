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
                    <li><a href="graph1.jsp">Graphs</a></li>
                    <li><a href="feed.jsp">Feedback</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
         
            </div><br />
            <div style="border:1px solid red;width: 600px;height: 400px;margin-left: 400px;border-radius: 40px;background-color: white;">
              <!-- <%
                    String uname = session.getAttribute("n1").toString();
                    %> -->
                <div style="height: 60px;border-top-left-radius: 40px;border-top-right-radius: 40px">
                    <center> <h1 style="margin-top: 3px">Feedback</h1></center>
                </div>
                <div style="height: 338px;border-bottom-left-radius: 40px;border-bottom-right-radius: 40px;">
                    <form action="rate.jsp" method="post" style="margin: 20px;margin-top: -10px;margin-left: 60px">
                        <label style="font-size: 20px">Name</label>&nbsp;&nbsp;<input type="text" value="<%=uname%>" name="uname" style="margin-left: 70px" class="textbox1" readonly=""/><br /><br />
                        <label style="font-size: 20px">Product Item</label>&nbsp;&nbsp;
                    <%
                        try {
                            int cnt=0,cnt2=0,cnt3=0;
                            Connection con = Database.getConnection();
                            Statement st = con.createStatement();
                            
                              
                            ResultSet r = st.executeQuery("select distinct(pitems) from product");
                            %>
                            <form method="get">
                                <select id="mySelect" name="pitem" style=" font-size: 14pt; color: #998877">
                                <%
                            while (r.next()) {
                                
                                %>
                                
                                      <option value=<%=r.getString(1) %>><%=r.getString(1)%></option>
 
                 
<%
                             }
               %>
                              </select>
                              <br>
                              <br>
                                      <%
 

                        } catch (Exception e) {
                            e.printStackTrace();
                            System.out.println("" + e.getMessage());
                        }%>
                        <label style="font-size: 20px">Comments :</label><br /><br />
                        <textarea cols="30" rows="3" style="margin-left: 130px;margin-top: -40px;font-size: 18px" name="comments"></textarea><br /><br />
                        <input type="submit" value="Submit" style="margin-left: 200px;margin-top: -10px" class="button"/>
                        </form>
                </div>

            </div>
        </div> <!-- /container -->
        <div>
       </div>
    </body>
</html>