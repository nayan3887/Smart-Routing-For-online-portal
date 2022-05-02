<%@page import="java.sql.Statement"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Connection"%>
<%
    String dname = request.getParameter("dname");
    String demail = request.getParameter("demail");
    String dpass = request.getParameter("dpass");
    String dloc = request.getParameter("dlocation");
    String dcno = request.getParameter("dcontact");
    Connection con = Database.getConnection();
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into delivery (name, email, pass, location, contactno) values('"+dname+"','"+demail+"','"+dpass+"','"+dloc+"','"+dcno+"')");
    if(i!=0)
    {
        response.sendRedirect("adddel.jsp?msg=Registration Successfully");
    }
    else
    {
        response.sendRedirect("adddel.jsp?msg=Registration Failed");
    }
%>