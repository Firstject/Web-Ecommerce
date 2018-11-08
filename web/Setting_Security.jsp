<%-- 
    Document   : Setting_Security
    Created on : Nov 6, 2018, 9:10:36 PM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Security | Cart-Commerce</title>
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
                            <h5 class="card-header text-muted">Security</h5>
                            <a href="Setting_Profile" class="list-group-item list-group-item-action">Profile</a>
                            <a href="Setting_Account" class="list-group-item list-group-item-action">Account</a>
                            <a href="Setting_Security" class="list-group-item list-group-item-action active">Security</a>
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
                    <h1>Security History</h1>
                    <hr>
                    <label>This is a security log of important events involving your account.</label>
                    <div class="list-group">
                        <c:forEach items="${historyList}" var="list" varStatus="vs">
                            <div class="list-group-item flex-column align-items-start">
                                <div class="d-flex w-100 justify-content-between">
                                    <a class="text-secondary" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"><h5><b>${list.historyType}</b></h5></a>
                                    <div class="dropdown-menu col-lg-5" style="padding: 0;">
                                        <div class="card border-dark">
                                            <h3 class="card-header">${list.historyType}</h3>
                                            <div class="card-body">
                                                <p class="card-text">
                                                    <c:choose>
                                                        <c:when test="${list.historyType == 'user.login'}">
                                                            Authentication has been granted for this user.
                                                        </c:when>
                                                        <c:when test="${list.historyType == 'user.failed_login'}">
                                                            Login attempt was failed. The username and password combination does not match a user account and has been disallowed access.
                                                        </c:when>
                                                        <c:when test="${list.historyType == 'user.forgot_password'}">
                                                            Someone has previously entered an email address when signing up for the account or in your Preferences to request a password reset.
                                                        </c:when>
                                                        <c:when test="${list.historyType == 'user.change_password'}">
                                                            The password for this account was just changed.
                                                        </c:when>
                                                        <c:when test="${list.historyType == 'user.change_email'}">
                                                            This user has changed email address.
                                                        </c:when>
                                                        <c:otherwise>
                                                            Information Unavailable.
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <c:if test="${!empty list.historyInfo}">
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">
                                                        ${list.historyInfo}
                                                    </li>
                                                </ul>
                                            </c:if>
                                            <div class="card-footer text-muted">
                                                ${list.historyDate}
                                            </div>
                                        </div>
                                    </div>
                                    <small class="text-muted">${list.historyInfo2}</small>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
