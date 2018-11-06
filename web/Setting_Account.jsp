<%-- 
    Document   : Setting_Account
    Created on : Nov 6, 2018, 8:57:51 AM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Settings | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card mb-3">
                            <h5 class="card-header text-muted">Personal Setting</h5>
                            <a href="Setting_Profile" class="list-group-item list-group-item-action">Profile</a>
                            <a href="Setting_Account" class="list-group-item list-group-item-action active">Account</a>
                            <a href="#" class="list-group-item list-group-item-action">Security</a>
                            <a href="#" class="list-group-item list-group-item-action">Wishlist</a>
                            <a href="#" class="list-group-item list-group-item-action">View Cart</a>
                            <a href="#" class="list-group-item list-group-item-action">Purchase History</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <form action="Setting_Account" method="post">
                        <fieldset>
                            <h1>Change Password</h1>
                            <hr>
                            <input type="hidden" value="" name="submit" />
                            <div class="col-lg-5">
                                <div class="form-group row">
                                    <label>Old password</label>
                                    <input type="text" name="oldpass" class="form-control" id="exampleInputUser">
                                </div>
                                <div class="form-group row">
                                    <label>New password</label>
                                    <input type="text" name="newpass1" class="form-control" id="exampleInputUser">
                                </div>
                                <div class="form-group row">
                                    <label>Confirm new password</label>
                                    <input type="text" name="newpass2" class="form-control" id="exampleInputUser">
                                </div>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-success">Update Password</button> &nbsp;&nbsp;<a href="ResetPassword">I forgot my password</a>
                        </fieldset>
                    </form>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>

