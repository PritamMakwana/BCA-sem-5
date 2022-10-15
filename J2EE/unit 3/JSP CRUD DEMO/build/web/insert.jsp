<%-- 
    Document   : insert
    Created on : 9 Sep, 2022, 3:11:56 PM
    Author     : prita
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="index.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Page</title>
    </head>
    <body>
        <h1>INSERT DATA</h1>
        <form action="insert.jsp" method="post">
            Name - 
            <input type="text" name="txt_name" required>
            <br>
            Age - 
            <input type="number" name="txt_age"  required>
            <br>
            Class - 
            <input type="text" name="txt_class"  required>
            <br>
            Mobile -
            <input type="number" name="txt_mobile"  required>
            <br>
            Password - 
            <input type="text" name="txt_password" required>
            <br>
            <input type="submit" name="btn_insert" value="Insert">
        </form>



        <%
            if (request.getParameterMap().containsKey("btn_insert")) {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee", "root", "");
                PreparedStatement ps = con.prepareStatement("INSERT INTO student VALUES (NULL,?,?,?,?,?)");
                String name = request.getParameter("txt_name");
                String age = request.getParameter("txt_age");
                String cla = request.getParameter("txt_class");
                String mobile = request.getParameter("txt_mobile");
                String password = request.getParameter("txt_password");
                ps.setString(1, name);
                ps.setString(2, age);
                ps.setString(3, cla);
                ps.setString(4, mobile);
                ps.setString(5, password);
                out.println(ps);
                int result = ps.executeUpdate();
                con.close();
                if (result > 0) {
                    out.println("<script>alert(\"Inserted suscces ...\");</script>");
                    response.sendRedirect("select.jsp");
                } else {
                    out.println("<script>alert(\"Insert Not data ...\");</script>");
                    response.sendRedirect("insert.jsp");
                }
            }
        %>
    </body>
</html>
