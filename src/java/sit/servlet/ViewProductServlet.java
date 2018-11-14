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
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import sit.controller.ProductsJpaController;
import sit.model.Products;

/**
 *
 * @author Firsty
 */

public class ViewProductServlet extends HttpServlet {
    
    @PersistenceUnit(unitName = "ECommerce_WebPU")
    EntityManagerFactory emf;
    @Resource
    UserTransaction utx;
    
    private String title = "Unknown product"; //Default
    private String product_id; //Get from header
    private Products actual_product;
    
    //Add to cart parameters
    private String quantity;
    private int actual_quantity;
    private final String PRODUCT_ADDED_SUCCESS = "added"; //Used for add to cart and send error code.
    private final String PRODUCT_ADDED_FAILED = "soldout"; //Used for add to cart and send error code.
    
    HttpServletRequest request;
    HttpServletResponse response;
    HttpSession session;

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
        this.request = request;
        this.response = response;
        this.product_id = this.request.getParameter("productId");
        this.quantity = this.request.getParameter("quantity");
        
        if (this.product_id != null) {
            this.actual_product = getProduct(this.product_id);
        }
        addToCart();
        setRequest(); //Do last before forwarding to ViewCart page.
        
        getServletContext().getRequestDispatcher("/ViewProduct.jsp").forward(this.request, this.response);
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

    private Products getProduct(String product_id) {
        ProductsJpaController productCtrl = new ProductsJpaController(utx, emf);
        int actual_id;
        try {
            actual_id = Integer.valueOf(product_id);
        } catch (NumberFormatException e) {
            actual_id = 0;
        }
        
        return productCtrl.findProducts(actual_id);
    }

    private void setRequest() {
        if (this.actual_product != null) {
            this.request.setAttribute("title", this.actual_product.getProductName());
            this.request.setAttribute("product", this.actual_product);
        } else {
            this.request.setAttribute("title", title);
        }
    }

    private void addToCart() {
        //If quantity is not sent from 'Add to Cart', then return.
        if (this.quantity == null) {
            return;
        }
        
        try {
            this.actual_quantity = Integer.valueOf(this.quantity);
            //Check if quantity is valid (Must be between 1-255)
            if (actual_quantity <= 1 && actual_quantity > 255) {
                actual_quantity = 1;
            }
        } catch (NumberFormatException e) {
            this.actual_quantity = 1;
        }
        
        List<Products> productListSession;
        
        session = this.request.getSession(false);
        if (session == null) {
            this.request.getSession(true);
            productListSession = new ArrayList<>();
        } else {
            productListSession = (List<Products>) session.getAttribute("cartProductList");
            if (productListSession == null) {
                productListSession = new ArrayList<>();
            }
        }
        
        //Check if item is not out of stock.
        if (this.actual_product.getProductStock() > 0) {
            //Add by quantity times
            for (int i = 0; i < this.actual_quantity; i++) {
                productListSession.add(this.actual_product);
            }
            //Notify a success code and set session.
            request.setAttribute("productAddedStatus", PRODUCT_ADDED_SUCCESS);
            request.setAttribute("productAddedAmount", actual_quantity);
            session.setAttribute("cartProductList", productListSession);
        } else {
            request.setAttribute("productAddedStatus", PRODUCT_ADDED_FAILED);
        }
        
    }

}
