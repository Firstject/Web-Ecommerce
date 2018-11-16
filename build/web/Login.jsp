<%-- 
    Document   : Login
    Created on : Oct 1, 2018, 5:07:50 PM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
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
            <h1 align="center">Sign in</h1>
            <c:if test="${isAuthenticated == false}">
                <div class="alert alert-dismissible alert-danger">
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                  Incorrect username or password.
                </div>
            </c:if>
            <form action="Login" method="post">
                <fieldset>
                    <div class="card border-dark mb-3">
                        <div class="card-body" style="display: inline">
                            <div class="form-group" style="display: inline">
                                <!--Hidden parameter value used for authentication.-->
                                <input type="hidden" name="returnUrl" value="${requestScope.returnUrl}">
                                <label class="col-form-label" for="inputDefault"><h5>Username or email address</h5></label>
                                <div class="d-flex">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text form-control">
                                            <i style='font-size:32px;' class='fas fa-user-circle'></i>
                                        </span>
                                    </div>
                                    <input type="text" name="parameter" class="form-control" id="inputDefault" value="${parameter}"/>
                                </div>
                                <label class="col-form-label" for="inputDefault"><h5>Password</h5></label>
                                <div class="d-flex">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text form-control">
                                            <i style='font-size:32px' class='fas fa-key'></i>
                                        </span>
                                    </div>
                                    <input type="password" name="password" class="form-control" id="inputDefault" value=""/>
                                </div>
                                <br>
                                <input type="submit" value="Sign in" class="form-control btn btn-primary" >
                            </div>
                        </div>
                        <div align="center"><a href="ResetPassword"><button type="button" class="btn btn-link">Forgot password?</button></a></div>
                    </div>
                </fieldset>
            </form>
            <div class="card border-success mb-3">
                <div class="card-body">
                    <div align="center">New to Cart-Commerce? <a href="Register"><button type="button" class="btn btn-link">Create account</button></a></div>
                </div>
            </div>
        </div>
<!--        <h2>JSP URI, URL, Context</h2>

        Request Context Path: <%= request.getContextPath() %> <br>
        Request URI:          <%= request.getRequestURI() %> <br>
        Request URL:          <%= request.getRequestURL() %> <br>-->
    </body>
</html>
