<%-- 
    Document   : Setting_OrderHistory
    Created on : Nov 20, 2018, 8:03:50 AM
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
        <title>Order History | Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
    </head>
    <body>
        <fmt:setLocale value="th_th"/>
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
                    <h1>Order History</h1>
                    <hr>
                    <c:choose>
                        <c:when test="${!empty requestScope.orderList}">
                            <label>Recent orders are sorted by date descending.</label>
                            <br>
                            <table class="table table-hover" style="border-style: solid;">
                                <thead>
                                    <tr>
                                        <th>Order Id</th>
                                        <th>Customer</th>
                                        <th>DATE</th>
                                        <th>STATUS</th>
                                        <th>TOTAL</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <c:forEach items="${requestScope.orderList}" var="list" varStatus="vs">
                                    <tr class="table-${vs.count mod 2 == 1 ? '' : 'light'}">
                                        <th>
                                            <a href="Setting_OrderDetail?orderNumber=${list.detailOrdernumber}">#${list.detailOrdernumber}</a>
                                        </th>
                                        <td>
                                            ${list.detailUserrealname}
                                        </td>
                                        <td>
                                            ${list.detailOrderdate}
                                        </td>
                                        <td>
                                            Awaiting Fulfillment
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${list.detailTotalprice}" type="currency"/>
                                        </td>
                                        <td>
                                            <a href="Setting_OrderDetail?orderNumber=${list.detailOrdernumber}">
                                                <button type="button" class="btn btn-primary">View</button>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <p>Entry found: ${fn:length(requestScope.orderList)}</p>
                        </c:when>
                        <c:otherwise>
                            <p>You have not placed any orders.</p>
                            <a href="HomePage"><button type="button" class="btn btn-success">Go Shopping</button></a>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
            <jsp:include page="Include/Footer.jsp" />
        </div>
    </body>
</html>
