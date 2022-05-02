<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="action.Database"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%
    String email = (String)session.getAttribute("v");
    System.out.println("Email  "+email);
    String uname = request.getParameter("uname");
    System.out.println("Name "+uname);
    String bank = request.getParameter("bank");
    System.out.println("Bank "+bank);
    String cno = request.getParameter("cno");
    System.out.println("Card No "+cno);
    try{
        Connection con = Database.getConnection();
        Statement st = con.createStatement();
        Statement st1 = con.createStatement();
        ResultSet rs = st.executeQuery("select * from user where email='"+email+"' AND name='"+uname+"'");
        while(rs.next())
        {
            if((rs.getString("bank").equals(bank))&&(rs.getString("card").equals(cno)))
            {
                response.sendRedirect("search.jsp?msg=Item Purchased Successfully");
                st1.executeUpdate("update cart set status='YES' where name='"+uname+"' AND status='NO'");
            }
            else
            {
                response.sendRedirect("bank.jsp?msg=Please Enter Valid Card Number");
            }
        }
    }
    catch(Exception e)
    {
        System.out.println("Exception in paction " +e.getMessage());
    }
%>