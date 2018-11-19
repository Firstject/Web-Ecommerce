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
                            <a href="ViewCart"><h3 class="text-success"><i class="fa fa-check-circle"></i> Shopping Cart</h3></a>
                            <h3><i class="fa fa-chevron-right"></i></h3>
                            <h3><i class="material-icons">filter_2</i> Check Out</h3>
                            <h3 class="text-muted"><i class="fa fa-chevron-right"></i></h3>
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
                            <div class="form-group ${requestScope.errorCode == 'NAME_INVALID' ? 'has-danger' : ''}">
                                <label>First & last name</label>
                                <input type="text" name="name" class="form-control ${requestScope.errorCode == 'NAME_INVALID' ? 'is-invalid' : ''}" value="${sessionScope.user.fname} ${sessionScope.user.lname}" placeholder="Enter your name">
                                <c:if test="${requestScope.errorCode == 'NAME_INVALID'}">
                                    <div class="invalid-feedback">Make sure your name and last name is valid and try submitting again.</div>
                                </c:if>
                            </div>
                            <div class="form-group ${requestScope.errorCode == 'ADDRESS_INVALID' ? 'has-danger' : ''}">
                                <label for="exampleTextarea">Address</label>
                                <textarea class="form-control ${requestScope.errorCode == 'ADDRESS_INVALID' ? 'is-invalid' : ''}" name="address" id="exampleTextarea" rows="3">${sessionScope.user.city} ${sessionScope.user.address} ${sessionScope.user.country} ${sessionScope.user.zipCode}</textarea>
                                <c:if test="${requestScope.errorCode == 'ADDRESS_INVALID'}">
                                    <div class="invalid-feedback">You must provide us address for an ordering.</div>
                                </c:if>
                            </div>
                            <br>
                            <br>
                            <legend>Payment Method</legend>
                            <div class="form-check card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="on" checked="">
                                            Credit Card
                                        </label>
                                        <div>
                                            <i class="fab fa-cc-visa"></i>
                                            <i class="fab fa-cc-mastercard"></i>
                                            <i class="fab fa-cc-paypal"></i>
                                            <i class="fab fa-cc-jcb"></i>
                                            <i class="fab fa-cc-discover"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label>Card Number</label>
                                <input type="text" class="form-control" placeholder="1111-2222-3333-4444">
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>Exp Month</label>
                                    <select class="form-control" id="exampleSelect1">
                                        <option selected="">Month</option>
                                        <option>January</option>
                                        <option>February</option>
                                        <option>March</option>
                                        <option>April</option>
                                        <option>May</option>
                                        <option>June</option>
                                        <option>July</option>
                                        <option>August</option>
                                        <option>September</option>
                                        <option>October</option>
                                        <option>November</option>
                                        <option>December</option>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <label>Exp Year</label>
                                    <input type="text" class="form-control" id="exampleInputUser" placeholder="Year" >
                                </div>
                                <div class="col-lg-3">
                                    <label>Security Code</label>
                                    <input type="text" class="form-control" id="exampleInputUser" placeholder="1234" >
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="form-group">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="sendMail" id="customCheck1" checked="">
                                    <label class="custom-control-label" for="customCheck1">I'd like to receive payment notifications through email.</label>
                                </div>
                            </div>
                            <input type="hidden" name="submit" value="submit">
                            <button type="submit" class="btn btn-success btn-lg btn-block">Place Order</button>
                            <small>By clicking the button, you agree to the <a href="#">Term of Service</a> and <a href="#">Conditions</a></small>
                        </fieldset>
                    </form>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
                <div class="col-lg-5">
                    <div class="bs-component">
                        <div class="card mb-3 border-primary">
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
                                    <small>${fn:substring(list.productDesc, 0, 40)}${fn:length(list.productDesc) > 40 ? '...' : ''}</small>
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
