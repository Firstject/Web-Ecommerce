<%-- 
    Document   : ViewCart
    Created on : Nov 14, 2018, 9:55:38 PM
    Author     : Firsty
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                            <a href="ViewCart" class="list-group-item list-group-item-action active"><i class="fas fa-shopping-cart"></i> Shopping Cart</a>
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
                    <!--Generic error codes-->
                    <c:choose>
                        <c:when test="${requestScope.errorCode == 'SESSION_NULL_ERROR' || requestScope.errorCode == 'CART_ERROR'}">
                            <div class="alert alert-dismissible alert-danger">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <h4 class="alert-heading">We want to keep you safe!</h4>
                                <p class="mb-0">Just in case you walked away and left your browser turned on, we have expired this session.</p>
                                <b>Reason: Your session has expired due to inactivity.</b>
                            </div>
                        </c:when>
                        <c:when test="${requestScope.errorCode == 'PRODUCT_NOT_FOUND_ERROR'}">
                            <div class="alert alert-dismissible alert-warning">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <h4 class="alert-heading">Whoops, our bad...</h4>
                                <p class="mb-0">Well, this is embarrassing. We can't find the product you asked for.</p>
                                <b>Reason: The item you were trying to update has been removed from your shopping cart. You can add the item to 
                                    your cart again by using the search box at the top of the page to find the item's product detail page and clicking
                                    the Add to Cart button.</b>
                            </div>
                        </c:when>
                        <c:when test="${requestScope.errorCode == 'UPDATE_SUCCESS'}">
                            <div class="alert alert-dismissible alert-success">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <h4 class="alert-heading">Updated product successfully!</h4>
                                <p class="mb-0">${updatedProductName}'s quantity has been updated.</p>
                            </div>
                        </c:when>
                        <c:when test="${requestScope.errorCode == 'DELETE_SUCCESS'}">
                            <div class="alert alert-dismissible alert-success">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <h4 class="alert-heading">Removed product successfully!</h4>
                                <p class="mb-0">${updatedProductName} has been removed from your shopping cart.
                                    <a href="ViewProduct?productId=${updatedProductId}">
                                        <button type="button" class="btn btn-secondary">Detail</button>
                                    </a>
                                </p>
                            </div>
                        </c:when>
                        <c:when test="${requestScope.errorCode == 'DELETE_ALL_SUCCESS'}">
                            <div class="alert alert-dismissible alert-success">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <h4 class="alert-heading">We've cleaned up your shopping cart!</h4>
                                <p class="mb-0">All products has been removed from your shopping cart.</p>
                            </div>
                        </c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                    <h1>Your cart</h1>
                    <hr>
                    <label>The Cart is a temporary place to store a list of your items and reflects each item's most recent price.</label>
                    <p class="text-info">To change the quantity of a product, simply change or adjust the quantity value.<br>
                        After doing so, click on a green update cart button.</p>
                    <p class="text-danger">To remove a set of product, click "Remove".</p>
                    <c:choose>
                        <c:when test="${!empty sessionScope.cartProductList}">
                            <table class="table table-hover" style="border-style: solid;">
                                <thead>
                                <th scope="col">Item</th>
                                <th scope="col"></th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Subtotal</th>
                                <th scope="col">
                                    <form action="ViewCart" method="post">
                                        <fieldset>
                                            <input type="hidden" name="updateType" value="clear" />
                                            <button type="submit" class="btn btn-danger btn-sm">Clear all</button>
                                        </fieldset>
                                    </form>
                                </th>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.cartProductList}" var="list" varStatus="vs">
                                        <tr class="table-default">
                                            <td>
                                                <img src="${list.productImage}" alt="No image" style="width: 100px; height: 100px;"/>
                                            </td>
                                            <td>
                                                <a href="ViewProduct?productId=${list.productId}" title="${list.productName}">
                                                    <button type="button" class="btn btn-link">${fn:substring(list.productName, 0, 17)}${fn:length(list.productName) > 17 ? '...' : ''}</button>
                                                </a>
                                            </td>
                                            <td>
                                                <fmt:setLocale value="th_th"/>
                                                <strong><fmt:formatNumber value="${list.productPrice}" type="currency"/></strong>
                                            </td>
                                            <td>
                                                <strong>
                                                    <form action="ViewCart" method="post">
                                                        <fieldset>
                                                            <input type="hidden" name="updateType" value="update" />
                                                            <input type="hidden" name="productTarget" value="${list.productId}" />
                                                            <input type="number" name="productQuantity" value="${list.productStock}" min="1" max="999" class="col-lg-6"/>
                                                            <button type="submit" class="btn btn-success btn-sm">Update</button>
                                                        </fieldset>
                                                    </form>
                                                </strong>
                                            </td>
                                            <td>
                                                <strong><fmt:formatNumber value="${list.productPrice * list.productStock}" type="currency"/></strong>
                                            </td>
                                            <td>
                                                <form action="ViewCart" method="post">
                                                    <fieldset>
                                                        <input type="hidden" name="updateType" value="remove" />
                                                        <input type="hidden" name="productTarget" value="${list.productId}" />
                                                        <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                                    </fieldset>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr class="table-default">
                                        <c:set var="total" value="${0}" />
                                        <c:set var="itemsCount" value="${0}" />
                                        <c:forEach items="${sessionScope.cartProductList}" var="list">
                                            <c:set var="total" value="${total + (list.productPrice * list.productStock)}" />
                                            <c:set var="itemsCount" value="${itemsCount + list.productStock}" />
                                        </c:forEach>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            Total quantity:
                                            <b>${itemsCount}</b> item(s)
                                        </td>
                                        <td>
                                            Subtotal:
                                            <fmt:setLocale value="th_th"/>
                                            <b><fmt:formatNumber value="${total}" type="currency"/></b>
                                        </td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${empty sessionScope.cartProductList}">
                                <div class="alert alert-info">
                                    <strong>Your shopping cart is empty.</strong> You may want to check out some products.
                                </div>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    <br>
                    <a href="HomePage"><button class="btn btn-primary" float="center">Return to shopping</button></a>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
