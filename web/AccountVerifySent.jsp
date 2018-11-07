<%-- 
    Document   : AccountVerifySent
    Created on : Nov 7, 2018, 2:57:41 PM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verification Sent | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <div class="container" style="max-width: 25rem;">
            <br>
            <br>
            <div align="center">
                <a href="HomePage">
                    <img src="http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png" alt="Cart-Commerce"
                                                        style="height: 128px; width: 128px;">
                </a>
            </div>
            <h1 align="center">Email Verification</h1>
            <div class="card border-success mb-3 container" >
              <div class="card-body">
                <p class="card-text">To change your email, simply click the link in the email sent to you.</p>
              </div>
            </div>
            <center>
                <a href="Login"><button class="btn btn-primary" float="center">Return to sign in</button></a>
            </center>
        </div>
    </body>
</html>
