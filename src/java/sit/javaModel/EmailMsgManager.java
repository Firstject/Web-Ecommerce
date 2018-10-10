/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.javaModel;

/**
 *
 * @author Firsty
 */
public class EmailMsgManager {
    
    private String msg;
    
    public EmailMsgManager() {
    }
    
    public String regisSuccess(String username, String verifyCode, int id) {
        msg = "<div style=\"background-color: #e7fffc; padding: 4px;\">\n" +
                "    <div style=\"max-width:600px; margin: 8px auto;\">\n" +
                "        <div style=\"background-color: white; border-radius: 8px; padding: 8px;\">\n" +
                "            <div align=\"center\"><img src=\"http://icons.iconarchive.com/icons/jozef89/services-flat/256/ecommerce-icon.png\" alt=\"Cart-Commerce\"\n" +
                "                                     style=\"height: 128px; width: 128px;\"></div>\n" +
                "            <h1 align=\"center\"><b>Cart-Commerce</b></h1>\n" +
                "            <hr>\n" +
                "            <h2 align=\"center\" style=\"padding-left: 96px; padding-right: 96px;\">\n" +
                "                <b style=\"color: green\">Welcome!</b><br> Please confirm your email for us.\n" +
                "            </h2>\n" +
                "            <br>\n" +
                "            <div id=\"content\" style=\"padding-left: 24px; padding-right: 24px;\">\n" +
                "                <p>Hello " + username + ",</p>\n" +
                "                <p>Thank you for registering at Cart-Commerce. To verify your e-mail address, please click on the button below.</p>\n" +
                "                <div align=\"center\" style=\"margin: 32px;\">\n" +
                "                    <a href=\"http://localhost:8080/Web-Ecommerce/AccountVerify?a=" + verifyCode + "&b=" + id + "\" target=\"_blank\" style=\"padding: 16px; background-color: limegreen; border-radius: 8px; text-decoration: none; color: white;\">\n" +
                "                        <b>Verify Address</b>\n" +
                "                    </a>\n" +
                "                </div>\n" +
                "                <p>Once your e-mail address is verified, you will be able to continue shopping at Cart-Commerce and entering your information on your profile.</p>\n" +
                "                <br>\n" +
                "                <p>A warm welcome,</p>\n" +
                "                <p>Cart-Commerce support team</p>\n" +
                "                <hr>\n" +
                "                <p align=\"center\"><small>You received this email because you requested to register to Cart-Commerce.<br>\n" +
                "                        If you didn't request to register, you can safely ignore this e-mail.</small></p>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</div>";
        return msg;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
