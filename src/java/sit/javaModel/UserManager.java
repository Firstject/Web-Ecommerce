/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.javaModel;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.http.HttpServlet;
import javax.transaction.UserTransaction;
import sit.controller.UsersJpaController;
import sit.model.Users;

/**
 *
 * @author Firsty
 */


public class UserManager extends HttpServlet{   
    //Regis
    public static final String USER_EMPTY         = "USER_EMPTY";
    public static final String USER_TOOSHORT      = "USER_TOOSHORT";
    public static final String USER_TOOLONG       = "USER_TOOLONG";
    public static final String USER_HASWHITESPACE = "USER_HASWHITESPACE";
    public static final String USER_EXISTS        = "USER_EXISTS";
    public static final String EMAIL_EMPTY        = "EMAIL_EMPTY";
    public static final String EMAIL_EXISTS       = "EMAIL_EXISTS";
    public static final String PASSWORD_EMPTY     = "PASSWORD_EMPTY";
    public static final String PASSWORD_TOOLONG   = "PASSWORD_TOOLONG";
    public static final String PASSWORD_TOOSHORT  = "PASSWORD_TOOSHORT";
    public static final String PASSWORD_NOTMATCH  = "PASSWORD_NOTMATCH";
    //Reset Password
    public static final String RESETCODE_INVALID  = "RESETCODE_INVALID";
    public static final String RESETCODE_EXPIRED  = "RESETCODE_EXPIRED";
    
    private Users secondUserToCheck;
    
    public UserManager() {
    }
    
    public UserManager(Users user) {
        this.secondUserToCheck = user;
    }
    
    public Users getSecondUserToCheck() {
        return secondUserToCheck;
    }

    public void setSecondUserToCheck(Users secondUserToCheck) {
        this.secondUserToCheck = secondUserToCheck;
    }
    
    public String GetErrorCodeDescription(String errCode) {
        String errDesc = "Description Unavailable";
        switch (errCode) {
            case USER_EMPTY         : return "Username can't be empty.";
            case USER_TOOSHORT      : return "Username is too short.";
            case USER_TOOLONG       : return "Username is too long.";
            case USER_HASWHITESPACE : return "Username can't contain whitespace.";
            case USER_EXISTS        : return "Username already exists.";
            case EMAIL_EMPTY        : return "Email can't be empty.";
            case EMAIL_EXISTS       : return "Email already exists.";
            case PASSWORD_EMPTY     : return "Password can't be empty.";
            case PASSWORD_TOOSHORT  : return "Password is too short.";
            case PASSWORD_TOOLONG   : return "Password is too long.";
            case PASSWORD_NOTMATCH  : return "Password does not match.";
            case RESETCODE_EXPIRED  : return "It looks like your link has been expired. Please try again.";
            case RESETCODE_INVALID  : return "It looks like you clicked on an invalid password reset link. Please try again.";
        }
        return errDesc;
    }
    
    public String RegisterCheck(String user, String email, String pass1, String pass2) {
        if (user == null || user.length() == 0) {
            return USER_EMPTY;
        }
        if (user.length() < 4) {
            return USER_TOOSHORT; 
        }
        if (user.length() > 16) {
            return USER_TOOLONG;
        }
        for (int i = 0; i < user.length(); i++) {
            if (Character.isWhitespace(user.charAt(i))) {
                return USER_HASWHITESPACE;
            }
        }
        if (email == null) {
            return EMAIL_EMPTY;
        }
        if (secondUserToCheck != null) {
            if (secondUserToCheck.getUsername().equalsIgnoreCase(user)) {
                return USER_EXISTS;
            }
            if (secondUserToCheck.getEmail().equalsIgnoreCase(email)) {
                return EMAIL_EXISTS;
            }
        }
        if (pass1 == null || pass2 == null) {
            return PASSWORD_EMPTY;
        }
        if (pass1.length() < 7 || pass2.length() < 7) {
            return PASSWORD_TOOSHORT;
        }
        if (pass1.length() > 64) {
            return PASSWORD_TOOLONG;
        }
        if (!pass1.equals(pass2)) {
            return PASSWORD_NOTMATCH;
        }
        
        return ""; //Return if no error
    }
    
    public String checkPasswordResetCode(Users user, String resetCode) {
        //Check if reset code is valid (Equals to code's info from database)
        if (user.getResetpassCode() != null) {
            //Check if reset password code matches.
            if (!user.getResetpassCode().equals(resetCode)) {
                return RESETCODE_INVALID;
            }
            //Check if the reset password code expire or not.
            //If it's expired, password can't be reset and user will
            //have to request for a code again to reset password.
            Date date1 = new Date();
            Date date2 = user.getResetpassExpiredate();
            if (date1.getTime() > date2.getTime()) {
                //Expired
                return RESETCODE_EXPIRED;
            }
            
            return ""; //No error
        }
        
        return RESETCODE_INVALID; //Null
    }
    
    
    
    public Users LoginUser(String parameter, String password) {
        if (secondUserToCheck != null) {
            //Check for existence
            if ((isEmail(parameter) ? secondUserToCheck.getEmail() : secondUserToCheck.getUsername()).equalsIgnoreCase(parameter)) {
                //If either username or password is matched, check for password
                if (!secondUserToCheck.getPassword().equals(new MD5().cryptWithMD5(password))) {
                    return null; //Incorrect Password
                } else {
                    return secondUserToCheck; //Correct Password. Returns no error.
                }
            }
        }
        //Checked for existence and not exist!
        return null;
    }
    
    public boolean isEmail(String param){
        return param.indexOf('@')!= -1;
    }
}
