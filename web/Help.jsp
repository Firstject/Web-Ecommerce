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
                    <div class="card-header bg-primary"><a href="ViewCart" class="text-white"><strong>Getting Started</strong></a></div>
                    <div class="card-body">
                        <a href="ViewCart">
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
                            <img src="http://www.jmkxyy.com/food-order-icon/food-order-icon-1.jpg" alt="OrderHistory"
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
                            <img src="https://png2.kisspng.com/20180329/bhq/kisspng-antivirus-software-computer-software-malware-compu-security-5abd2f21d31a19.8502801115223478098647.png" alt="OrderHistory"
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
                            <img src="data:image/png;base64,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" alt="AccountSecuritySetting"
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
