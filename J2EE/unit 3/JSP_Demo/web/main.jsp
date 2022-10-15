<%-- 
    Document   : main
    Created on : Sep 3, 2022, 4:08:00 AM
    Author     : KSC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" cont"text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> World!</h1>
        <ul>
            <li>
                <p>Frist name : </p>
                <%= request.getParameter("fname") %>                    
            </li>
            <li>
                <p>Last name : </p>
                <%= request.getParameter("lname") %>                    
            </li>
        </ul>
        
    </body>
</html>
