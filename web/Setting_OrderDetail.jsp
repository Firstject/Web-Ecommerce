<%-- 
    Document   : Setting_OrderDetail
    Created on : Nov 20, 2018, 4:07:19 PM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <fmt:setLocale value="th_th"/>
        <c:set var="itemsCount" value="${0}" />
        <c:forEach items="${requestScope.orderList}" var="list">
            <c:set var="itemsCount" value="${itemsCount + list.detailOrderid.orderProductquantity}" />
        </c:forEach>
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
                            <a href="Setting_OrderHistory" class="list-group-item list-group-item-action active"><i class="fas fa-history"></i> Order History</a>
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
                    <h1>Order Detail</h1>
                    <hr>
                    <c:choose>
                        <c:when test="${!empty requestScope.orderList}">
                            <label>Order #${orderNumber} was placed on ${orderDate} and is currently awaiting fulfillment.</label>
                            <br>
                            <label>Address: ${orderAddress}</label>
                            <br>
                            <form action="Setting_OrderDetail" method="post">
                                <fieldset>
                                    <input type="hidden" name="reAdd" value="reAdd">
                                    <input type="hidden" name="orderNumberReAdd" value="${requestScope.orderNumber}">
                                    <button class="btn btn-success" type="submit">Order Again</button><br>
                                    <small class="text-primary">*This will re-add your previous order into your cart.</small>
                                </fieldset>
                            </form>
                            <br>
                            <table class="table table-hover" style="border-style: solid;">
                                <thead>
                                    <tr>
                                        <th>Product item</th>
                                        <th></th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Sub total</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${requestScope.orderList}" var="list" varStatus="vs">
                                    <tr>
                                        <td>
                                            <img src="${list.detailOrderid.orderProductid.productImage}" alt="No image" style="width: 100px; height: 100px;"/>
                                        </td>
                                        <td>
                                            <a href="ViewProduct?productId=${list.detailOrderid.orderProductid.productId}" title="${list.detailOrderid.orderProductid.productName}">
                                                <button type="button" class="btn btn-link">${fn:substring(list.detailOrderid.orderProductid.productName, 0, 17)}${fn:length(list.detailOrderid.orderProductid.productName) > 17 ? '...' : ''}</button>
                                            </a>
                                        </td>
                                        <td>
                                            <strong><fmt:formatNumber value="${list.detailOrderid.orderProductprice}" type="currency"/></strong>
                                        </td>
                                        <td>
                                            ${list.detailOrderid.orderProductquantity}
                                        </td>
                                        <td>
                                            <strong><fmt:formatNumber value="${list.detailOrderid.orderProductprice * list.detailOrderid.orderProductquantity}" type="currency"/></strong>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr class="table-default">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        Total quantity:
                                        <b>${itemsCount}</b> item(s)
                                    </td>
                                    <td>
                                        Subtotal:
                                        <b><fmt:formatNumber value="${orderList[0].detailTotalprice}" type="currency"/></b>
                                    </td>
                                </tr>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <h4>No information available!</h4>
                            <p>Are you sure you're viewing a valid information? If not, please return to previous page to see all order history.</p>
                            <a href="Setting_OrderHistory"><button type="button" class="btn btn-primary">Return</button></a>
                            -or-
                            <a href="HomePage"><button type="button" class="btn btn-success">Continue Shopping</button></a>
                        </c:otherwise>
                    </c:choose>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
            <jsp:include page="Include/Footer.jsp" />
        </div>
    </body>
</html>
