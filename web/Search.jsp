<%-- 
    Document   : Search
    Created on : Nov 9, 2018, 6:38:37 PM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${param.keyword} | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <h3>Advanced Search</h3>
                    <div class="bs-component">
                        <div class="card mb-3">
                            <h5 class="card-header text-muted">Personal Setting</h5>
                            <a href="Setting_Profile" class="list-group-item list-group-item-action">Profile</a>
                            <a href="Setting_Account" class="list-group-item list-group-item-action active">Account</a>
                            <a href="Setting_Security" class="list-group-item list-group-item-action">Security</a>
                            <a href="#" class="list-group-item list-group-item-action">Wishlist</a>
                            <a href="#" class="list-group-item list-group-item-action">View Cart</a>
                            <a href="#" class="list-group-item list-group-item-action">Purchase History</a>
                        </div>
                    </div>
                    <div class="bs-component">
                        <div class="card mb-3">
                            <h5 class="card-header text-muted">More Setting</h5>
                            <a href="Setting_Theme" class="list-group-item list-group-item-action">Theme</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <h1>Search</h1>
                    <hr>
                    <form action="Setting_Account" method="post">
                        <fieldset>
                            <input type="hidden" value="" name="submit" />
                            <div class="col-lg-5">
                                <div class="form-group row">
                                    <label>Old password</label>
                                    <input type="password" name="oldpass" class="form-control" id="exampleInputUser">
                                </div>
                                <div class="form-group row">
                                    <label>New password</label>
                                    <input type="password" name="newpass1" class="form-control" id="exampleInputUser">
                                </div>
                                <div class="form-group row">
                                    <label>Confirm new password</label>
                                    <input type="password" name="newpass2" class="form-control" id="exampleInputUser">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success">Update Password</button> &nbsp;&nbsp;<a href="ResetPassword">I forgot my password</a>
                            <br>
                            <br>
                        </fieldset>
                    </form>
                    <form action="Setting_Account" method="post">
                        <fieldset>
                            <h1>Email</h1>
                            <hr>
                            <div class="form-group row">
                                <div class="col-sm-5">
                                    <input type="text" readonly="" class="form-control-plaintext" id="staticEmail" value="${sessionScope.user.email}">
                                </div>
                                <div class="col-sm-4">
                                    <c:choose>
                                        <c:when test="${sessionScope.user.activateDate != null}">
                                            <span class="badge badge-success">Verified</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-warning">Not Verified</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <input type="hidden" value="" name="submitEmail" />
                            <div class="col-lg-5">
                                <div class="form-group row">
                                    <strong>Type a new Email</strong>
                                    <input type="email" name="email" class="form-control" id="exampleInputUser">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success">Change Email</button>
                        </fieldset>
                    </form>
                    <c:if test="${empty sessionScope.user.activateDate}">
                        <form action="Setting_Account" method="post">
                            <fieldset>
                                <input type="hidden" value="" name="submitEmailVerify" />
                                <br>
                                <p>Can't find the confirmation email? Check your spam folder <button type="submit" class="btn btn-warning">Resend</button></p>
                            </fieldset>
                        </form>
                    </c:if>
                    <br>
                    <h1>Account Properties</h1>
                    <hr>
                    <span class="badge badge-pill badge-success">Created</span>Your account was created at ${sessionScope.user.registerDate} <br>
                    <c:choose>
                        <c:when test="${sessionScope.user.activateDate != null}">
                            <span class="badge badge-pill badge-success">Verified</span>Your email address is activated at ${sessionScope.user.activateDate}
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-pill badge-warning">Not Verified</span>Your email address is not yet activated.
                        </c:otherwise>
                    </c:choose>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
