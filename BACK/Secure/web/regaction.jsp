<%@page import="java.sql.Statement"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Connection"%>
<%
    String name = request.getParameter("name");
    System.out.println("Name " + name);
    String email = request.getParameter("email");
    System.out.println("Email " + email);
    String pass = request.getParameter("pass");
    System.out.println("Pass " + pass);
    String dob = request.getParameter("dob");
    System.out.println("Date " + dob);
    String loc = request.getParameter("loc");
    System.out.println("Loc " + loc);
    String cno = request.getParameter("cno");
    System.out.println("Cno " + cno);
    String bank = request.getParameter("bank");
    System.out.println("Bank " + bank);
    String card = request.getParameter("card");
    System.out.println("Card " + card);
    Connection con = Database.getConnection();
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into user (name, email, pass, dob, location, contactno, bank, card) values('"+name+"','"+email+"','"+pass+"','"+dob+"','"+loc+"','"+cno+"','"+bank+"','"+card+"')");
    if(i!=0)
    {
        response.sendRedirect("reg.jsp?msg=Registration Successfully");
    }
    else
    {
        response.sendRedirect("reg.jsp?msg=Registration Failed");
    }
%>