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
import sit.controller.exceptions.RollbackFailureException;
import sit.javaModel.UserManager;
import sit.model.AccountHistory;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class LoginServlet extends HttpServlet {
    
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
        String parameter = request.getParameter("parameter");
        String password = request.getParameter("password");
        String returnUrl = request.getParameter("returnUrl");
        /* -------------------------- */
        HttpSession session = request.getSession(false);
        UsersJpaController usersCtrl = new UsersJpaController(utx, emf);
        AccountHistoryJpaController ahisCtrl = new AccountHistoryJpaController(utx, emf);
        
        if (parameter != null && password != null) {
            UserManager um = new UserManager();
            //Checks whether parameter is either username or email
            if (um.isEmail(parameter)) {
                um.setSecondUserToCheck(usersCtrl.findEmail(parameter));
            } else {
                um.setSecondUserToCheck(usersCtrl.findUsername(parameter));
            }
            String errorCode = um.LoginUser(parameter, password);
            if (!errorCode.isEmpty()) { //Unauthenticated
                request.setAttribute("isAuthenticated", false);
                request.setAttribute("parameter", parameter);
                //If username is found in database, then create a log 'USER LOGIN FAIL' to notify that user.
                if (um.getSecondUserToCheck() != null) {
                    AccountHistory accHistory = new AccountHistory(ahisCtrl.getAccountHistoryCount() + 1);
                    accHistory.setHistoryUserid(um.getSecondUserToCheck());
                    accHistory.setHistoryType("user.failed_login");
                    accHistory.setHistoryDate(new Date());
                    ahisCtrl.create(accHistory);
                }
            } else { //Authenticated
                AccountHistory accHistory = new AccountHistory(ahisCtrl.getAccountHistoryCount() + 1);
                accHistory.setHistoryUserid(um.getSecondUserToCheck());
                accHistory.setHistoryType("user.login");
                accHistory.setHistoryDate(new Date());
                ahisCtrl.create(accHistory);
                
                //--Fix IllegalOrphanException--
                List<AccountHistory> historyList = ahisCtrl.findAccountHistoryEntities();
                List<AccountHistory> historyList_add = new ArrayList<>();
                for (AccountHistory htr : historyList) {
                    if (Objects.equals(htr.getHistoryUserid().getUserid(), um.getSecondUserToCheck().getUserid())) {
                        historyList_add.add(htr);
                    }
                }
                um.getSecondUserToCheck().setAccountHistoryList(historyList_add);
                usersCtrl.edit(um.getSecondUserToCheck());
                //--End of Fix IllegalOrphanException--
                
                session.setAttribute("user", um.getSecondUserToCheck());
                if (returnUrl != null) {
                    response.sendRedirect(returnUrl); return;
                } else {
                    response.sendRedirect(returnUrl); return;
                }
            }
        }
        
        request.setAttribute("returnUrl", returnUrl);
        getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
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
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
