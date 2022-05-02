
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int getcost = 0;
            int total = 0;
            String status = "NO";
            String name = session.getAttribute("n1").toString();
            String pname = request.getParameter("pname");
            System.out.println("Pname " + pname);
            String pitems = request.getParameter("pitems");
            System.out.println("Pitems " + pitems);
            String bname = request.getParameter("bname");
            System.out.println("Bname " + bname);
            String price = request.getParameter("price");
            System.out.println("Price " + price);
            String qty = request.getParameter("qty");
             String comm = request.getParameter("comments");
            System.out.println("Qty " + qty);
            try{
            Connection con = Database.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from product where "
                    + "pitems='" + pitems + "'");
            if (rs.next()) {
                getcost = rs.getInt("price");
            }
            String dloc="",dper="",dcon="";
             out.println("ok");
            ResultSet rs1 = st.executeQuery("select * from user where name='" + name + "'");
            if (rs1.next()) {
                dloc = rs1.getString("location");
            }
            
            int qty1 = Integer.parseInt(qty);
            total = qty1 * getcost;
            System.out.println("Total " + total);
        
           //FIND A Delivery Person whose delivery count for today is less than 2 i.e 0 or 1
           //GET His location
               String[] dperson=new String[1000];
           String[] dpercl=new String[1000];
          int[] dpcnt=new int[1000]; String cnt="";
           
      
           String query3 = "SELECT name,email,currentloc,pendingcount,contactno from delivery where pendingcount<2";
           Statement stt = con.createStatement();
           ResultSet ro = stt.executeQuery(query3);
           int o=0;String dn="";
           if(ro.next())
           {
               dn=ro.getString(2);
               dperson[o]=ro.getString(2);
               dpercl[o]=ro.getString(3);
               dpcnt[o]=ro.getInt(4);
               cnt=ro.getString(5);
                 out.println(dn+" "+dperson[o]+" "+dpercl[o]+" "+dpcnt[o]);
            //Assign delivery
            dpcnt[o]++;out.println(dn+dperson[o]+cnt);
             st.executeUpdate("update delivery set pendingcount='"+dpcnt[o]+"'");
                 int i = st.executeUpdate("insert into cart (name, productname, "
                    + "productitem, quantity, total,status,dlocation,dperson,dcontact) "
                    + "values('" +name+ "','" +pname+ "','" +pitems+ "','" +qty+ "','" + 
                    total + "','" + status + "','"+dloc+"','"+dn+"','"+cnt+"')");
            if (i != 0) {
                response.sendRedirect("search.jsp?msg=Items Added to Cart");
                System.out.println("Cart Add Success");
            } else {
                response.sendRedirect("search.jsp?msg=Items Added Failed");
                System.out.println("Cart Add Failed");
            }
               o++;
           }  
           else{
           response.sendRedirect("search.jsp?msg=Items Added Failed");
                System.out.println("No delivery person is assigned");
           }
        
               }catch(Exception ex){out.println(ex);}
        %>
    </body>
</html>
