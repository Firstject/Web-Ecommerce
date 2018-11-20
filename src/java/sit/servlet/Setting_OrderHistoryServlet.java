/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import sit.controller.OrderDetailsJpaController;
import sit.model.OrderDetails;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class Setting_OrderHistoryServlet extends HttpServlet {
    
    @PersistenceUnit(unitName = "ECommerce_WebPU")
    EntityManagerFactory emf;
    @Resource
    UserTransaction utx;
    
    private List<OrderDetails> orderlist;
    
    private HttpServletRequest request;
    private HttpServletResponse response;
    private OrderDetailsJpaController orderDetailsCtrl;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.request = request;
        this.response = response;
        this.orderDetailsCtrl = new OrderDetailsJpaController(utx, emf);
        
        sendOrderDetailsRemoveDublicates();
        
        getServletContext().getRequestDispatcher("/Setting_OrderHistory.jsp").forward(this.request, this.response);
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

    private void sendOrderDetailsRemoveDublicates() {
        this.orderlist = orderDetailsCtrl.findOrderDetailsByUserID((Users) request.getSession(false).getAttribute("user"));
        
        //Remove dublicates
        int detailId = 0;
        List<OrderDetails> orderlist_add = new ArrayList<>();
        for (OrderDetails od : orderlist) {
            if (od.getDetailOrdernumber() != detailId) {
                detailId = od.getDetailOrdernumber();
                orderlist_add.add(od);
            }
        }
        
        this.request.setAttribute("orderList", orderlist_add);
    }

}
