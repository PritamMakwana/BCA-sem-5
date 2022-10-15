<%-- 
    Document   : update
    Created on : 9 Sep, 2022, 3:12:39 PM
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
        <title>Update Page</title>
    </head>
    <body>
        <h1>Update search</h1>
        <form action="update.jsp" method="post">
            Id - 
            <input type="number" name="txt_id" required>
            <br>
            <input type="submit" name="btn_search" value="search">
        </form>


        <!--form in data add-->
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee", "root", "");
            Statement stmt = con.createStatement();
            String id = null;
            if (request.getParameter("id") != null) {
                id = request.getParameter("id");
            }

            if (request.getParameterMap().containsKey("btn_search")) {
                id = request.getParameter("txt_id");
            }
            if (id != null) {
                int uid = Integer.parseInt(id);
                String squery = "select * from student where s_id=" + uid;
                ResultSet rs = stmt.executeQuery(squery);

                while (rs.next()) {

                    String s_id = rs.getString(1);
                    String s_name = rs.getString(2);
                    String s_age = rs.getString(3);
                    String s_class = rs.getString(4);
                    String s_phone = rs.getString(5);
                    String s_password = rs.getString(6);
        %>
        <form action="update.jsp" method="post">
            <h1>Update FORM</h1>
            <input type="hidden" value="<% out.print(s_id);  %>" name="u_uid">
            Name - 
            <input type="text" value="<% out.print(s_name);  %>" name="txt_uname" required>
            <br>
            Age - 
            <input type="number" value="<% out.print(s_age);  %>" name="txt_uage"  required>
            <br>
            Class - 
            <input type="text" value="<% out.print(s_class);  %>" name="txt_uclass"  required>
            <br>
            Mobile -
            <input type="number" value="<% out.print(s_phone);  %>" name="txt_umobile"  required>
            <br>
            Password - 
            <input type="text" value="<% out.print(s_password);  %>" name="txt_upassword" required>
            <br>
            <input type="submit" name="btn_update" value="Update">
        </form>



        <%
                }
            }

            if (request.getParameterMap().containsKey("btn_update")) {
                String newid = request.getParameter("u_uid");
                int uid = Integer.parseInt(newid);
                String name = request.getParameter("txt_uname");
                String age = request.getParameter("txt_uage");
                String cla = request.getParameter("txt_uclass");
                String mob = request.getParameter("txt_umobile");
                String pwd = request.getParameter("txt_upassword");

                String u_query = "UPDATE student SET s_name= ? ,s_age= ? ,s_class= ? ,s_phone= ? ,s_password= ? WHERE s_id= ? ";
                PreparedStatement ps = con.prepareStatement(u_query);
                ps.setString(1, name);
                ps.setString(2, age);
                ps.setString(3, cla);
                ps.setString(4, mob);
                ps.setString(5, pwd);
                ps.setInt(6, uid);
                int result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("select.jsp");
                } else {
                    out.print("<h2> error in update time </h2>");
                }

            }
        %>
    </body>
</html>
