<%-- 
    Document   : RegisterSuccess
    Created on : Oct 2, 2018, 11:24:33 PM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Successful | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <div class="container" style="max-width: 35rem;">
            <br>
            <br>
            <div align="center"><img src="http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png" alt="Cart-Commerce"
                                     style="height: 128px; width: 128px;"></div>
            <h1 align="center">Registration Successful!</h1>
            <hr>
            <p class="lead" align="center">You have successfully registered for Cart-Commerce.</p>
            <div style="text-align: center">
            <font style="color: green">
                An email has been sent. Please check your email to verify your account.<br>
                If it doesn’t appear within a few minutes, check your spam folder.<br>
            </font>
            </div>
            <br>
            <center>
                <a href="Login"><button class="btn btn-primary" float="center">Return to sign in</button></a>
            </center>
        </div>
    </body>
</html>
