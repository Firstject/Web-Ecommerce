<%-- 
    Document   : Setting_Security
    Created on : Nov 6, 2018, 9:10:36 PM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <c:forEach items="${sessionScope.user.accountHistoryList}" var="list" varStatus="vs">
                            <div class="list-group-item flex-column align-items-start">
                                <div class="d-flex w-100 justify-content-between">
                                    <a class="text-secondary" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"><h5><b>${list.historyType}</b></h5></a>
                                    <div class="dropdown-menu col-lg-5" style="padding: 0;">
                                        <div class="card">
                                            <h3 class="card-header">${list.historyType}</h3>
                                            <div class="card-body">
                                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                            </div>
                                            <c:if test="${!empty list.historyInfo}">
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item"></li>
                                                </ul>
                                            </c:if>
                                            <div class="card-footer text-muted">
                                                2 days ago
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <small class="text-muted">${list.historyDate}</small>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
