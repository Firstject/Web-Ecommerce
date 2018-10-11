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
import javax.transaction.UserTransaction;
import sit.controller.UsersJpaController;
import sit.model.Users;

/**
 *
 * @author Firsty
 */


public class UserManager {
    @PersistenceUnit(unitName = "ECommerce_WebPU")
    EntityManagerFactory emf;
    @Resource
    UserTransaction utx;
    
    public static final String USER_EMPTY = "USER_EMPTY";
    public static final String USER_TOOSHORT = "USER_TOOSHORT";
    public static final String USER_TOOLONG = "USER_TOOLONG";
    public static final String USER_HASWHITESPACE = "USER_HASWHITESPACE";
    public static final String USER_EXISTS = "USER_EXISTS";
    public static final String EMAIL_EMPTY = "EMAIL_EMPTY";
    public static final String EMAIL_EXISTS = "EMAIL_EXISTS";
    public static final String PASSWORD_EMPTY = "PASSWORD_EMPTY";
    public static final String PASSWORD_TOOLONG = "PASSWORD_TOOLONG";
    public static final String PASSWORD_TOOSHORT = "PASSWORD_TOOSHORT";
    public static final String PASSWORD_NOTMATCH = "PASSWORD_NOTMATCH";
    private List<Users> usersList;
    private UsersJpaController usersCtrl = new UsersJpaController(utx, emf);
    
    public UserManager() {}
    
    public UserManager(List<Users> usersList) {
        this.usersList = usersList;
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
        for (Users us : usersList) {
            if (us.getUsername().equals(user)) {
                return USER_EXISTS;
            }
            if (us.getEmail().equals(email)) {
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
       
}