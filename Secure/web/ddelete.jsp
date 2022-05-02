<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="action.Database"%>

<%
    try{
    String[] s = request.getQueryString().split(",");
    Connection con = Database.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from delivery where email='" + s[0] + "' AND name='" + s[1] + "'");
    if (rs.next()) {
        if (rs.getString("email").equals(s[0]) && rs.getString("name").equals(s[1])) {
            st.executeUpdate("delete from delivery where email='" + s[0] + "' AND name='" + s[1] + "'");
  
            response.sendRedirect("viewdelivperson.jsp?msg=Delivery Person Removed Successfully");
        }
    }}catch(Exception ex){out.println(ex);}
%>