<%@page import="java.sql.Statement"%>
<%@page import="action.Database"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Connection"%>
<%
    String k1 = session.getAttribute("k1").toString();
    System.out.println("Session User Name " + k1);
    k1=k1.replaceAll("%20", " ");
    String k2 = session.getAttribute("k2").toString();
    System.out.println("Session Feedback Item " + k2);
    String a = request.getParameter("name");
    out.println(k1);
    String b = request.getParameter("feedback");
    String c = request.getParameter("rating");
    String d = request.getParameter("ratingvalues");
    String e = request.getParameter("comments");
    try {
        Connection con = Database.getConnection();
        Statement st = con.createStatement();
        int i = st.executeUpdate("update feed set name='" + a + "', feedback='" + b + "', rating='" + c + "', ratingvalues='" + d + "', comments='" + e + "' where name ='" + k1 + "' AND feedback='" + k2 + "'");
        if (i != 0) {
            response.sendRedirect("arating.jsp?msg=Updated Successfully");
        }
    } catch (Exception e1) {
        out.println("Error in update1 " + e1.getLocalizedMessage());
    }
%>