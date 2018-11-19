<%-- 
    Document   : CheckOutSuccess
    Created on : Nov 18, 2018, 10:22:57 PM
    Author     : Firsty
--%>

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
                            <a href="CheckOut"><h3 class="text-success"><i class="fa fa-check-circle"></i> Check Out</h3></a>
                            <h3><i class="fa fa-chevron-right"></i></h3>
                            <h3><i class="material-icons">filter_3</i> Finish</h3>
                        </div>
                        <div class="progress ml-3 mr-3">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 100%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="text-center">
                <h1>Thank you for your purchase!</h1>
                <h4>Your order number is: ${requestScope.orderNumber}</h4>
                <p>Your order has been placed and has been successfully processed!</p>
                <p>You can view your order history by going to your account page and by clicking on the <a href="Setting_Profile">History</a></p>
                <br>
                <a href="HomePage"><button class="btn btn-primary" float="center">Return to shopping</button></a>
            </div>
            <jsp:include page="Include/Footer.jsp" />
        </div>
    </body>
</html>
