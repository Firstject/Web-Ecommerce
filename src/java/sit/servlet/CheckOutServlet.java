/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sit.model.Products;

/**
 *
 * @author Firsty
 */
public class CheckOutServlet extends HttpServlet {
    
    private String errorCode;
    private String returnPath;
    
    private String name;
    private String address;
    private String sendEmail;
    private String submit;
    
    private static final String CHECKOUT_ERROR = "CHECKOUT_ERROR";
    private static final String NAME_INVALID = "NAME_INVALID"; //Name is null or invalid
    private static final String ADDRESS_INVALID = "ADDRESS_INVALID"; //Address is null or invalid
    private static final String PATH_TO_VIEWCART = "/ViewCart.jsp";
    private static final String PATH_TO_CHECKOUT = "/CheckOut.jsp";
    private static final String PATH_TO_CHECKOUTSUCCESS = "/CheckOutSuccess.jsp";
    
    private List<Products> cart;
    
    HttpSession session;
    HttpServletRequest request;
    HttpServletResponse response;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.request = request;
        this.response = response;
        
        setCurrentCart();
        if (this.cart != null) {
            setRequest();
        }
        
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
    
    public void tryRemoveCart() {
        if (this.returnPath.equalsIgnoreCase(CheckOutServlet.PATH_TO_CHECKOUTSUCCESS)) {
            this.session.removeAttribute("cartProductList");
        }
    }
}
