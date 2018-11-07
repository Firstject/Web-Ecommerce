/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class Setting_ProfileServlet extends HttpServlet {
    
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
        String Submit = request.getParameter("submit");
        String Fname = request.getParameter("fname");
        String Lname = request.getParameter("lname");
        String City = request.getParameter("city");
        String State = request.getParameter("state");
        String Address = request.getParameter("address");
        String Country = request.getParameter("country");
        String ZipCode = request.getParameter("zipcode");
        String PhoneNumber = request.getParameter("phonenumber");
        Users user = new Users();
        UserManager um = new UserManager();
        UsersJpaController usersCtrl = new UsersJpaController(utx, emf);
        AccountHistoryJpaController ahisCtrl = new AccountHistoryJpaController(utx, emf);
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            if (Submit != null) {
                String errorCode;
                user = um.updateUserInfo((Users)session.getAttribute("user"), Fname, Lname, City, State, Address, Country, ZipCode, PhoneNumber);
                //--Fix IllegalOrphanException--
                List<AccountHistory> historyList = ahisCtrl.findAccountHistoryEntities();
                List<AccountHistory> historyList_add = new ArrayList<>();
                for (AccountHistory htr : historyList) {
                    if (Objects.equals(htr.getHistoryUserid().getUserid(), user.getUserid())) {
                        historyList_add.add(htr);
                    }
                }
                user.setAccountHistoryList(historyList_add);
                usersCtrl.edit(user);
                //--End of Fix IllegalOrphanException--
                session.setAttribute("user", user);
                request.setAttribute("isProfileUpdated", true);
            }
        }
        
        getServletContext().getRequestDispatcher("/Setting_Profile.jsp").forward(request, response);
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
            Logger.getLogger(Setting_ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Setting_ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Setting_ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Setting_ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
