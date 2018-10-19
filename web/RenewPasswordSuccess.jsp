<%-- 
    Document   : RenewPasswordSuccess
    Created on : Oct 19, 2018, 11:23:10 AM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Reset Done | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <div class="container" style="max-width: 35rem;">
            <br>
            <br>
            <div align="center"><img src="http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png" alt="Cart-Commerce"
                                     style="height: 128px; width: 128px;"></div>
            <h1 align="center">Success!</h1>
            <hr>
            <p class="lead" align="center">Password reset successful!</p>
            <div style="text-align: center">
            <font style="color: green">
                You can now use your new password to log in.<br>
            </font>
            </div>
            <br>
            <center>
                <button class="btn btn-primary" href="Login.jsp" float="center">Return to sign in</button>
            </center>
        </div>
    </body>
</html>
