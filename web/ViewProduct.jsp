<%-- 
    Document   : ViewProduct
    Created on : Nov 14, 2018, 9:55:11 AM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                            <div class="form-group">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="excludeOutOfStock" id="customCheck1" checked="">
                                    <label class="custom-control-label" for="customCheck1">Exclude Out-of-Stock Items</label>
                                </div>
                            </div>
                            <button class="btn btn-secondary btn-sm" type="submit">Search <i class="fas fa-search"></i> </button>
                        </fieldset>
                    </form>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
                <div class="col-lg-10">
                    <div class="bs-component">
                        <c:choose>
                            <c:when test="${!empty product}">
                                <c:if test="${requestScope.productAddedStatus == 'added'}">
                                    <div class="alert alert-dismissible alert-success">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        Added ${product.productName}(<strong>${requestScope.productAddedAmount}</strong>) items to cart successfully! You can continue shopping or <a href="ViewCart" class="alert-link">Check out your item</a> now.
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
                                            <div class="form-group form-inline">
                                                Qty:
                                                <select class="form-control" name="category">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                    <option>6</option>
                                                    <option>7</option>
                                                    <option>8</option>
                                                    <option>9</option>
                                                    <option>10</option>
                                                    <option>11</option>
                                                    <option>12</option>
                                                    <option>13</option>
                                                    <option>14</option>
                                                    <option>15</option>
                                                    <option>16</option>
                                                    <option>17</option>
                                                    <option>18</option>
                                                    <option>19</option>
                                                    <option>20</option>
                                                    <option>21</option>
                                                    <option>22</option>
                                                    <option>23</option>
                                                    <option>24</option>
                                                    <option>25</option>
                                                    <option>26</option>
                                                    <option>27</option>
                                                    <option>28</option>
                                                    <option>29</option>
                                                    <option>30</option>
                                                </select>
                                            </div>
                                            <input type="hidden" name="productId" value="${requestScope.product.productId}">
                                            <button type="submit" class="btn btn-warning btn-lg">Add to Cart</button>
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
        </div>
    </body>
</html>
