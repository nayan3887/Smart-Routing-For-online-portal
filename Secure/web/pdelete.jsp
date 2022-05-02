<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="action.Database"%>
<%
    String[] s = request.getQueryString().split(",");
    Connection con = Database.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from product where pitems='" + s[0] + "' AND bname='" + s[1] + "'");
    if (rs.next()) {
        if (rs.getString("pitems").equals(s[0]) && rs.getString("bname").equals(s[1])) {
            st.executeUpdate("delete from product where pitems='" + s[0] + "' AND bname='" + s[1] + "'");
            response.sendRedirect("pviewdetails.jsp?msg=Product Removed Successfully");
        }
    }
%>