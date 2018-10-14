<%-- 
    Document   : index
    Created on : Oct 13, 2018, 11:32:28 PM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart-Commerce</title>
        <jsp:include page="Include/Head.jsp" />
        <jsp:include page="Include/Header.jsp" />
        <style>
            body, html {
                height: 100%;
            }

            .parallax {
                /* The image used */
                background-image: url('https://www.logicsolutions.com/wp-content/uploads/2015/02/eCommerce-enhancement.png');

                /* Full height */
                height: 75%; 

                /* Create the parallax scrolling effect */
                background-attachment: fixed;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <div class="parallax"></div>
        <div class="container">
            <center>
                <h1 class="display-3">One-Stop Shopping</h1>
                <p>Cart-Commerce is a marketplace where the sellers/merchants can connect their online shops.</p>
                <button type="button" class="btn btn-primary">Enter Site</button>
                <hr>
                <small>E-commerce Website Project 2018 | INT303 - Web Programming | All right NOT reserved®</small>
                <br>
                <br>
            </center>
        </div>
    </body>
</html>