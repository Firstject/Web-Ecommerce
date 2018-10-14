<%-- 
    Document   : AccountVerifySuccess
    Created on : Oct 13, 2018, 10:48:23 PM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Verification | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <div class="container" style="max-width: 35rem;">
            <br>
            <br>
            <div align="center"><img src="https://www.allaboutfnb.sg/wp-content/uploads/2018/05/successfully-verified-300x300.png" alt="Cart-Commerce"
                                     style="height: 128px; width: 128px;"></div>
            <h1 align="center">Verification Success!</h1>
            <hr>
            <p class="lead" align="center">Your account is successfully verified.</p>
            <div style="text-align: center">
                <font style="color: green">
                You've successfully verified your email!<br>
                Please click the button below to return to login page.<br>
                </font>
            </div>
            <br>
            <center>
                <a href="Login"><button class="btn btn-primary" float="center">Return to sign in</button></a>
            </center>
        </div>
    </body>
</html>
