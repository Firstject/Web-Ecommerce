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
                  <label>Username</label>
                  <input type="text" name="username" class="form-control" id="exampleInputUser" placeholder="Enter a new username" minlength="4" required="">
                  <small id="userHelp" class="form-text text-muted">This will be your username. Make sure it's at least 4 characters</small>
                  <c:choose>
                      <c:when test="${errorCode == -1}">
                          <font style="color: red">Username length is too long!</font>
                      </c:when>
                      <c:when test="${errorCode == 1}">
                          <font style="color: red">Username length is too short! </font>
                      </c:when>
                      <c:when test="${errorCode == 2}">
                          <font style="color: red">Username contains whitespace! </font>
                      </c:when>
                      <c:when test="${errorCode == 5}">
                          <font style="color: red">Username already exists! Please choose another name.</font>
                      </c:when>
                  </c:choose>
                </div>
                <div class="form-group">
                  <label>Email address</label>
                  <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email address">
                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                  <c:choose>
                      <c:when test="${errorCode == 6}">
                          <font style="color: red">Email already in use!</font>
                      </c:when>
                  </c:choose>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" name="password1" class="form-control" id="exampleInputPassword1" placeholder="Password" minlength="7" required="">
                  <small id="passwordHelp" class="form-text text-muted">Make sure it's at least 7 characters</small>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Confirm Password</label>
                  <input type="password" name="password2" class="form-control" id="exampleInputPassword1" placeholder="Re-enter password" minlength="7" required="">
                  <c:choose>
                      <c:when test="${errorCode == 3 || errorCode == 4}">
                          <font style="color: red">Please check that you have entered and confirmed the same password!</font>
                      </c:when>
                  </c:choose>
                </div>
                <div class="form-check">
                  <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" value="" required>
                    Check here to indicates that I agree to <a href="#">Terms of Service</a> and <a href="#">Conditions</a>.
                  </label>
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
