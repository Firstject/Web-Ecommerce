<%-- 
    Document   : Setting_Theme
    Created on : Nov 8, 2018, 4:58:53 PM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Theme | Cart-Commerce</title>
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
                            <a href="Setting_Profile" class="list-group-item list-group-item-action">Profile</a>
                            <a href="Setting_Account" class="list-group-item list-group-item-action">Account</a>
                            <a href="Setting_Security" class="list-group-item list-group-item-action">Security</a>
                            <a href="#" class="list-group-item list-group-item-action">Wishlist</a>
                            <a href="#" class="list-group-item list-group-item-action">View Cart</a>
                            <a href="#" class="list-group-item list-group-item-action">Purchase History</a>
                        </div>
                    </div>
                    <div class="bs-component">
                        <div class="card mb-3">
                            <h5 class="card-header text-muted">More Setting</h5>
                            <a href="Setting_Theme" class="list-group-item list-group-item-action active">Theme</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <h1>Theme</h1>
                    <hr>
                    <center>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'yeti' or empty cookie.theme.value ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Yeti</b></h5>
                                                <h6 class="card-subtitle">A friendly foundation</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/yeti/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=yeti">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'cerulean' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Cerulean</b></h5>
                                                <h6 class="card-subtitle">A calm blue sky</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/cerulean/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=cerulean">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="bs-component">
                                        <div class="card mb-3 ${cookie.theme.value == 'cyborg' ? 'text-white bg-primary' : 'border-primary'}">
                                            <div class="card-body">
                                                <h5 class="card-title"><b>Cyborg</b></h5>
                                                <h6 class="card-subtitle">A calm blue sky</h6>
                                            </div>
                                            <img style="height: 150px; width: 100%; display: block;" src="https://bootswatch.com/cyborg/thumbnail.png" alt="Theme">
                                            <div class="card-body">
                                                <a href="Setting_Theme?theme=cyborg">
                                                    <button type="button" class="btn btn-primary">
                                                        Apply
                                                    </button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            </div>
                        </div>
                    </center>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
