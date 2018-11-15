<%-- 
    Document   : Search
    Created on : Nov 9, 2018, 6:38:37 PM
    Author     : Firsty
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="container">
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
                    <c:if test="${requestScope.productAddedStatus == 'added'}">
                        <div class="alert alert-dismissible alert-success">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <c:set var="total" value="${0}" />
                            <c:set var="itemsCount" value="${0}" />
                            <c:forEach items="${sessionScope.cartProductList}" var="list">
                                <c:set var="total" value="${total + (list.productPrice * list.productStock)}" />
                                <c:set var="itemsCount" value="${itemsCount + list.productStock}" />
                            </c:forEach>
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
                    <c:if test="${requestScope.productAddedStatus == 'soldout'}">
                        <div class="alert alert-dismissible alert-danger">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            Sorry, but that item is out of stock.
                        </div>
                    </c:if>
                    <h1>Search Products</h1>
                    <hr>
                    <div class="row">
                        <c:forEach items="${requestScope.productList}" var="list" varStatus="vs">
                            <div class="col-lg-4">
                                <div class="bs-component">
                                    <div class="card border-info mb-3" style="max-width: 20rem;">
                                        <a href="ViewProduct?productId=${list.productId}&searchQuery=${requestScope.searchQuery}&category=${requestScope.category}&priceMin=${requestScope.priceMin}&priceMax=${requestScope.priceMax}">
                                            <img style="height: 250px; width: 100%; display: block;" src="${list.productImage}" alt="Image unavailable">
                                        </a>
                                        <div class="card-body">
                                            <hr>
                                            <h4 class="card-title">${list.productName}</h4>
                                            <div class="d-flex justify-content-between">
                                                <p class="card-text text-success">
                                                    <fmt:setLocale value="th_th"/>
                                                    <fmt:formatNumber value="${list.productPrice}" type="currency"/>
                                                </p>
                                                <a href="ViewProduct?productId=${list.productId}&searchQuery=${requestScope.searchQuery}&category=${requestScope.category}&priceMin=${requestScope.priceMin}&priceMax=${requestScope.priceMax}">
                                                    <button type="button" class="btn btn-primary">Detail</button>
                                                </a>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <p class="${list.productStock > 0 ? 'text-primary' : 'text-warning'}">${list.productStock > 0 ? 'In stock' : 'Sold out'}</p>
                                                <small class="card-text">${list.productCategory}</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div> 
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
