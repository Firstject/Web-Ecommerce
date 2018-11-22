<%-- 
    Document   : OrderEmailView
    Created on : Nov 22, 2018, 2:48:45 PM
    Author     : Firsty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div style="background-color: #e7fffc; padding: 4px;">
    <div style="max-width:600px; margin: 8px auto;">
        <div style="background-color: white; border-radius: 8px; padding: 8px;">
            <div align="center"><img src="http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png" alt="Cart-Commerce"
                                     style="height: 128px; width: 128px;"></div>
            <h1 align="center"><b>Cart-Commerce</b></h1>
            <hr>
            <div id="content" style="padding-left: 24px; padding-right: 24px;">
                <p>Hello username,</p>
                <p>Thank you for your purchase! We're getting your order to be shipped. We will notify you when it has been sent.</p>
                <div align="center" style="margin: 32px;">
                    <a href="http://localhost:8080/Web-Ecommerce/Setting_OrderDetail?orderNumber=60130" target="_blank" style="padding: 16px; background-color: #3366ff; border-radius: 8px; text-decoration: none; color: white;">
                        <b>View your order</b>
                    </a>
                </div>
                <div align="center">
                    -or- <a href="http://localhost:8080/Web-Ecommerce/HomePage" target="_blank" >Continue Shopping</a>
                </div>
                <br>
                <p>Sincerely,</p>
                <p>Cart-Commerce support team</p>
                <hr>
                <p align="center"><small>You received this email because you requested to reset your password at Cart-Commerce.<br>
                        If you didn't request to reset your password, you can safely ignore this e-mail.</small></p>
            </div>
        </div>
    </div>
</div>
