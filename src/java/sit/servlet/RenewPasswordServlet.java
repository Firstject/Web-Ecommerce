/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import sit.controller.AccountHistoryJpaController;
import sit.controller.UsersJpaController;
import sit.controller.exceptions.NonexistentEntityException;
import sit.controller.exceptions.RollbackFailureException;
import sit.javaModel.UserManager;
import sit.model.AccountHistory;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class RenewPasswordServlet extends HttpServlet {
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
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String a = request.getParameter("a");
        String b = request.getParameter("b");
        UsersJpaController usersCtrl = new UsersJpaController(utx, emf);
        AccountHistoryJpaController ahisCtrl = new AccountHistoryJpaController(utx, emf);
        Users user;
        UserManager um = new UserManager();
        String errorCode = "";
        
        if (password1 != null && password2 != null) {
            //Check whether password is match
            errorCode = um.checkPassword(password1, password2);
            if (errorCode.isEmpty()) {
                /*
                No error. This time, servlet will need to make sure that 
                verification code is still valid and not expired.
                */
                if (a != null && b != null) {
                    int userId = 1;
                    try {
                        userId = Integer.valueOf(b);
                    } catch (NumberFormatException e) {
                        userId = 1;
                    }
                    user = usersCtrl.findUsers(userId);
                    errorCode = um.checkPasswordResetCode(user, a);
                    //Error is not empty (There is an error)
                    if (!errorCode.isEmpty()) {
                        request.setAttribute("errorCode", errorCode);
                        request.setAttribute("errorDesc", um.GetErrorCodeDescription(errorCode));
                        getServletContext().getRequestDispatcher("/Password_Reset.jsp").forward(request, response);
                        return;
                    }
                    //Verification code is valid. Begin update password
                    
                    //Add to history
                    AccountHistory accHistory = new AccountHistory(ahisCtrl.getAccountHistoryCount() + 1);
                    accHistory.setHistoryUserid(user);
                    accHistory.setHistoryType("user.change_password");
                    accHistory.setHistoryDate(new Date());
                    ahisCtrl.create(accHistory);
                    
                    //--Fix IllegalOrphanException--
                    List<AccountHistory> historyList = ahisCtrl.findAccountHistoryEntities();
                    List<AccountHistory> historyList_add = new ArrayList<>();
                    for (AccountHistory htr : historyList) {
                        if (Objects.equals(htr.getHistoryUserid().getUserid(), user.getUserid())) {
                            historyList_add.add(htr);
                        }
                    }
                    user.setAccountHistoryList(historyList_add);
                    //--End of Fix IllegalOrphanException--
                    
                    //Update password!
                    user = um.updatePassword(user, password1);
                    usersCtrl.edit(user);
                    
                    //If session is still on, edit it anyway
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        session.setAttribute("user", user);
                    }
                    
                    getServletContext().getRequestDispatcher("/RenewPasswordSuccess.jsp").forward(request, response);
                    return;
                }
            }
        }
        
        request.setAttribute("a", a);
        request.setAttribute("b", b);
        request.setAttribute("userToReset", usersCtrl.findUsers(Integer.valueOf(b)).getUsername());
        request.setAttribute("errorDesc", um.GetErrorCodeDescription(errorCode));
        getServletContext().getRequestDispatcher("/RenewPassword_Email.jsp").forward(request, response);
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
            Logger.getLogger(RenewPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(RenewPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RenewPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(RenewPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
