<%-- 
    Document   : delete
    Created on : 9 Sep, 2022, 3:13:30 PM
    Author     : prita
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="index.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
    <body>
        <h1>Delete search</h1>
        <form action="delete.jsp" method="post">
            Id - 
            <input type="number" name="txt_id" required>
            <br>
            <input type="submit" name="btn_search" value="delete">
        </form>


        <%
            String d_id = null;

            if (request.getParameter("id") != null) {
                d_id = request.getParameter("id");
            }

            if (request.getParameterMap().containsKey("btn_search")) {
                d_id = request.getParameter("txt_id");
            }
            if (d_id != null) {

                int uid = Integer.parseInt(d_id);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee", "root", "");
                String d_query = "DELETE FROM student WHERE s_id=" + uid;
                PreparedStatement ps = con.prepareStatement(d_query);
                int result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("select.jsp");
                } else {
                    out.println("<h6>delete id is not found</h6>");
                }
            }
        %>

    </body>
</html>
