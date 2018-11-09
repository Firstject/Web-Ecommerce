<%-- 
    Document   : Head
    Created on : Oct 1, 2018, 5:55:07 PM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/style.css">
<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
    <div class="container">
        <a href="index.jsp" class="navbar-brand">🛒<b>Cart-Commerce</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav">
                <form class="form-inline my0 my-lg-0">
                    <input class="form-control form-control-sm mr-sm-0" type="text" placeholder="Search">
                    <button class="btn btn-secondary btn-sm my-0 my-sm-0" type="submit">🔍</button>
                </form>
            </ul>
            <!--Logged out - Logged In-->
            <ul class="nav navbar-nav ml-auto">
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <li class="nav-item">
                            <a class="nav-link" href="Login?returnUrl=${requestScope["javax.servlet.forward.request_uri"]}">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Register">Register</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.user.username}</a>
                            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);">
                                <a class="dropdown-item" href="Setting_Profile">Profile</a>
                                <a class="dropdown-item" href="#">Your Cart</a>
                                <a class="dropdown-item" href="#">Your Orders</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Help">Help</a>
                                <a class="dropdown-item" href="Setting_Account">Settings</a>
                                <a class="dropdown-item" href="Logout">Sign out</a>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</div>