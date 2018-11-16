<%-- 
    Document   : CheckOut
    Created on : Nov 16, 2018, 11:50:33 AM
    Author     : Firsty
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="container">
            <br>
            
            <div class="row">
                <div class="col-lg-3">
                    <div class="bs-component">
                        <i class="fas fa-check-circle"></i>
                        <a href="Shopping Cart">
                            <button type="button" class="btn btn-link"><h4>Shopping Cart</h4></button>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="bs-component">
                        <div class="progress mt-3">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="bs-component">
                        <div class="progress mt-3">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 0%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="Include/Footer.jsp" />
        </div>
    </body>
</html>
