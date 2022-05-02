<%-- 
    Document   : sample
    Created on : Dec 18, 2014, 11:50:03 AM
    Author     : JP-PC9
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int getcost = 0;
            int total = 0;
            String status = "NO";
            String name = session.getAttribute("n1").toString();
            String pname = request.getParameter("pname");
            System.out.println("Pname " + pname);
            String pitems = request.getParameter("pitems");
            System.out.println("Pitems " + pitems);
            String bname = request.getParameter("bname");
            System.out.println("Bname " + bname);
            String price = request.getParameter("price");
            System.out.println("Price " + price);
            String qty = request.getParameter("qty");
             String comm = request.getParameter("comments");
            System.out.println("Qty " + qty);
            Connection con = Database.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from product where "
                    + "pitems='" + pitems + "'");
            if (rs.next()) {
                getcost = rs.getInt("price");
            }
            int qty1 = Integer.parseInt(qty);
            total = qty1 * getcost;
            System.out.println("Total " + total);
            int i = st.executeUpdate("insert into cart (name, productname, "
                    + "productitem, quantity, total,status) "
                    + "values('" +name+ "','" +pname+ "','" +pitems+ "','" +qty+ "','" + 
                    total + "','" + status + "')");
            if (i != 0) {
                response.sendRedirect("search.jsp?msg=Items Added to Cart");
                System.out.println("Cart Add Success");
            } else {
                response.sendRedirect("search.jsp?msg=Items Added Failed");
                System.out.println("Cart Add Failed");
            }
        %>
    </body>
</html>
