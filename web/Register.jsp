<%-- 
    Document   : Register
    Created on : Oct 2, 2018, 12:36:37 AM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <br>
        <div class="container">
            <form action="Register" method="post">
              <fieldset>
                <h1>Register</h1>
                <p class="lead">Register now! It's fast and free!</p>
                <hr>
                <div class="form-group">
                  <label>
                      <i class="fas fa-user"></i>
                      Username
                  </label>
                  <input type="text" name="username" class="form-control" value="${requestScope.usernameField}" placeholder="Enter a new username" minlength="4" required="">
                  <small id="userHelp" class="form-text text-muted">This will be your username. Make sure it's at least 4 characters and no more than 16 characters</small>
                  <c:if test="${errorCode == 'USER_EMPTY' || errorCode == 'USER_TOOSHORT'
                        || errorCode == 'USER_TOOLONG' || errorCode == 'USER_HASWHITESPACE'
                        || errorCode == 'USER_EXISTS'}">
                      <font style="color: red">${errorDesc}</font>
                  </c:if>
                </div>
                <div class="form-group">
                  <label>
                      <i class="fas fa-at"></i>
                      Email address
                  </label>
                  <input type="email" name="email" class="form-control" value="${requestScope.emailField}" placeholder="Enter email address">
                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                  <c:if test="${errorCode == 'EMAIL_EMPTY' || errorCode == 'EMAIL_EXISTS'}">
                      <font style="color: red">${errorDesc}</font>
                  </c:if>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">
                      <i class="fas fa-key"></i>
                      Password
                  </label>
                  <input type="password" name="password1" class="form-control" id="exampleInputPassword1" placeholder="Password" minlength="7" required="">
                  <small id="passwordHelp" class="form-text text-muted">Make sure it's at least 7 characters</small>
                  <c:if test="${errorCode == 'PASSWORD_EMPTY' || errorCode == 'PASSWORD_TOOSHORT'
                        || errorCode == 'PASSWORD_TOOLONG'}">
                      <font style="color: red">${errorDesc}</font>
                  </c:if>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">
                      <i class="fas fa-key"></i>
                      Confirm Password
                  </label>
                  <input type="password" name="password2" class="form-control" id="exampleInputPassword1" placeholder="Re-enter password" minlength="7" required="">
                  <c:if test="${errorCode == 'PASSWORD_EMPTY' || errorCode == 'PASSWORD_NOTMATCH'}">
                      <font style="color: red">${errorDesc}</font>
                  </c:if>
                </div>
                <div class="form-group">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck1" required="">
                        <label class="custom-control-label" for="customCheck1" checked="">Check here to indicates that I agree to <a href="#">Terms of Service</a> and <a href="#">Conditions</a>.</label>
                    </div>
                </div>
                <br>
                <button type="submit" class="btn btn-primary">Register</button>
              </fieldset>
            </form>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
    </body>
</html>
