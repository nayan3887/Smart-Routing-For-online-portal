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
            <div style="border:1px solid red;width: 1250px;height: 400px;margin-left: 30px;border-radius: 40px;background-color: white"><br />
                <table   style="margin-left: 20px">
                    <tr>
                        <%
                            InputStream n1 = null;
                            String logo = null;
                            int i = 1;
                            String sname = request.getParameter("focus");
                            session.setAttribute("n2", sname);
                            System.out.println("Search " + sname);
                            Connection con = Database.getConnection();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from product where pname='" + sname + "'");
                            while (rs.next()) {
                                String len = rs.getString("image");
                                int len1 = len.length();
                                byte[] b1 = new byte[len1];
                                n1 = rs.getBinaryStream("image");
                                int index = n1.read(b1, 0, len1);
                                 String putFile ="";
                                try{
                                putFile = "..\\images";
                                }catch(Exception ex){out.println(ex);}
                                File file = new File(putFile + rs.getString("iname"));
                                logo = rs.getString("iname");
                            //    out.println(logo);
                                if (file.exists()) {
                                    file.delete();
                                } else {
                                    OutputStream out1 = new FileOutputStream(file);
                                    while (index != -1) {
                                        out1.write(b1, 0, index);
                                        index = n1.read(b1, 0, len1);
                                    }
                                    out1.close();
                                    i++;
                                }
                        %>
                        <td padding="0px"style="border: 0px;"><img src="images/<%=logo%>" style="width: 100px;height: 100px;margin: 20px"></img>
                            <h6><%=rs.getString("pitems")%></h6>
                            <a href="addcart.jsp?<%=logo%>" style="margin-top: 10px"><button style="margin-left: 10px;border-radius: 5px;width: 80px; height: 30px;font-size: 15px;background-color: window;color: red">Buy Now</button></a> <br />
                        </td>  
                        <%
                            }
                        %>
                    </tr>
                </table>
            </div>
        </div> <!-- /container -->
        <div>
        </div>
    </body>
</html>