<%-- 
    Document   : Register
    Created on : Oct 2, 2018, 12:36:37 AM
    Author     : Firsty
--%>

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
            <form>
              <fieldset>
                <h1>Register</h1>
                <p class="lead">Register now! It's fast and free!</p>
                <hr>
                <div class="form-group">
                  <label>Username</label>
                  <input type="text" class="form-control" id="exampleInputUser" placeholder="Enter a new username" minlength="4" required="">
                  <small id="userHelp" class="form-text text-muted">This will be your username. Make sure it's at least 4 characters</small>
                </div>
                <div class="form-group">
                  <label>Email address</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email address">
                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" minlength="7" required="">
                  <small id="passwordHelp" class="form-text text-muted">Make sure it's at least 7 characters</small>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Confirm Password</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Re-enter password" minlength="7" required="">
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
    </body>
</html>
