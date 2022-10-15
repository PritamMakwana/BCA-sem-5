<%-- 
    Document   : errorpage
    Created on : Sep 14, 2022, 2:00:23 PM
    Author     : KSC
--%>
<%@page isErrorPage="true" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>error Page</title>
    </head>
    <body>
        <h1>sorry ,error</h1>
        Exception is :<%= exception %>
    </body>
</html>
