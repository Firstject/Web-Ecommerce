<%-- 
    Document   : CheckOut
    Created on : Nov 16, 2018, 11:50:33 AM
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
        <title>Check Out | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <c:set var="total" value="${0}" />
        <c:set var="itemsCount" value="${0}" />
        <c:forEach items="${sessionScope.cartProductList}" var="list">
            <c:set var="total" value="${total + (list.productPrice * list.productStock)}" />
            <c:set var="itemsCount" value="${itemsCount + list.productStock}" />
        </c:forEach>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <h1><i class="fa fa-check-square-o"></i> Check out</h1>
                </div>
                <div class="col-lg-9 card border-secondary" style="padding: 0px;">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <a href="ViewCart"><h3 class="text-success"><i class="fa fa-check-circle"></i></i> Shopping Cart</h3></a>
                            <p>a</p>
                            <h3><i class="material-icons">filter_2</i> Check Out</h3>
                            <p>a</p>
                            <h3 class="text-muted"><i class="material-icons">filter_3</i> Finish</h3>
                        </div>
                        <div class="progress ml-3 mr-3">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 48%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-lg-7" style="padding-right: 128px;">
                    <form action="CheckOut" method="post">
                        <fieldset>
                            <legend>Billing details</legend>
                            <div class="form-group">
                                <label>First & last name</label>
                                <input type="text" class="form-control" value="${sessionScope.user.fname} ${sessionScope.user.lname}" placeholder="Enter your name">
                            </div>
                            <div class="form-group">
                                <label for="exampleTextarea">Address</label>
                                <textarea class="form-control" id="exampleTextarea" rows="3">${sessionScope.user.city} ${sessionScope.user.address} ${sessionScope.user.country} ${sessionScope.user.zipCode}</textarea>
                            </div>
                            <legend>Payment Method</legend>
                            
                        </fieldset>
                    </form>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
                <div class="col-lg-5">
                    <div class="bs-component">
                        <div class="card mb-3">
                            <fmt:setLocale value="th_th"/>
                            <div class="card-body form-inline">
                                <h5 class="card-title"><i class="fas fa-shopping-cart"></i> Cart Summary</h5> &nbsp;[<a href="ViewCart">edit</a>]
                            </div>
                            <c:forEach items="${sessionScope.cartProductList}" var="list" varStatus="vs">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <strong class="card-subtitle">${list.productStock} x ${fn:substring(list.productName, 0, 21)}${fn:length(list.productName) > 21 ? '...' : ''}</strong>
                                        <strong><fmt:formatNumber value="${list.productPrice * list.productStock}" type="currency"/></strong>
                                    </div>
                                    ${fn:substring(list.productDesc, 0, 40)}${fn:length(list.productDesc) > 40 ? '...' : ''}
                                </div>
                                <hr style="width: 80%; align-self: center;">
                            </c:forEach>
                            <div class="card-footer text-muted text-right">
                                Sub total: <b><fmt:formatNumber value="${total}" type="currency"/></b>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="Include/Footer.jsp" />
        </div>
    </body>
</html>
