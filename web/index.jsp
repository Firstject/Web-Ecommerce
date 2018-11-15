<%-- 
    Document   : index
    Created on : Oct 13, 2018, 11:32:28 PM
    Author     : Firsty
--%>

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
                <br>
                <br>
                <br>
            </div>
        </div>
    </div>
</body>
</html>