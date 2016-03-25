<%--    
    Document   : mainpage
    Created on : Mar 10, 2016, 11:43:52 AM
    Author     : Chino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="loginBean" scope="session" class="Handlers.LoginHandler" />
        <jsp:setProperty name="loginBean" property="userName"/>
        <jsp:setProperty name="loginBean" property="passWord"/>
        <h1>Status: </h1>
        <jsp:getProperty name="loginBean" property="test" />
        <jsp:forward page="../index.html"/>
    </body>
</html>
