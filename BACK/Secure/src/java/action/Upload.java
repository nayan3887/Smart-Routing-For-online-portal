/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author JP-PC9
 */
public class Upload extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String pname = null;
            String pitem = null;
            String bname = null;
            String price = null;
            String date = null;
            boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
            if (!isMultipartContent) {
                return;
            }
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                List<FileItem> fields = upload.parseRequest(request);
                Iterator<FileItem> it = fields.iterator();
                if (!it.hasNext()) {

                    return;
                }
                while (it.hasNext()) {
                    FileItem fileItem = it.next();

                    if (fileItem.getFieldName().equals("pname")) {
                        pname = fileItem.getString();
                    } else if (fileItem.getFieldName().equals("pitem")) {
                        pitem = fileItem.getString();
                    } else if (fileItem.getFieldName().equals("bname")) {
                        bname = fileItem.getString();
                    } else if (fileItem.getFieldName().equals("price")) {
                        price = fileItem.getString();
                    } else if (fileItem.getFieldName().equals("date")) {
                        date = fileItem.getString();
                    } else {
                    }
                    boolean isFormField = fileItem.isFormField();
                    if (isFormField) {
                    } else {
//                        String s = fileItem.getName().substring(fileItem.getName().lastIndexOf("\\") + 1);
//                        fileItem.write(new File("D:\\kk\\" + s));//create folder and set path for store
//                        out.println(s);
//                        fileItem.getOutputStream().close();
                        try {
                            Connection cn = Database.getConnection();
                            PreparedStatement ps = cn.prepareStatement("insert into product(image, iname, pname, pitems, bname, price, validity)values(?,?,?,?,?,?,?)");
//                            FileInputStream fin = new FileInputStream("D:\\kk\\" + s); //set path for access
//                            ps.setBinaryStream(2, fin, fin.available());
                            ps.setBinaryStream(1, fileItem.getInputStream());
                            ps.setString(2, fileItem.getName());
                            ps.setString(3, pname);
                            ps.setString(4, pitem);
                            ps.setString(5, bname);
                            ps.setString(6, price);
                            ps.setString(7, date);
                            int i = ps.executeUpdate();
                            if (i == 1) {
                                response.sendRedirect("additems.jsp?msg=Items Added Successfully");
                            } else {
                                response.sendRedirect("additems.jsp?msg=Items Added Failed");
                            }
                            cn.close();

                        } catch (Exception e) {
                            out.println(e.toString());
                        }
                    }

                }
            } catch (FileUploadException e) {
            } catch (Exception ex) {
                Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
