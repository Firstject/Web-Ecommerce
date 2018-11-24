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
        <a href="HomePage" class="navbar-brand">🛒<b>Cart-Commerce</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <div class="">
                <form action="Search" method="get" class="form-inline">
                    <div class="form-group">
                        <select class="form-control form-control-sm" name="category">
                            <option ${requestScope.category == 'All' ? 'selected' : ''}>All</option>
                            <option ${requestScope.category == 'Apple' ? 'selected' : ''}>Apple</option>
                            <option ${requestScope.category == 'Smartphone' ? 'selected' : ''}>Smartphone</option>
                            <option ${requestScope.category == 'Notebook' ? 'selected' : ''}>Notebook</option>
                            <option ${requestScope.category == 'Tablet' ? 'selected' : ''}>Tablet</option>
                            <option ${requestScope.category == 'Camera' ? 'selected' : ''}>Camera</option>
                            <option ${requestScope.category == 'Gadget' ? 'selected' : ''}>Gadget</option>
                            <option ${requestScope.category == 'Accessory' ? 'selected' : ''}>Accessory</option>
                        </select>
                    </div>
                    <input class="form-control form-control-sm mr-sm-2" style="width: 300px;" type="text" name="searchQuery" value="${requestScope.searchQuery}" placeholder="Search Products">
                    <button class="btn btn-secondary btn-sm " type="submit"><i class="fas fa-search"></i> </button>
                </form>
            </div>
            <!--Logged out - Logged In-->
            <ul class="nav navbar-nav ml-auto">
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <li class="nav-item">
                            <a class="nav-link" href="Login?returnUrl=${requestScope['javax.servlet.forward.request_uri']}?${requestScope['javax.servlet.forward.query_string']}">Login</a>
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
                                <a class="dropdown-item" href="ViewCart">
                                    <i class="fas fa-shopping-cart"></i> Your Cart
                                    <c:if test="${!empty sessionScope.cartProductList}">
                                        <c:set var="itc" value="${0}" />
                                        <c:forEach items="${sessionScope.cartProductList}" var="list">
                                            <c:set var="itc" value="${itc + list.productStock}" />
                                        </c:forEach>
                                        <span class="badge badge-${itc > 50 ? itc > 80 ? 'danger' : 'warning' : 'success'} badge-pill">${itc}</span>
                                    </c:if>
                                </a>
                                <a class="dropdown-item" href="Setting_OrderHistory"><i class="fas fa-shipping-fast"></i> Order History</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Help"><i class="fa fa-question-circle"></i> Help</a>
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
                    <a class="nav-link" href="ViewCart"><i class="fas fa-shopping-cart"></i>
                        <c:set var="itemsCount" value="${0}" />
                        <c:forEach items="${sessionScope.cartProductList}" var="list">
                            <c:set var="itemsCount" value="${itemsCount + list.productStock}" />
                        </c:forEach>
                        <c:if test="${itemsCount > 0}">
                            <span class="badge badge-pill badge-${itemsCount > 50 ? itemsCount > 80 ? 'danger' : 'warning' : 'success'}">${itemsCount}</span>
                        </c:if>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Help"><i class="fa fa-question-circle"></i></a>
                </li>
            </ul>
        </div>
    </div>
</div>