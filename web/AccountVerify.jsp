<%-- 
    Document   : AccountVerify
    Created on : Oct 10, 2018, 9:20:47 AM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
             <c:choose>
                 <c:when test="${isVerify == true}">
                    <div align="center"><img src="https://www.allaboutfnb.sg/wp-content/uploads/2018/05/successfully-verified-300x300.png" alt="Cart-Commerce"
                                             style="height: 128px; width: 128px;"></div>
                    <h1 align="center">Verification Success!</h1>
                    <hr>
                    <p class="lead" align="center">Your account is successfully verified.</p>
                 </c:when>
                 <c:otherwise>
                    <div align="center"><img src="https://png.pngtree.com/svg/20170427/verification_verification_failed_257635.png" alt="Cart-Commerce"
                                             style="height: 128px; width: 128px;"></div>
                    <h1 align="center">Invalid Verification!</h1>
                    <hr>
                    <p class="lead" align="center">We weren't able to detect your verification.</p>
                 </c:otherwise>
             </c:choose>
            <div style="text-align: center">
                <c:choose>
                    <c:when test="${isVerify == true}">
                        <font style="color: green">
                        You've successfully verified your email!<br>
                        Please click the button below to return to login page.<br>
                        </font>
                    </c:when>
                    <c:otherwise>
                        <font style="color: red">
                        Are you sure you've received our email for an account verification?<br>
                        Please click the button below to return to login page.<br>
                        </font>
                    </c:otherwise>
                </c:choose>
            </div>
            <br>
            <center>
                <button class="btn btn-primary" href="Login.jsp" float="center">Return to sign in</button>
            </center>
        </div>
    </body>
</html>
