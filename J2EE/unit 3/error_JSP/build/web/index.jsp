<%-- 
    Document   : index
    Created on : Sep 14, 2022, 1:29:09 PM
    Author     : KSC
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Date createTime = new Date(session.getCreationTime());
            Date LastAccessedTime = new Date(session.getLastAccessedTime());
            String title = "welcome back to my website";
            Integer visitCount = new Integer(0);
            String visitcountKey = new String("visitcount");
            String userIdKey = new String("userID");
            String userID = new String("ABCD");

            if (session.isNew()) {
                title = "welcome to my website";
                session.setAttribute(userIdKey, userID);
                session.setAttribute(visitcountKey, visitCount);
            } else {
                title = "welcome back";
            }

            visitCount = (Integer) session.getAttribute(visitcountKey);
            visitCount=+;
            userID = (String) session.getAttribute(userIdKey);
            session.setAttribute(visitcountKey, visitCount);
        %>

    <center>
        <h1>session traking</h1>
    </center>
    <table border="1" align="center">
        
        <tr bgcolor="#3852">
            <th>Session Info</th>
             <th>value</th>
        </tr>
        <tr>
            <td>id</td>
            <td><%= session.getId() %></td>
        </tr>
        
         <tr>
            <td>create time</td>
            <td><%= createTime %></td>
        </tr>
         <tr>
            <td>id</td>
            <td><%= LastAccessedTime %></td>
        </tr>
         <tr>
            <td>id</td>
            <td><%= userID %></td>
        </tr>
         <tr>
            <td>id</td>
            <td><%= visitCount %></td>
        </tr>
        
    </table>
</body>
</html>
