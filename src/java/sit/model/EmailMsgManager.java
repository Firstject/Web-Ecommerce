/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.model;

/**
 *
 * @author Firsty
 */
public class EmailMsgManager {
    
    private String msg;
    
    public EmailMsgManager() {
    }
    
    public String regisSuccess(String username) {
        msg = "Hello, " + username + "!\n\n\n"
                    + "Thank you for registering to Cart-Commerce!\n\n"
                    + "You can now use Cart-Commerce for all your purchases and get 100% guarantee.\n"
                    + "We'll instantly refund you if your order does not arrive, is damaged, or is substantially different from what was described.\n\n"
                    + "Regards,\n\n"
                    + "Cart-Commerce Support Team";
        return msg;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
