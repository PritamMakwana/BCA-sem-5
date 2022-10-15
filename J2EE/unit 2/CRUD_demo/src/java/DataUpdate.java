/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author prita
 */
public class DataUpdate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DataUpdate</title>");
            out.println("</head>");
            out.println("<body>");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee", "root", "");
            Statement stmt = con.createStatement();
            String id;
            if (request.getParameter("id") != null) {
                id = request.getParameter("id");
            } else {
                id = request.getParameter("txt_id");
            }
            int uid = Integer.parseInt(id);
            String squery = "select * from student where s_id=" + uid;
//            out.println(squery + "<br>");
            ResultSet rs = stmt.executeQuery(squery);
//            out.println(rs.next() + "<br>");
//            rs.close();
//            if (rs.getFetchSize() <= 0) {
//                out.println("<h2>Id is not found</h2>\n"
//                        + " <a href=\"updatePage\">Back</a>");
//            } else {
            while (rs.next()) {

                String s_id = rs.getString(1);
                String s_name = rs.getString(2);
                String s_age = rs.getString(3);
                String s_class = rs.getString(4);
                String s_phone = rs.getString(5);
                String s_password = rs.getString(6);

                out.println(" <form action=\"DataUpdateTask\" method=\"post\">\n"
                        + "                <h1>Update</h1>\n"
                        + "               <input type=\"hidden\" value=" + s_id + " name=\"u_uid\">\n"
                        + "                Name - \n"
                        + "                <input type=\"text\" value=" + s_name + " name=\"txt_uname\" required>\n"
                        + "                <br>\n"
                        + "                Age - \n"
                        + "                <input type=\"number\" value=" + s_age + " name=\"txt_uage\"  required>\n"
                        + "                <br>\n"
                        + "                Class - \n"
                        + "                <input type=\"text\" value=" + s_class + " name=\"txt_uclass\"  required>\n"
                        + "                <br>\n"
                        + "                Mobile -\n"
                        + "                <input type=\"number\" value=" + s_phone + " name=\"txt_umobile\"  required>\n"
                        + "                <br>\n"
                        + "                Password - \n"
                        + "                <input type=\"text\" value=" + s_password + " name=\"txt_upassword\" required>\n"
                        + "                <br>\n"
                        + "                <input type=\"submit\" name=\"btn_update\" value=\"Update\">\n"
                        + "            </form>");

            }
            //  }
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<h6>" + e + "</h6>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
