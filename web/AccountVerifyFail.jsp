<%-- 
    Document   : AccountVerifyFail
    Created on : Oct 13, 2018, 10:52:50 PM
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
            <div align="center"><img src="https://png.pngtree.com/svg/20170427/verification_verification_failed_257635.png" alt="Cart-Commerce"
                                     style="height: 128px; width: 128px;"></div>
            <h1 align="center">Invalid Verification!</h1>
            <hr>
            <p class="lead" align="center">We weren't able to detect your verification.</p>
            <div style="text-align: center">
                <font style="color: red">
                Are you sure you've received our email for an account verification?<br>
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
