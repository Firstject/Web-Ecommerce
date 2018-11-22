/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import sit.controller.AccountHistoryJpaController;
import sit.controller.OrderDetailsJpaController;
import sit.controller.OrdersJpaController;
import sit.controller.exceptions.RollbackFailureException;
import sit.javaModel.EmailMsgManager;
import sit.javaModel.SendMail;
import sit.model.AccountHistory;
import sit.model.OrderDetails;
import sit.model.Orders;
import sit.model.Products;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class CheckOutServlet extends HttpServlet {
    
    @PersistenceUnit(unitName = "ECommerce_WebPU")
    EntityManagerFactory emf;
    @Resource
    UserTransaction utx;
    
    private String errorCode;
    private String returnPath;
    
    private String name;
    private String address;
    private String sendEmail;
    private String submit;
    private int orderNumber;
    
    private static final String CHECKOUT_ERROR = "CHECKOUT_ERROR";
    private static final String NAME_INVALID = "NAME_INVALID"; //Name is null or invalid
    private static final String ADDRESS_INVALID = "ADDRESS_INVALID"; //Address is null or invalid
    private static final String PATH_TO_VIEWCART = "/ViewCart.jsp";
    private static final String PATH_TO_CHECKOUT = "/CheckOut.jsp";
    private static final String PATH_TO_CHECKOUTSUCCESS = "/CheckOutSuccess.jsp";
    private static final int ORDERDETAILS_START_ID = 60130;
    
    private List<Products> cart;
    
    HttpSession session;
    HttpServletRequest request;
    HttpServletResponse response;
    OrdersJpaController ordersCtrl;
    OrderDetailsJpaController orderDetailsCtrl;
    AccountHistoryJpaController accHistoryCtrl;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        this.request = request;
        this.response = response;
        this.ordersCtrl = new OrdersJpaController(utx, emf);
        this.orderDetailsCtrl = new OrderDetailsJpaController(utx, emf);
        this.accHistoryCtrl = new AccountHistoryJpaController(utx, emf);
        
        setCurrentCart();
        if (this.cart != null) {
            setRequest();
        }
        
        tryCheckout();
        tryRemoveCart();
        this.request.getServletContext().getRequestDispatcher(returnPath).forward(this.request, this.response);
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
            Logger.getLogger(CheckOutServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CheckOutServlet.class.getName()).log(Level.SEVERE, null, ex);
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
    
    private void setCurrentCart() {
        this.session = this.request.getSession(false);
        if (this.session != null) {
            this.cart = (List<Products>) this.session.getAttribute("cartProductList");
            if (this.cart == null || this.cart.isEmpty()) {
                this.errorCode = CheckOutServlet.CHECKOUT_ERROR;
                this.returnPath = CheckOutServlet.PATH_TO_VIEWCART;
            } else {
                this.returnPath = CheckOutServlet.PATH_TO_CHECKOUT;
            }
        }
    }

    private void setRequest() {
        this.name = this.request.getParameter("name");
        this.address = this.request.getParameter("address");
        this.sendEmail = this.request.getParameter("sendMail");
        this.submit = this.request.getParameter("submit");
        
        if (this.name != null) {
            this.name = name.trim();
            if (name.isEmpty()) {
                this.returnPath = PATH_TO_CHECKOUT; 
                this.errorCode = NAME_INVALID;
                this.request.setAttribute("errorCode", this.errorCode);
                return;
            }
        }
        if (this.address != null) {
            this.address = address.trim();
            if (address.isEmpty()) {
                this.returnPath = PATH_TO_CHECKOUT; 
                this.errorCode = ADDRESS_INVALID;
                this.request.setAttribute("errorCode", this.errorCode);
                return;
            }
        }
        if (this.submit != null && !this.submit.isEmpty()) {
            this.returnPath = PATH_TO_CHECKOUTSUCCESS; //End
        }
    }
    
    public boolean isPathTowardCheckoutSuccess() {
        return this.returnPath.equalsIgnoreCase(CheckOutServlet.PATH_TO_CHECKOUTSUCCESS);
    }
    
    public void tryRemoveCart() {
        if (isPathTowardCheckoutSuccess()) {
            this.session.removeAttribute("cartProductList");
        }
    }

    private void tryCheckout() throws RollbackFailureException, Exception {
        if (isPathTowardCheckoutSuccess()) {
            int order_index = ordersCtrl.getOrdersCount() + 1;
            int orderDetails_index = orderDetailsCtrl.getOrderDetailsCount() + 1;
            this.orderNumber = CheckOutServlet.ORDERDETAILS_START_ID + (orderDetailsCtrl.getOrderDetailsCount() + 1);
            Date currentDate = new Date();
            boolean isSecurityHistoryCreated = false;
            for (Products c : this.cart) {
                Orders order = new Orders();
                order.setOrderId(order_index);
                order.setOrderProductid(c);
                order.setOrderProductprice(c.getProductPrice());
                order.setOrderProductquantity(Integer.valueOf(c.getProductStock()));
                ordersCtrl.create(order); //Begin insert data
                
                OrderDetails orderDetail = new OrderDetails();
                orderDetail.setDetailid(orderDetails_index);
                orderDetail.setDetailOrderid(order);
                orderDetail.setDetailUserid((Users) this.session.getAttribute("user"));
                orderDetail.setDetailOrdernumber(orderNumber);
                orderDetail.setDetailOrderdate(currentDate);
                orderDetail.setDetailUserrealname(this.name);
                orderDetail.setDetailAddress(address);
                double totalPrice = 0;
                for (Products c2 : cart) {
                    totalPrice = totalPrice + (c2.getProductPrice() * c2.getProductStock());
                }
                orderDetail.setDetailTotalprice(totalPrice);
                orderDetailsCtrl.create(orderDetail);
                
                if (!isSecurityHistoryCreated) {
                    isSecurityHistoryCreated = true;
                    AccountHistory accHistory = new AccountHistory();
                    accHistory.setHistoryid(accHistoryCtrl.getAccountHistoryCount() + 1);
                    accHistory.setHistoryUserid((Users) this.session.getAttribute("user"));
                    accHistory.setHistoryDate(new Date());
                    accHistory.setHistoryType("user.order");
                    accHistory.setHistoryInfo("" + orderDetail.getDetailOrdernumber());
                    accHistoryCtrl.create(accHistory);
                }
                
                order_index++;
                orderDetails_index++;
            }
        }
        
        sendOrderMail(orderNumber);
        
        this.request.setAttribute("orderNumber", this.orderNumber);
    }

    private void sendOrderMail(int orderNumber) {
        Users user = (Users)this.session.getAttribute("user");
        final String TARGET_PATH = "/Setting_OrderDetail";
        
        if (this.sendEmail != null 
                && this.sendEmail.equalsIgnoreCase("on") 
                && user.getActivateDate() != null) {
            EmailMsgManager emm = new EmailMsgManager();
            
            String subject;
            subject = "Shipping Notification"; //Set subject name
            String message;
            message = emm.orderSent(user.getUsername(), request.getHeader("Host") + getServletContext().getContextPath(), TARGET_PATH, orderNumber); //Set message as HTML content
            SendMail.send(user.getEmail(), subject, message); //SEND MAIL!
        }
    }
    
    
}
