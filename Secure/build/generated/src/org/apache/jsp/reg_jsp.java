package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class reg_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Dynamic Route Planning</title>\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"templatemo\">\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"container\" class=\"container\">\n");
      out.write("            <div style=\"width: 1200px;margin: 30px;color: white\">\n");
      out.write("                <center><h1>Enhanced Automated Planning and Routing System for Product Delivery</h1></center>\n");
      out.write("            </div>\n");
      out.write("            <div>\n");
      out.write("                <ul class=\"nav nav-justified\">\n");
      out.write("                    <li class=\"active\"><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                    <li><a href=\"alogin.jsp\">Admin</a></li>\n");
      out.write("                    <li><a href=\"ulogin.jsp\">User</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div><br />\n");
      out.write("            <div style=\"border:1px solid blue;height: 450px; width: 512px;border-radius: 30px;margin-left: 430px;background-image: url('images/reg.jpg')\"><br />\n");
      out.write("                <form action=\"regaction.jsp\" method=\"get\">\n");
      out.write("                   <div style=\"float: left;margin-left: 20px;width: 350px;height: 385px;margin-top: -13px;border-radius: 20px;color: white\"><br />\n");
      out.write("                       <center><label style=\"font-size: 20px\">Name</label>&nbsp;&nbsp;<input type=\"text\" class=\"textbox1\" style=\"margin-left: 47px\" name=\"name\" required=\"\"/><br /><br />\n");
      out.write("                       <label style=\"font-size: 20px\">Email ID</label>&nbsp;&nbsp;<input type=\"email\" class=\"textbox1\" style=\"margin-left: 23px\" name=\"email\" required=\"\"/><br /><br />\n");
      out.write("                       <label style=\"font-size: 20px\">Password</label>&nbsp;&nbsp;<input type=\"password\" class=\"textbox1\" style=\"margin-left: 12px\" name=\"pass\" required=\"\"/><br /><br />\n");
      out.write("                       <label style=\"font-size: 20px\">D.O.B</label>&nbsp;&nbsp;<input type=\"date\" style=\"margin-left: 46px;width: 200px;height: 25px;font-size: 20px\" name=\"dob\" required=\"\"/><br /><br />\n");
      out.write("                       <label style=\"font-size: 20px;\">Location</label>&nbsp;&nbsp;<input type=\"text\" class=\"textbox1\" style=\"margin-left: 25px\" name=\"loc\" required=\"\"/><br /><br />\n");
      out.write("                       <label style=\"font-size: 20px\">Contact No</label>&nbsp;&nbsp;<input type=\"text\" class=\"textbox1\" name=\"cno\" required=\"\"/><br /><br />\n");
      out.write("                        <label style=\"font-size: 20px\">Bank Name</label>&nbsp;\n");
      out.write("                        <select style=\"width: 200px;height: 25px;font-size: 20px\" required=\"\" name=\"bank\">\n");
      out.write("                            <option selected=\"\">Select</option>   \n");
      out.write("                            <option value=\"ICIC\">ICIC</option>   \n");
      out.write("                            <option value=\"KOTAK\">KOTAK</option>   \n");
      out.write("                            <option value=\"CITIBANK\">CITIBANK</option>   \n");
      out.write("                            <option value=\"SBI\">SBI</option>   \n");
      out.write("                            <option value=\"HDFC\">HDFC</option>   \n");
      out.write("                            <option value=\"AXIS\">AXIS</option>   \n");
      out.write("                        </select><br /><br />\n");
      out.write("                        <label style=\"font-size: 20px\">Credit card</label>&nbsp;&nbsp;\n");
      out.write("                        <input type=\"text\" class=\"textbox1\" style=\"margin-left: 4px;\" name=\"card\" required=\"\"/>\n");
      out.write("                        <br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        <input type=\"submit\" value=\"SignUp\" />\n");
      out.write("                        <input type=\"Reset\" value=\"Clear\" />\n");
      out.write("                        <a href=\"index.jsp\"><input type=\"button\" value=\"Exit\" /></a>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div> <!-- /container -->\n");
      out.write("   \n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
