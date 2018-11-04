<%-- 
    Document   : RenewPassword_Email
    Created on : Oct 19, 2018, 11:00:08 AM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Renew Password | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <br>
        <br>
        <div class="container">
            <form action="RenewPassword" method="post">
              <fieldset>
                <h1>Renew Password for @${userToReset}</h1>
                <hr>
                <div class="form-group">
                  <!--Hidden parameter value used for authentication.-->
                  <input type="hidden" name="a" value="${requestScope.a}">
                  <input type="hidden" name="b" value="${requestScope.b}">
                  <label for="exampleInputPassword1">Enter your new password below.</label>
                  <input type="password" name="password1" class="form-control" id="exampleInputPassword1" placeholder="Password" >
                  <small id="passwordHelp" class="form-text text-muted">Make sure it's at least 7 characters</small>
                  <font style="color: red">${errorDesc}</font>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Confirm Password</label>
                  <input type="password" name="password2" class="form-control" id="exampleInputPassword1" placeholder="Re-enter password" >
                </div>
                <br>
                <button type="submit" class="btn btn-primary">Reset Password</button>
              </fieldset>
            </form>
        </div>
    </body>
</html>
