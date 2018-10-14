/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
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
import sit.controller.UsersJpaController;
import sit.controller.exceptions.NonexistentEntityException;
import sit.controller.exceptions.RollbackFailureException;
import sit.javaModel.EmailMsgManager;
import sit.javaModel.MD5;
import sit.javaModel.SendMail;
import sit.javaModel.UserManager;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class ResetPasswordServlet extends HttpServlet {
    
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NonexistentEntityException, RollbackFailureException, Exception {
        /*
            This page is used in both receiving password reset code and send reset email, which is divided into 2 parts:
            Part 1: Receives password reset code and redirects user to password renew page.
            Part 2: Send password reset code.
        */
        
        /* PART 1*/
        String a = request.getParameter("a");
        String b = request.getParameter("b");
        /* PART 2*/
        String email = request.getParameter("parameter"); //This can be either username or email. But we have to check it.
        /* END */
        String subject, message, resetCode, username;
        UsersJpaController usersCtrl = new UsersJpaController(utx, emf);
        Users user;
        List<Users> usersList;
        EmailMsgManager emm = new EmailMsgManager();
        UserManager usermanager = new UserManager();
        MD5 md = new MD5();
        
        /* Check for part 1 : Receiving password reset code*/
        if (a != null && b != null) {
            int userId = Integer.parseInt(b);
            String errorCode; //Checks whether its valid.
            errorCode = usermanager.checkPasswordResetCode(usersCtrl.findUsers(userId), a);
            if (!errorCode.isEmpty()) {
                request.setAttribute("errorCode", errorCode);
                request.setAttribute("errorDesc", usermanager.GetErrorCodeDescription(errorCode));
                getServletContext().getRequestDispatcher("/Password_Reset.jsp").forward(request, response);
                return;
            }
            //Valid
            System.out.println("errorCode: " + errorCode);
        }
        
        /* Check for part 2 : Receiving email*/
        if (email != null) {
            usersList = usersCtrl.findUsersEntities();
            for (Users us : usersList) {
                if (us.getEmail().equals(email)) {
                    username = us.getUsername();
                    resetCode = md.generateVerificationCode();
                    
                    //Modify Database; Set reset password code and set time
                    user = us;
                    Calendar cal = Calendar.getInstance();
                    cal.add(Calendar.HOUR, 3);
                    user.setResetpassExpiredate(cal.getTime()); //Set expire timer to 3 hours ahead.
                    user.setResetpassCode(resetCode); //Set reset code.
                    usersCtrl.edit(user);
                    
                    subject = "Reset Password"; //Set subject name
                    message = emm.resetPassword(username, resetCode, us.getUserid()); //Set message as HTML content
                    SendMail.send(us.getEmail(), subject, message); //SEND MAIL!

                    getServletContext().getRequestDispatcher("/ResetPasswordCodeSent.jsp").forward(request, response);
                    return;
                }
            }
            //If the code pass through here, then username or email is not exist.
            
            request.setAttribute("errorDesc", "Can't find that email, sorry..");
            
        }
        getServletContext().getRequestDispatcher("/Password_Reset.jsp").forward(request, response);
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
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
