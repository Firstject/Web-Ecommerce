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
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import sit.controller.OrderDetailsJpaController;
import sit.model.OrderDetails;
import sit.model.Products;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class Setting_OrderDetailServlet extends HttpServlet {

    @PersistenceUnit(unitName = "ECommerce_WebPU")
    EntityManagerFactory emf;
    @Resource
    UserTransaction utx;

    private String orderNumber;
    private String errorCode;
    private List<OrderDetails> orderDetailsList;

    private final String READD_SUCCESS = "READD_SUCCESS";
    private final String READD_SUCCESS_WITH_WARNING = "READD_SUCCESS_WITH_WARNING";
    private final int CART_LIMIT = 100;

    private HttpServletRequest request;
    private HttpServletResponse response;
    private OrderDetailsJpaController orderDetailsCtrl;
    private HttpSession session;
    private Users user;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.request = request;
        this.response = response;
        this.orderDetailsCtrl = new OrderDetailsJpaController(utx, emf);
        this.session = this.request.getSession(false);
        this.user = (Users) this.session.getAttribute("user");

        getOrderDetail();

        //Re_order
        String reAdd = request.getParameter("reAdd");
        String orderNumberReAdd = request.getParameter("orderNumberReAdd");
        if (reAdd != null && orderNumberReAdd != null) {
            if ("reAdd".equalsIgnoreCase(reAdd)) {
                try {
                    List<OrderDetails> odList = this.orderDetailsCtrl.findOrderDetailByOrderNumber(Integer.valueOf(orderNumberReAdd), this.user);
                    List<Products> cartProductList;

                    this.errorCode = READD_SUCCESS; //Leave this be. If this value is changed, then re-adding order is fail due to cart limit exceeded.
                    cartProductList = (List<Products>) session.getAttribute("cartProductList");
                    if (cartProductList == null) {
                        cartProductList = new ArrayList<>();
                    }
                    for (OrderDetails o : odList) {
                        o.getDetailOrderid().getOrderProductid().setProductStock((short)(int)o.getDetailOrderid().getOrderProductquantity());
                        cartProductList = addToCart_get(cartProductList, o.getDetailOrderid().getOrderProductid());
                    }
                    
                    session.setAttribute("cartProductList", cartProductList);
                    this.request.setAttribute("errorCode", this.errorCode);

                    getServletContext().getRequestDispatcher("/ViewCart.jsp").forward(this.request, this.response);
                    return;
                } catch (IOException | NumberFormatException | ServletException e) {
                    System.out.println(e);
                }
            }
        }
        

        getServletContext().getRequestDispatcher("/Setting_OrderDetail.jsp").forward(this.request, this.response);
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

    private void getOrderDetail() {
        this.orderNumber = request.getParameter("orderNumber");

        if (orderNumber != null) {
            try {
                int actual_orderNumber = Integer.valueOf(orderNumber);
                this.orderDetailsList = orderDetailsCtrl.findOrderDetailByOrderNumber(actual_orderNumber, this.user);
                if (this.orderDetailsList != null) {
                    this.request.setAttribute("orderList", this.orderDetailsList);
                    this.request.setAttribute("orderNumber", orderDetailsList.get(0).getDetailOrdernumber());
                    this.request.setAttribute("orderDate", orderDetailsList.get(0).getDetailOrderdate());
                }
            } catch (Exception e) {
            }
        }
    }
    
    private List<Products> addToCart_get(List<Products> cart, Products p) {
        //Iterating over cart and get total quantity. 
        int itemCount = 0;
        for (Products cCartItems : cart) {
            itemCount += cCartItems.getProductStock();
        }
        for (Products c : cart) {
            //If existing product is found, update quantity.
            //Otherwise, add to cart
            
            if (c.getProductId().equals(p.getProductId())) {
                //If the items exceeds limit, fill up with the remaining quantity to maximum.
                if ((itemCount + p.getProductStock()) > CART_LIMIT) {
                    this.errorCode = READD_SUCCESS_WITH_WARNING;
                    return cart;
                } else {
                    c.setProductStock((short) (c.getProductStock() + p.getProductStock()));
                }
                return cart;
            }
        }
        if (!((itemCount + p.getProductStock()) > CART_LIMIT)) {
            cart.add(p);
        } else {
            this.errorCode = READD_SUCCESS_WITH_WARNING;
        }
        return cart;
    }

}
