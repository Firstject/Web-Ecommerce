/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import sit.controller.UsersJpaController;
import sit.controller.exceptions.NonexistentEntityException;
import sit.controller.exceptions.RollbackFailureException;
import sit.javaModel.UserManager;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class Setting_AccountServlet extends HttpServlet {
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
        String submit = request.getParameter("submit");
        String OldPass = request.getParameter("oldpass");
        String NewPass1 = request.getParameter("newpass1");
        String NewPass2 = request.getParameter("newpass2");
        HttpSession session = request.getSession(false);
        UsersJpaController usersCtrl = new UsersJpaController(utx, emf);
        UserManager um = new UserManager();
        Users user = new Users();
        
        if (session != null) {
            if (submit != null) {
                if (OldPass != null && NewPass1 != null && NewPass2 != null) {
                    user = (Users)session.getAttribute("user");
                    um.setSecondUserToCheck(user);
                    String errorCode = um.changePassword(OldPass, NewPass1, NewPass2);
                    if ("".equals(errorCode)) {
                        usersCtrl.edit(user);
                        session.setAttribute("user", user);
                    }
                    if (errorCode.isEmpty()) {
                        request.setAttribute("isPasswordUpdated", true);
                    } else {
                        request.setAttribute("errorDesc", um.GetErrorCodeDescription(errorCode));
                    }
                }
            }
        }
        
        
        getServletContext().getRequestDispatcher("/Setting_Account.jsp").forward(request, response);
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
            Logger.getLogger(Setting_AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Setting_AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Setting_AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Setting_AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
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
