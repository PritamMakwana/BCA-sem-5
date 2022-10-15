<%-- 
    Document   : select
    Created on : Sep 3, 2022, 4:43:05 AM
    Author     : KSC
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="index.html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Page</title>
        <style>
            table, th, td {
                border:1px solid black;
            }
            .insert{margin:20px;}
        </style>
    </head>
    <body>
    <center><h1>Show DATA </h1></center>
    <center>
        <table style="width:100%">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Age</th>
                <th>Class</th>
                <th>Mobile</th>
                <th>Password</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <%
//                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con;
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee", "root", "");
                    PreparedStatement psall = con.prepareStatement("SELECT * FROM student");
                    ResultSet rs = psall.executeQuery();
                    while (rs.next()) {
                        String id_u = "update.jsp?id=" + rs.getString(1);
                        String id_d = "delete.jsp?id=" + rs.getString(1);
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

//                } catch (ClassNotFoundException | SQLException e) {
//                    System.out.println("<h2>" + e + "</h2>");
//                }
            %>

        </table>
    </center>
</body>
</html>
