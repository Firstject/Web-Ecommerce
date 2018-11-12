/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.ProcessBuilder.Redirect.to;
import java.util.Date;
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
import sit.controller.exceptions.RollbackFailureException;
import sit.javaModel.EmailMsgManager;
import sit.javaModel.MD5;
import sit.javaModel.SendMail;
import sit.javaModel.UserManager;
import sit.model.Users;

/**
 *
 * @author Firsty
 *
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
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, RollbackFailureException, Exception {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        UsersJpaController usersCtrl = new UsersJpaController(utx, emf);
        MD5 md = new MD5();
//        -------------------------------
        String verifyCode = "";
        String errorCode = ""; //Init
        int userId; //Used for sending email. For easily verification pointer
        String subject = "";
        String message = "";
        EmailMsgManager emm = new EmailMsgManager();
        
        if (username != null && email != null) {
            username = username.trim(); //Trim to remove whitespace on both left and right sides.
            email = email.toLowerCase().trim(); //Trim to remove whitespace on both left and right sides.
            
            UserManager um = new UserManager();
            //SET USERNAME OR EMAIL TO CHECK FOR EXISTENCE
            um.setSecondUserToCheck(usersCtrl.findUsername(username));
            if (um.getSecondUserToCheck() == null) {
                um.setSecondUserToCheck(usersCtrl.findEmail(email));
            }
            //
            errorCode = um.RegisterCheck(username, email, password1, password2);
            //If register fails
            if(!"".equals(errorCode)) {
                request.setAttribute("usernameField", username);
                request.setAttribute("emailField", email);
                request.setAttribute("errorCode", errorCode); //Error code send to jsp view
                request.setAttribute("errorDesc", um.GetErrorCodeDescription(errorCode)); //Error Description send to jsp view
                getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
                return;
            }
            //Register process. When everything met requirements, begin creating database.
            verifyCode = md.generateVerificationCode();
            userId = usersCtrl.getUsersCount() + 1;
            
            Users user = new Users(userId);
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(md.cryptWithMD5(password1));
            user.setVerifyCode(verifyCode);
            user.setRegisterDate(new Date());
            
            /* Create database */
            usersCtrl.create(user);

            subject = "Please confirm your email address"; //Set subject name
            message = emm.regisSuccess(username, verifyCode, userId, request.getHeader("Host") + getServletContext().getContextPath(), "/AccountVerify"); //Set message as HTML content
            SendMail.send(email, subject, message); //SEND MAIL!
            
//            request.setAttribute("ActivationLink", getServletContext().getContextPath() + "/AccountVerify?a=" + verifyCode + "&b=" + userId);
            response.sendRedirect(getServletContext().getContextPath() + "/RegisterSuccess.jsp");
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
