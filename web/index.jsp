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
                                    <img src="https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/0/0/000267831_fenix_5s_sap_frost_1.jpg" alt="No image" style="height: 320px;">
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
                                <img style="height: 250px; width: 100%; display: block;" src="https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/42-alu-space-sport-black-nc-1up_GEO_TH_LANG_TH?wid=470&hei=556&fmt=png-alpha&.v=1594318657000" alt="Image unavailable">
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
                                <img style="height: 250px; width: 100%; display: block;" src="https://notebookspec.com/nbs/upload_notebook/20171220-110713_c.jpg">
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
                                <img style="height: 250px; width: 100%; display: block;" src="https://img10.jd.co.th/n0/jfs/t31/85/91278850/190606/1ed85b34/5c590f41N05e29f5c.jpg!q70.jpg" alt="Image unavailable">
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
                                <img style="height: 250px; width: 100%; display: block;" src="https://consumer-img.huawei.com/content/dam/huawei-cbg-site/common/mkt/list-image/phones/p20/P20-listimg-black.png" alt="Image unavailable">
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
                                <img style="height: 250px; width: 100%; display: block;" src="https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/P/W/PWB000224477.jpg" alt="Image unavailable">
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
                                <img style="height: 250px; width: 100%; display: block;" src="https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000244345.jpg" alt="Image unavailable">
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
                                <img style="height: 250px; width: 100%; display: block;" src="https://www.jib.co.th/img_master/product/original/20181016175020_30469_24_1.png" alt="Image unavailable">
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
                                <img style="height: 250px; width: 100%; display: block;" src="https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/p/w/pwb000237946.jpg" alt="Image unavailable">
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
                                <img style="height: 250px; width: 100%; display: block;" src="https://consumer-img.huawei.com/content/dam/huawei-cbg-site/common/mkt/list-image/phones/nova3/nova3-listimage.png" alt="Image unavailable">
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
                                <img style="height: 250px; width: 100%; display: block;" src="https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/2/4/244156_y_1.jpg" alt="Image unavailable">
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
                                <img style="height: 250px; width: 100%; display: block;" src="https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/2/4/249825_bundle_1.jpg" alt="Image unavailable">
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
                                <img style="height: 250px; width: 100%; display: block;" src="http://cdn.shopify.com/s/files/1/0286/0456/products/travelcube.701_1200x1200.png?v=1544501653" alt="Image unavailable">
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