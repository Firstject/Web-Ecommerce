<%-- 
    Document   : ResetPasswordCodeSent
    Created on : Oct 13, 2018, 9:46:09 PM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Sent! | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
    </head>
    <body>
        <div class="container" style="max-width: 25rem;">
            <br>
            <br>
            <div align="center"><img src="http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png" alt="Cart-Commerce"
                                     style="height: 128px; width: 128px;"></div>
            <h1 align="center">Reset your password</h1>
            <div class="card border-success mb-3 container" >
              <div class="card-body">
                <p class="card-text">Check your email for a link to reset your password. If it doesn’t appear within a few minutes, check your spam folder.</p>
              </div>
            </div>
            <center>
                <a href="Login"><button class="btn btn-primary" float="center">Return to sign in</button></a>
            </center>
        </div>
    </body>
</html>
