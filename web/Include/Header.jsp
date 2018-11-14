<%-- 
    Document   : Head
    Created on : Oct 1, 2018, 5:55:07 PM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/style.css">
<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
    <div class="container">
        <a href="HomePage" class="navbar-brand">🛒<b>Cart-Commerce</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <div class="">
                <form action="Search" method="get" class="form-inline">
                    <div class="form-group">
                        <select class="form-control form-control-sm" name="category">
                            <option>All</option>
                            <option>Apple</option>
                            <option>Smartphone</option>
                            <option>Notebook</option>
                            <option>Tablet</option>
                            <option>Camera</option>
                            <option>Gadget</option>
                            <option>Accessory</option>
                        </select>
                    </div>
                    <input class="form-control form-control-sm mr-sm-2" style="width: 300px;" type="text" name="searchQuery" placeholder="Search Products">
                    <button class="btn btn-secondary btn-sm " type="submit"><i class="fas fa-search"></i> </button>
                </form>
            </div>
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
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user"></i> ${sessionScope.user.username}</a>
                            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);">
                                <a class="dropdown-item" href="Setting_Profile"><i class="fas fa-user"></i> Profile</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-shopping-cart"></i> Your Cart</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-shipping-fast"></i> Your Orders</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Help"><i class="material-icons" style="font-size:16px">help</i> Help</a>
                                <a class="dropdown-item" href="Setting_Account"><i class="material-icons" style="font-size:16px">settings</i> Settings</a>
                                <a class="dropdown-item" href="Logout"><i class="fas fa-sign-out-alt"></i> Sign out</a>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
                <li class="nav-item">
                    <a class="nav-link" href="Setting_Theme"><i class="fas fa-paint-roller"></i></a>
                </li>
                <li class="nav-item form-inline">
                    <a class="nav-link" href="View_Cart"><i class="fas fa-shopping-cart"></i>
                        <c:if test="${fn:length(sessionScope.cartProductList) > 0}">
                            <span class="badge badge-pill badge-secondary">${fn:length(sessionScope.cartProductList)}</span>
                        </c:if>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>