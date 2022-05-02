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
                //start algo to assign a delivery person
                //1. See location of delivery
                String custaddr=rs.getString("location");
                String custname=rs.getString("name");
                String custcontact=rs.getString("contactno");
                //2. Compare everyone dp's current location and find list of dps
                
                //3. see which delivery person from the list has today's delivery less than 2
                //4. If more than one dp is again shortlisted see who's distance is less.
                //5. Assign shipping 
                //6. Find nearest warehouse to the assigned dp 
                //7. Send message on app [warehouse address, customer address]
               
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