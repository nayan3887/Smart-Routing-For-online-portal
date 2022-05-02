<%@page import="java.sql.Statement"%>
<%@page import="action.Database"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Connection"%>
<%
    String a1 = session.getAttribute("a1").toString();
    System.out.println("Session Product Items " + a1);
    String a2 = session.getAttribute("a2").toString();
    System.out.println("Session Brand Name " + a2);
    String a = request.getParameter("pname");
    String b = request.getParameter("pitems");
    String c = request.getParameter("bname");
    String d = request.getParameter("price");
    String e = request.getParameter("validity");
    try {
        Connection con = Database.getConnection();
        Statement st = con.createStatement();
        int i = st.executeUpdate("update product set pname='" + a + "', pitems='" + b + "', bname='" + c + "', price='" + d + "', validity='" + e + "' where pitems='" + a1 + "' AND bname='" + a2 + "'");
        if (i != 0) {
            response.sendRedirect("pviewdetails.jsp?msg=Updated Successfully");
        }
    } catch (Exception e1) {
        System.out.println("Error in update " + e1.getLocalizedMessage());
    }
%>