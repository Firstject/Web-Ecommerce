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
    private Integer actual_quantity;
    private String productAddStatus;
    private final Integer MINIMUM_ADD_VALUE = 1;
    private final Integer MAXIMUM_ADD_VALUE = 100;
    private final String PRODUCT_ADDED_SUCCESS = "PRODUCT_ADDED_SUCCESS"; //Used for add to cart and send error code.
    private final String PRODUCT_ADDED_FULL = "PRODUCT_ADDED_FULL"; //Used for add to cart and send error code.
    private final String PRODUCT_ADDED_OUT_OF_STOCK = "PRODUCT_ADDED_OUT_OF_STOCK"; //Used for add to cart and send error code.
    private final Integer CART_LIMIT = 100; //Limits shopping cart to certain amount
    
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
        if (this.quantity != null) {
            request.setAttribute("productAddedStatus", this.productAddStatus);
        }
    }

    private void addToCart() {
        //If quantity is not sent from 'Add to Cart', then return.
        if (this.quantity == null) {
            return;
        }
        
        try {
            this.actual_quantity = Integer.valueOf(this.quantity);
            
            //Check if quantity is valid (Must be between minimum and maximum)
            if (actual_quantity <= MINIMUM_ADD_VALUE || actual_quantity > MAXIMUM_ADD_VALUE) {
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
            //Check how many items are in a shopping cart. If exceeds limit, user won't be able to add to cart
            int count = this.actual_quantity;
            for (Products p : productListSession) {
                count += p.getProductStock();
            }
            
            if (!(count > 100)) {
                //Add product to cart. If there's an item that's already in the cart, do increase quantity.
                if (productListSession.contains(this.actual_product)) {
                    for (Products p : productListSession) {
                        if (this.actual_product.getProductId().equals(p.getProductId())) {
                            p.setProductStock((short) (p.getProductStock() + actual_quantity));
                            break;
                        }
                    }
                } else {
                    this.actual_product.setProductStock((short)(int)actual_quantity);
                    productListSession.add(this.actual_product);
                }
                //Notify a success code and set session.
                this.productAddStatus = PRODUCT_ADDED_SUCCESS;
                request.setAttribute("productAddedAmount", actual_quantity);
                session.setAttribute("cartProductList", productListSession);
            } else {
                this.productAddStatus = PRODUCT_ADDED_FULL;
            }
        } else {
            this.productAddStatus = PRODUCT_ADDED_OUT_OF_STOCK;
        }
    }
}
