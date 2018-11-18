<%-- 
    Document   : ViewProduct
    Created on : Nov 14, 2018, 9:55:11 AM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.title} | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <br>
        <div class="container" style="margin-bottom: 100px">
            <div class="row">
                <div class="col-lg-2">
                    <h3>Advanced Search</h3>
                    <hr>
                    <form action="Search" method="get">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-form-label col-form-label-sm">Keyword</label>
                                <input class="form-control form-control-sm mr-sm-2" type="text" name="searchQuery" placeholder="Product Keywords">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label col-form-label-sm">Category</label>
                                <div class="form-group">
                                    <select class="form-control form-control-sm mr-sm-2" name="category">
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
                            </div>
                            <label class="col-form-label">Price range</label>
                            <div class="form-group">
                                <label class="col-form-label col-form-label-sm"><em class="text-muted ">Can be blank</em></label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text form-control-sm">$</span>
                                    </div>
                                    <input type="text" name="priceMin" value="${requestScope.priceMin}" class="form-control form-control-sm" placeholder="Minimum" aria-label="Amount (to the nearest dollar)">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text form-control-sm">$</span>
                                    </div>
                                    <input type="text" name="priceMax" value="${requestScope.priceMax}" class="form-control form-control-sm" placeholder="Maximum" aria-label="Amount (to the nearest dollar)">
                                </div>
                            </div>
                            <!--UNUSED EXCLUDE-->
                            <!--<div class="form-group">-->
                            <!--<div class="custom-control custom-checkbox">-->
                            <!--<input type="checkbox" class="custom-control-input" name="excludeOutOfStock" id="customCheck1" checked="">-->
                            <!--<label class="custom-control-label" for="customCheck1">Exclude Out-of-Stock Items</label>-->
                            <!--</div>-->
                            <!--</div>-->
                            <button class="btn btn-secondary btn-sm" type="submit">Search <i class="fas fa-search"></i> </button>
                        </fieldset>
                    </form>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
                <div class="col-lg-10">
                    <c:set var="total" value="${0}" />
                    <c:set var="itemsCount" value="${0}" />
                    <c:forEach items="${sessionScope.cartProductList}" var="list">
                        <c:set var="total" value="${total + (list.productPrice * list.productStock)}" />
                        <c:set var="itemsCount" value="${itemsCount + list.productStock}" />
                    </c:forEach>
                    <div class="bs-component">
                        <c:choose>
                            <c:when test="${!empty product}">
                                <c:if test="${requestScope.productAddedStatus == 'PRODUCT_ADDED_SUCCESS'}">
                                    <div class="alert alert-dismissible alert-success">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="bs-component">
                                                    <i class="fas fa-check" style="font-size: 24px; margin-top: 0px; margin-bottom: -8px;"></i>
                                                    <strong>Added ${requestScope.productAddedAmount} item(s) to Cart.</strong>
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="bs-component">
                                                    <strong>Cart subtotal</strong> ${itemsCount} item(s): <br>
                                                    <fmt:setLocale value="th_th"/>
                                                    <small><fmt:formatNumber value="${total}" type="currency"/></small>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="bs-component">
                                                    <div>
                                                        <a href="ViewCart"><button type="button" class="btn btn-secondary"><i class="fas fa-shopping-cart"></i> Cart</button></a>&nbsp;&nbsp;
                                                        <a href="CheckOut"><button type="button" class="btn btn-warning"><i class="fa fa-check-square-o"></i> Proceed to check out (${itemsCount} items)</button></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>     
                                <c:if test="${requestScope.productAddedStatus == 'PRODUCT_ADDED_OUT_OF_STOCK'}">
                                    <div class="alert alert-dismissible alert-danger">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        Sorry, but that item is out of stock.
                                    </div>
                                </c:if>     
                                <c:if test="${requestScope.productAddedStatus == 'PRODUCT_ADDED_FULL'}">
                                    <div class="alert alert-dismissible alert-danger">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        Your cart cannot exceed 100 items. Please remove an item from <a href="ViewCart" target="_blank">your Cart</a> and <a href="ViewProduct">try again.</a>
                                    </div>
                                </c:if>     
                                <h1>${product.productName}</h1>
                                <hr>
                                <div class="d-flex w-100 justify-content-between">
                                    <div>
                                        <a href="${product.productImage}" target="_blank">
                                            <img src="${product.productImage}" style="width: 400px; height: 90%;" alt="No Image" />
                                        </a>
                                    </div>
                                    <div style="margin-left: 200px;">
                                        <small><u class="mb-3">Product information</u></small>
                                        <h2 class="mr-5">${product.productName}</h2>
                                        <hr>
                                        ${product.productDesc}
                                        <hr>
                                        <h4>
                                            Price: 
                                            <b class="text-primary">
                                                <fmt:setLocale value="th_th"/>
                                                <fmt:formatNumber value="${product.productPrice}" type="currency"/>
                                            </b>
                                        </h4>
                                        <p class="${product.productStock > 0 ? 'text-primary' : 'text-warning'}">${product.productStock > 0 ? 'In stock' : 'Sold out'}</p>
                                        Category: <small class="card-text">${product.productCategory}</small><br>
                                        Location: <small class="card-text">${product.productLocation}</small>
                                        <form action="ViewProduct" method="post">
                                            <input type="hidden" name="productId" value="${requestScope.product.productId}">
                                            <div class="form-group form-inline">
                                                Qty:&nbsp;
                                                <select class="form-control" name="quantity">
                                                    <c:forEach begin="1" end="100" step="1" varStatus="vs">
                                                        <option>${vs.count}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-warning btn-lg">
                                                <i class="fa fa-cart-arrow-down"></i> Add to Cart
                                            </button>

                                        </form>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="alert alert-dismissible alert-danger">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    We could not retrieve any product at this moment. Please try again later.
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <jsp:include page="Include/Footer.jsp" />
        </div>
    </body>
</html>
