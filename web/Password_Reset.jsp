<%-- 
    Document   : Password_Reset
    Created on : Oct 2, 2018, 7:41:56 PM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot your password? | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
    </head>
    <body>
        <div class="container" style="max-width: 25rem;">
            <br>
            <br>
            <div align="center"><img src="http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png" alt="Cart-Commerce"
                                     style="height: 128px; width: 128px;"></div>
            <h1 align="center">Reset your password</h1>
            <form action="ResetPassword" method="post">
                <fieldset>
                    <c:choose>
                        <c:when test="${!empty errorDesc}">
                            <div class="alert alert-dismissible alert-danger">
                              <button type="button" class="close" data-dismiss="alert">&times;</button>
                              <strong>Oh snap!</strong> ${errorDesc}
                            </div>
                        </c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                    <div class="card border-dark mb-3">
                        <div class="card-body" style="display: inline">
                            <div class="form-group" style="display: inline">
                              <label class="col-form-label" for="inputDefault"><b>Enter your email address and we will send you a link to reset your password.</b></label>
                              <input type="text" name="parameter" class="form-control" id="inputDefault"/>
                              <br>
                              <input type="submit" value="Send password reset email" class="form-control btn btn-success" >
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </body>
</html>

<!--Check your email for a link to reset your password. If it doesn’t appear within a few minutes, check your spam folder.-->
<!--Return to sign in-->

<!--Password Reset Page-->
<!--Change password for @Firstject-->
<!--Password must contain one lowercase letter, one number, and be at least 7 characters long.-->
<!--Change password-->