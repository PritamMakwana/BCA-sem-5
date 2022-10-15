/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author prita
 */
public class selectPage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            request.getRequestDispatcher("index.html").include(request, response);
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();

            if (null == session.getAttribute("name")) {
               response.sendRedirect("login.html");
            } 
            String name = (String) session.getAttribute("name");
            out.println("Hello, " + name );

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Select</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<title>HOME</title>");
            out.println("<style>\n"
                    + "table, th, td {\n"
                    + "  border:1px solid black;\n"
                    + "}\n"
                    + ".insert{margin:20px;}"
                    + "</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<center><h1>Show DATA </h1></center>");
            out.println("<center><table style=\"width:100%\">\n"
                    + "  <tr>\n"
                    + "    <th>Id</th>\n"
                    + "    <th>Name</th>\n"
                    + "    <th>Age</th>\n"
                    + "    <th>Class</th>\n"
                    + "    <th>Mobile</th>\n"
                    + "    <th>Password</th>\n"
                    + "    <th>Edit</th>\n"
                    + "    <th>Delete</th>\n"
                    + "  </tr>\n");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee", "root", "");
            PreparedStatement psall = con.prepareStatement("SELECT * FROM student");
            ResultSet rs = psall.executeQuery();
            while (rs.next()) {
                String id_u = "DataUpdate?id=" + rs.getString(1);
                String id_d = "DataDelete?id=" + rs.getString(1);
                out.println("<tr>\n"
                        + "    <td>" + rs.getString(1) + "</td>\n"
                        + "    <td>" + rs.getString(2) + "</td>\n"
                        + "    <td>" + rs.getString(3) + "</td>\n"
                        + "    <td>" + rs.getString(4) + "</td>\n"
                        + "    <td>" + rs.getString(5) + "</td>\n"
                        + "    <td>" + rs.getString(6) + "</td>\n"
                        + "    <td><a href=" + id_u + ">Edit</a></td>\n"
                        + "    <td><a href=" + id_d + ">Delete</a></td>\n"
                        + "  </tr>\n"
                );
            }
            out.println("</table></center>");
            out.println("</body>");
            out.println("</html>");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("<h2>" + e + "</h2>");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(selectPage.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(selectPage.class.getName()).log(Level.SEVERE, null, ex);
        }
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
