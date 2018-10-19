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
                <h1>Renew Password</h1>
                <hr>
                <div class="form-group">
                  <label for="exampleInputPassword1">Enter your new password below.</label>
                  <input type="password" name="password1" class="form-control" id="exampleInputPassword1" placeholder="Password" minlength="7" required="">
                  <small id="passwordHelp" class="form-text text-muted">Make sure it's at least 7 characters</small>
                  <c:if test="${errorCode == 'PASSWORD_EMPTY' || errorCode == 'PASSWORD_TOOSHORT'
                        || errorCode == 'PASSWORD_TOOLONG'}">
                      <font style="color: red">${errorDesc}</font>
                  </c:if>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Confirm Password</label>
                  <input type="password" name="password2" class="form-control" id="exampleInputPassword1" placeholder="Re-enter password" minlength="7" required="">
                  <c:if test="${errorCode == 'PASSWORD_EMPTY' || errorCode == 'PASSWORD_NOTMATCH'}">
                      <font style="color: red">${errorDesc}</font>
                  </c:if>
                </div>
                <br>
                <button type="submit" class="btn btn-primary">Reset Password</button>
              </fieldset>
            </form>
        </div>
    </body>
</html>
