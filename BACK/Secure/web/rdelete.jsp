<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Statement"%>
<%
    String[] s = request.getQueryString().split(",");
    //out.println(s[0]);
    s[0]=s[0].replaceAll("%20", " ");
    Connection con = Database.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from feed where name='"+s[0]+"' AND feedback='"+s[1]+"'");
    if(rs.next())
    {
        if(rs.getString("name").equals(s[0])&&rs.getString("feedback").equals(s[1]))
        {
            st.executeUpdate("Delete from feed where name='"+s[0]+"' AND feedback='"+s[1]+"'");
            response.sendRedirect("arating.jsp?Deleted Successfully");
        }
    }



%>