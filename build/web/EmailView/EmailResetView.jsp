<%-- 
    Document   : EmailResetView
    Created on : Oct 11, 2018, 3:54:45 PM
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
                <p>We heard that you lost your Cart-Commerce password. Sorry about that!</p>
                <p>But don’t worry! You can use the following link to reset your password:</p>
                <div align="center" style="margin: 32px;">
                    <a href="http://localhost:8080/Web-Ecommerce/ResetPassword?a=28462b3a477aff1d0b944ffbd22&b=1" target="_blank" style="padding: 16px; background-color: #ff6600; border-radius: 8px; text-decoration: none; color: white;">
                        <b>Reset Password</b>
                    </a>
                </div>
                <p>If you don’t use this link within 3 hours, it will expire. To get a new password reset link, visit this link: 
                    <a href="http://localhost:8080/Web-Ecommerce/ResetPassword" target="_blank">Password Reset</a>
                </p>
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