/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.ProcessBuilder.Redirect.to;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import sit.controller.OrderdetailsJpaController;
import sit.controller.OrdersJpaController;
import sit.controller.UsersJpaController;
import sit.controller.exceptions.RollbackFailureException;
import sit.javaModel.EmailMsgManager;
import sit.javaModel.MD5;
import sit.javaModel.SendMail;
import sit.model.Orderdetails;
import sit.model.Orders;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class RegisterServlet extends HttpServlet {
    
    @PersistenceUnit(unitName = "ECommerce_WebPU")
    EntityManagerFactory emf;
    @Resource
    UserTransaction utx;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    /*Error codes:
        -1  username length is too long
        1   username length is too short
        2   username contains whitespace
        3   either password 1 or 2 is null
        4   password does not matches
        5   Username already exists
        6   Email already in use
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, RollbackFailureException, Exception {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        UsersJpaController usersCtrl = new UsersJpaController(utx, emf);
        OrdersJpaController ordersCtrl = new OrdersJpaController(utx, emf);
        OrderdetailsJpaController orderdetailsCtrl = new OrderdetailsJpaController(utx, emf);
        MD5 md = new MD5();
//        -------------------------------
        String verifyCode = "";
        int userId; //Used for sending email. For easily verification pointer
        String subject = "";
        String message = "";
        EmailMsgManager emm = new EmailMsgManager();
        boolean isMailSent = false;
        
        if (username != null && email != null) {
            username = username.trim(); //Trim to remove whitespace on both left and right sides.
            email = email.trim(); //Trim to remove whitespace on both left and right sides.
            //Check length of username
            if (username.length() < 4) {
                request.setAttribute("errorCode", 1); //Username length is too short
                getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
                return;
            }
            if (username.length() > 16) {
                request.setAttribute("errorCode", -1); //Username length is too long
                getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
                return;
            }
            //Check if username contains whitespace
            boolean containsWhitespace = false;
            for (int i = 0; i < username.length() && !containsWhitespace; i++) {
                if (Character.isWhitespace(username.charAt(i))) {
                    containsWhitespace = true;
                }
            }
            if (containsWhitespace) {
                request.setAttribute("errorCode", 2); //Username contains white space
                getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
                return;
            }
            //Check if either username or email is already exists
            List<Users> usersList = usersCtrl.findUsersEntities();
            for (Users us : usersList) {
                if (us.getUsername().equals(username)) {
                    request.setAttribute("errorCode", 5); //Username already exists
                    getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
                    return;
                }
                if (us.getEmail().equals(email)) {
                    request.setAttribute("errorCode", 6); //Email already in use
                    getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
                    return;
                }
            }
            //Check if password 1 and 2 is not null
            if (password1 == null || password2 == null) {
                request.setAttribute("errorCode", 3); //Either password 1 or 2 is null
                getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
                return;
            } else {
                if (!password1.equals(password2)) {
                    request.setAttribute("errorCode", 4); //Password 1 and 2 does not matches
                    getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
                    return;
                }
            }
            
            //If everything met requirements, begin creating a user to the database
            verifyCode = md.generateVerificationCode();
            userId = usersCtrl.getUsersCount() + 1;
            
            Users user = new Users(userId);
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(md.cryptWithMD5(password1));
            user.setVerifyCode(verifyCode);
            user.setRegisterDate(new Date());
            
            //Create database
            usersCtrl.create(user);
           
            subject = "Please confirm your email address";
            message = emm.regisSuccess(username, verifyCode, userId);
            int sendResult = SendMail.send(email, subject, message); //SEND MAIL!
            if (sendResult == 0) { //IS SENDING EMAIL successful?
                isMailSent = true;
            }
            request.setAttribute("isMailSent", isMailSent);
            getServletContext().getRequestDispatcher("/RegisterSuccess.jsp").forward(request, response);
            return;
        }
        
        getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
