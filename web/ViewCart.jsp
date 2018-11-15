<%-- 
    Document   : ViewCart
    Created on : Nov 14, 2018, 9:55:38 PM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart | Cart-Commerce</title>
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
                            <a href="Setting_Profile" class="list-group-item list-group-item-action"><i class="fas fa-user"></i> Profile</a>
                            <a href="Setting_Account" class="list-group-item list-group-item-action"><i class="material-icons" style="font-size:16px">settings</i> Account</a>
                            <a href="Setting_Security" class="list-group-item list-group-item-action"><i class="material-icons" style="font-size:16px">security</i> Security</a>
                            <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-bookmark"></i> Wishlist</a>
                            <a href="ViewCart" class="list-group-item list-group-item-action active"><i class="fas fa-shopping-cart"></i> View Cart</a>
                            <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-history"></i> Purchase History</a>
                        </div>
                    </div>
                    <div class="bs-component">
                        <div class="card mb-3">
                            <h5 class="card-header text-muted">More Setting</h5>
                            <a href="Setting_Theme" class="list-group-item list-group-item-action"><i class="fas fa-paint-roller"></i> Theme</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <h1>Your cart</h1>
                    <hr>
                    
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
