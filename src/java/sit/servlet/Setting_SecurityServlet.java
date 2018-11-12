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
import sit.javaModel.TimeAgo;
import sit.model.AccountHistory;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class Setting_SecurityServlet extends HttpServlet {
    @PersistenceUnit(unitName = "ECommerce_WebPU")
    EntityManagerFactory emf;
    @Resource
    UserTransaction utx;
    
    private final int RESULT_PER_PAGE = 40;
    
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
            throws ServletException, IOException {
        String page_temp = request.getParameter("page");
        int page; //Default
        HttpSession session = request.getSession(false);
        AccountHistoryJpaController ahisCtrl = new AccountHistoryJpaController(utx, emf);
        TimeAgo timeAgo = new TimeAgo();
        
        if (session != null) {
            try {
                page = Integer.valueOf(page_temp);
            } catch (NumberFormatException nfe) {
                page = 1;
            }
            //Page can't be equals to or lower than zero
            if (page <= 0) {
                page = 1;
            }
            Users user = (Users)session.getAttribute("user");
            List<AccountHistory> hisList = ahisCtrl.findAccountUserid(user);
            List<AccountHistory> hisAdd = new ArrayList<>();
            boolean isEndOfPage = ((RESULT_PER_PAGE * page) >= hisList.size());
            boolean isStartOfPage = (page == 1);
            for (int i = (RESULT_PER_PAGE * (page - 1) + 1) - 1; i < (isEndOfPage ? hisList.size() : (RESULT_PER_PAGE * page)); i++) {
                hisList.get(i).setHistoryInfo2(timeAgo.compareToDuration(hisList.get(i).getHistoryDate(), new Date()));
                hisAdd.add(hisList.get(i));
            }
            
            request.setAttribute("currentFirstEntry", RESULT_PER_PAGE * (page - 1) + 1);
            request.setAttribute("currentEndEntry", isEndOfPage ? hisList.size() : (RESULT_PER_PAGE * page));
            request.setAttribute("isEndOfPage", isEndOfPage);
            request.setAttribute("isStartOfPage", isStartOfPage);
            request.setAttribute("historyList", hisAdd);
            request.setAttribute("resultPerPage", RESULT_PER_PAGE);
        }
        
        getServletContext().getRequestDispatcher("/Setting_Security.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
