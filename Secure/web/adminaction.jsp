<%
String user = request.getParameter("aname");
String pass = request.getParameter("apass");
if(user.equalsIgnoreCase("Admin") &&(pass.equalsIgnoreCase("Admin")))
{
    System.out.println("It is goes to amin home");
    response.sendRedirect("ahome.jsp?msg=Login Successfully");
}
else
{
    System.out.println("Error in adminview page");
    response.sendRedirect("alogin.jsp?msg=Login Failed");
}
%>