<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="action.Database"%>

<%
    try{
    String s = request.getQueryString();
    Connection con = Database.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from warehouse where id='" + s+ "'");
    if (rs.next()) {
        if (rs.getString("id").equals(s)) {
            st.executeUpdate("delete from warehouse where id='" + s + "'");
  
            response.sendRedirect("viewwarehouse.jsp?msg=Warehouse Removed Successfully");
        }
    }}catch(Exception ex){out.println(ex);}
%>