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
                            </div>
                            <label class="col-form-label">Price range</label>
                            <div class="form-group">
                                <label class="col-form-label col-form-label-sm"><em class="text-muted ">Can be blank</em></label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text form-control-sm">$</span>
                                    </div>
                                    <input type="text" name="priceMin" class="form-control form-control-sm" placeholder="Minimum" aria-label="Amount (to the nearest dollar)">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text form-control-sm">$</span>
                                    </div>
                                    <input type="text" name="priceMax" class="form-control form-control-sm" placeholder="Maximum" aria-label="Amount (to the nearest dollar)">
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
                    <h1>Search Products</h1>
                    <hr>
                    <div class="row">
                        <c:forEach items="${requestScope.productList}" var="list" varStatus="vs">
                            <div class="col-lg-4">
                                <div class="bs-component">
                                    <div class="card border-info mb-3" style="max-width: 20rem;">
                                        <a href="ViewProduct?productId=${list.productId}">
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
                                                <a href="ViewProduct?productId=${list.productId}">
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
