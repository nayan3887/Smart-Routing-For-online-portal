<%@page import="java.sql.Statement"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Connection"%>
<%
    String wname = request.getParameter("wname");
    String wadd = request.getParameter("wadd");
    String ot = request.getParameter("ot");
    String ct = request.getParameter("ct");
   String un = request.getParameter("un");
    String pass = request.getParameter("pass");
    Connection con = Database.getConnection();
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into warehouse(wname, address,opentime,closetime,uname,password) values('"+wname+"','"+wadd+"','"+ot+"','"+ct+"','"+un+"','"+pass+"')");
    if(i!=0)
    {
        response.sendRedirect("addwarehouse.jsp?msg=Warehouse Registration Successful");
    }
    else
    {
        response.sendRedirect("addwarehouse.jsp?msg=Registration Failed");
    }
%>