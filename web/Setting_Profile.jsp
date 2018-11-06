<%-- 
    Document   : Setting_Profile
    Created on : Nov 5, 2018, 8:51:33 AM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Profile | Cart-Commerce</title>
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
                            <a href="Setting_Profile" class="list-group-item list-group-item-action active">Profile</a>
                            <a href="Setting_Account" class="list-group-item list-group-item-action">Account</a>
                            <a href="#" class="list-group-item list-group-item-action">Security</a>
                            <a href="#" class="list-group-item list-group-item-action">Wishlist</a>
                            <a href="#" class="list-group-item list-group-item-action">View Cart</a>
                            <a href="#" class="list-group-item list-group-item-action">Purchase History</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <form action="Setting_Profile" method="post">
                        <fieldset>
                            <c:if test="${isProfileUpdated == true}">
                                <div class="alert alert-dismissible alert-success">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    Your profile has been saved!
                                </div>
                            </c:if>
                            <h1>Profile</h1>
                            <hr>
                            <input type="hidden" value="" name="submit" />
                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly="" class="form-control-plaintext" id="staticEmail" value="${sessionScope.user.email}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>First Name</label>
                                    <input type="text" name="fname" class="form-control" id="exampleInputUser" value="${sessionScope.user.fname}">
                                </div>
                                <div class="col-lg-5">
                                    <label>Last Name</label>
                                    <input type="text" name="lname" class="form-control" id="exampleInputUser" value="${sessionScope.user.lname}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>City</label>
                                    <input type="text" name="city" class="form-control" id="exampleInputUser" value="${sessionScope.user.city}">
                                </div>
                                <div class="col-lg-5">
                                    <label>State</label>
                                    <input type="text" name="state" class="form-control" id="exampleInputUser" value="${sessionScope.user.userState}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>Address</label>
                                    <input type="text" name="address" class="form-control" id="exampleInputUser" value="${sessionScope.user.address}">
                                </div>
                                <div class="col-lg-5">
                                    <label>Country</label>
                                    <input type="text" name="country" class="form-control" id="exampleInputUser" value="${sessionScope.user.country}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-5">
                                    <label>Zip Code</label>
                                    <input type="text" name="zipcode" class="form-control" id="exampleInputUser" value="${sessionScope.user.zipCode}">
                                </div>
                                <div class="col-lg-5">
                                    <label>Phone Number</label>
                                    <input type="text" name="phonenumber" class="form-control" id="exampleInputUser" value="${sessionScope.user.phoneNumber}">
                                </div>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-success">Update Profile</button>
                        </fieldset>
                    </form>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
