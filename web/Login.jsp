<%-- 
    Document   : Login
    Created on : Oct 1, 2018, 5:07:50 PM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
    </head>
    <body>
        <div class="container" style="max-width: 25rem;">
            <br>
            <br>
            <div align="center"><img src="http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png" alt="Cart-Commerce"
                                     style="height: 128px; width: 128px;"></div>
            <h1 align="center">Sign in</h1>
            <div class="card border-secondary mb-3">
                <div class="card-body">
                    <!--<h4 class="card-title">Primary </h4>-->
                    <div class="form-group">
                      <label class="col-form-label" for="inputDefault"><h5>Username or email address</h5></label>
                      <input type="text" class="form-control" id="inputDefault">
                      <label class="col-form-label" for="inputDefault"><h5>Password</h5></label>
                      <input type="password" class="form-control" id="inputDefault">
                      <br>
                      <input type="submit" value="Sign in" class="form-control btn btn-primary">
                      <br>
                      <br>
                      <div align="center"><button type="button" class="btn btn-link">Forgot password?</button></div>
                    </div>
                </div>
            </div>
            <div class="card border-secondary mb-3">
                <div class="card-body">
                    <div align="center">New to Cart-Commerce? <button type="button" class="btn btn-link">Create account</button></div>
                </div>
            </div>
        </div>
    </body>
</html>
