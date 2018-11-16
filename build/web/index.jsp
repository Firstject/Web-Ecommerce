<%-- 
    Document   : index
    Created on : Oct 13, 2018, 11:32:28 PM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart-Commerce</title>
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
                            <a href="Search?category=Apple" class="list-group-item list-group-item-action"><i class="fa fa-apple"></i> Apple Products</a>
                            <a href="Search?category=Smartphone" class="list-group-item list-group-item-action"><i class="fa fa-mobile-phone"></i> Smart Phones</a>
                            <a href="Search?category=Notebook" class="list-group-item list-group-item-action"><i class="fas fa-laptop"></i> Laptops</a>
                            <a href="Search?category=Tablet" class="list-group-item list-group-item-action"><i class="fas fa-tablet-alt"></i> Tablets</a>
                            <a href="Search?category=Camera" class="list-group-item list-group-item-action"><i class="fas fa-camera"></i> Cameras</a>
                            <a href="Search?category=Gadget" class="list-group-item list-group-item-action"><i class="fas fa-stopwatch"></i> Gadgets</a>
                            <a href="Search?category=Accessory" class="list-group-item list-group-item-action"><i class="fa fa-gamepad"></i> Accessories</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9" style="padding: 0px;">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="bs-component">
                                <a href="ViewProduct?productId=119">
                                    <img src="http://backoffice.bananastore.com/Warehouse/Product/Picture/753759189211-a1.jpg" alt="No image" style="height: 320px;">
                                </a>
                            </div>
                        </div> 
                        <div class="col-lg-6">
                            <div class="bs-component">
                                <h1 class="text-primary">Earth's Biggest Selection</h1>
                                <hr>
                                <h5>Garmin Smartwatch</h5>
                                <span class="badge badge-pill badge-danger">Hot Deal</span>
                                <span class="badge badge-pill badge-warning">Free Shipping</span>
                                <p>
                                    GPS smartwatch with built-in sports apps, wrist-based heart rate,
                                    Garmin Pay™ contactless payments and optional music.
                                    GPS smartwatch with built-in sports apps, wrist-based heart rate,
                                    Garmin Pay™ contactless payments and optional music.
                                </p>

                                <p class="lead">
                                    <a class="btn btn-primary btn-lg" href="ViewProduct?productId=119" role="button">Product Detail</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
            <c:if test="${!empty sessionScope.cartProductList}">
                <div class="card border-primary mb-3">
                    <c:set var="itemsCount" value="${0}" />
                    <c:forEach items="${sessionScope.cartProductList}" var="list">
                        <c:set var="itemsCount" value="${itemsCount + list.productStock}" />
                    </c:forEach>
                    <div class="card-header">Shopping Cart</div>
                    <div class="card-body">
                        <h4 class="card-title"><strong>Review</strong> your shopping cart! <span class="badge badge-warning badge-pill">${itemsCount}</span></h4>
                        <p class="card-text">The Cart is a temporary place to store a list of your items and reflects each item's most recent price.</p><hr>
                        <a href="ViewCart"><button type="button" class="btn btn-success"><i class="fas fa-shopping-cart"></i> View Cart</button></a>&nbsp;&nbsp;-or-&nbsp;&nbsp;
                        <a href="CheckOut"><button type="button" class="btn btn-warning"><i class="fa fa-check-square-o"></i> Proceed to check out (${itemsCount} items)</button></a>
                        <c:if test="${empty sessionScope.user}">
                            <small class="text-danger">*Sign-in required</small>
                        </c:if>
                    </div>
                </div>
            </c:if>
            <h1 class="text-primary">Cart-Commerce Picks</h1>
            <div class="row">
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=16">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/MQL22THA-001.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">Series 3 Watch Sport GPS</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=16">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=76">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/192158626574-01.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">MIIX 520-121KB-81CG01LWTA(W)</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=76">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=41">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/4713883669788-01.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">Swift SF714-51T-M3JU/T002</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=41">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=22">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/6901443225033-free5.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">Huawei P20</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=22">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <h1 class="text-primary">Best-Seller Gadgets</h1>
            <div class="row">
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=120">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/753759156985-001.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">CS@ Garmin Smartwatch Forerunner 235 Black Gray</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=120">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=108">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/8859221708781-001.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">Anitech Smoothie S301-BarBGon</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=108">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=105">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/8859221708521-01.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">Anitech Multi-Cooker S200</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=105">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=106">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/8859221708736-01.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">Anitech Induction S100-Red</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=106">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <h1 class="text-primary">New Products</h1>
            <div class="row">
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=24">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/6901443251674-free05.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">Huawei Nova 3</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=24">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=111">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/6958265174452-new.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">DJI Mavic 2 Zoom (EU) Dark Gray</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=111">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=122">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/818279023077-new.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">GoPro Hero7 Black</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=122">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="bs-component">
                        <div class="card border-info mb-3" style="max-width: 20rem;">
                            <a href="ViewProduct?productId=192">
                                <img style="height: 250px; width: 100%; display: block;" src="http://backoffice.bananastore.com/Warehouse/Product/Picture/847663022945-New.jpg" alt="Image unavailable">
                            </a>
                            <div class="card-body text-center">
                                <hr>
                                <h4 class="card-title">Adonit TravelCube Adapter with Wireless Charger Black (Global)</h4>
                                <div class="bs-component">
                                    <a href="ViewProduct?productId=192">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">Detail</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <br>
            <jsp:include page="Include/Footer.jsp" />
        </div>
    </body>
</html>