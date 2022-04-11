<%-- 
    Document   : Help
    Created on : Nov 24, 2018, 9:14:46 PM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <br>
        <div class="container">
            <c:choose>
                <c:when test="${!empty sessionScope.user.username}">
                    <h1>Hi, ${sessionScope.user.username}. What we can help you with?</h1>
                </c:when>
                <c:otherwise>
                    <h1>Hi, user. What we can help you with?</h1>
                </c:otherwise>
            </c:choose>
            <div class="form-inline justify-content-center">
                <div class="card border-primary bg-light" style="min-width: 64rem; max-width: 64rem; margin: 20px;">
                    <div class="card-header bg-primary"><a href="HomePage" class="text-white"><strong>Getting Started</strong></a></div>
                    <div class="card-body">
                        <a href="HomePage">
                            <img src="http://voguepayblog.com/wp-content/uploads/2016/12/eCommerce-growth-with-Voguepay-2.png" alt="ViewCart"
                                 style="width: 58rem; height: 18rem; margin-left: 24px; border-radius: 24px;">
                        </a>
                        <br>
                        <br>
                        <a href="HomePage" class="btn btn-success btn-lg btn-block">
                            Browse Products
                        </a>
                    </div>
                </div>
            </div>
            <div class="form-inline justify-content-center">
                <div class="card border-primary" style="min-width: 20rem; max-width: 20rem; margin: 20px;">
                    <div class="card-header"><a href="Setting_OrderHistory">Your Orders</a></div>
                    <div class="card-body">
                        <a href="Setting_OrderHistory">
                            <img src="https://accessories.edunet.com.au/Content/images/OrderSearch.png" alt="OrderHistory"
                                 style="width: 15rem; height: 15rem; margin-left: 24px;">
                        </a>
                        <ul>
                            <li>View orders history</li>
                            <li>Re-add previous orders to cart</li>
                        </ul>
                        <a href="Setting_OrderHistory" class="btn btn-primary btn-lg btn-block">
                            View Orders
                        </a>
                    </div>
                </div>
                <div class="card border-primary" style="min-width: 20rem; max-width: 20rem; margin: 20px;">
                    <div class="card-header"><a href="Setting_Security">Security History</a></div>
                    <div class="card-body">
                        <a href="Setting_Security">
                            <img src="https://icon-library.com/images/network-security-icon/network-security-icon-2.jpg" alt="OrderHistory"
                                 style="width: 15rem; height: 15rem; margin-left: 24px;">
                        </a>
                        <ul>
                            <li>Review your security detail</li>
                            <br>
                        </ul>
                        <a href="Setting_Security" class="btn btn-primary btn-lg btn-block">
                            Review Account
                        </a>
                    </div>
                </div>
                <div class="card border-primary" style="min-width: 20rem; max-width: 20rem; margin: 20px;">
                    <div class="card-header"><a href="Setting_Account">Account Settings</a></div>
                    <div class="card-body">
                        <a href="Setting_Account">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDessD7uBJcLlUXy_dHIMmRbx-7u1sEx4W0Zw_A6Pub_4u4zL_OqgpRzgO-3hksT0V-lc&usqp=CAU" alt="AccountSecuritySetting"
                                 style="width: 15rem; height: 15rem; margin-left: 24px;">
                        </a>
                        <ul>
                            <li>Change email or password</li>
                            <li>Update login information</li>
                        </ul>
                        <a href="Setting_Account" class="btn btn-primary btn-lg btn-block">
                            Edit Account
                        </a>
                    </div>
                </div>
            </div>
            <div class="form-inline justify-content-center">
                <div class="card border-primary" style="min-width: 20rem; max-width: 20rem; margin: 20px;">
                    <div class="card-header"><a href="ViewCart">Your Cart</a></div>
                    <div class="card-body">
                        <a href="ViewCart">
                            <img src="https://cdn.iconscout.com/icon/free/png-256/shopping-cart-56-518164.png" alt="ViewCart"
                                 style="width: 15rem; height: 15rem; margin-left: 24px; border-radius: 64px;">
                        </a>
                        <ul>
                            <li>Review your shopping cart</li>
                            <li>Update, remove your items</li>
                        </ul>
                        <a href="ViewCart" class="btn btn-primary btn-lg btn-block">
                            View Shopping Cart
                        </a>
                    </div>
                </div>
                <div class="card border-primary" style="min-width: 20rem; max-width: 20rem; margin: 20px;">
                    <div class="card-header"><a href="Setting_Theme">Theme</a></div>
                    <div class="card-body">
                        <a href="Setting_Theme">
                            <img src="http://www.windowspcdownload.com/wp-content/uploads/2017/03/1488424786-pdvKiTw68U4tabG1WyuTJ3Z2nhxICpF1DthbIo7JDzHXkjzgoiyfoSaaAnXvjs3k4wp5w300.png" alt="OrderHistory"
                                 style="width: 15rem; height: 15rem; margin-left: 24px;">
                        </a>
                        <ul>
                            <li>Change the looks for your styles</li>
                            <li>Saved locally on your computer</li>
                        </ul>
                        <a href="Setting_Theme" class="btn btn-primary btn-lg btn-block">
                            Change Theme
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
