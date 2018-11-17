/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
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
public class ViewCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String updateType;
    private String productTarget;
    private String productQuantity;
    
    private String actual_updateType;
    private int actual_productTarget;
    private int actual_productQuantity;
    private String errorCode;
    private String updatedProductName;
    private int updatedProductId;
    
    private final String DEFAULT_UPDATE_TYPE = "";
    private final String[] UPDATE_TYPE = {"update", "remove", "clear"};
    private final int DEFAULT_PRODUCT_TARGET = 0;
    private final int DEFAULT_PRODUCT_QUANTITY = 1;
    private final int DEFAULT_PRODUCT_QUANTITY_MIN = 1;
    private final int DEFAULT_PRODUCT_QUANTITY_MAX = 100;
    private final int MAXIMUM_CART_ITEMS_ALLOWED = 100;
    //Error codes
    private final String SESSION_NULL_ERROR = "SESSION_NULL_ERROR";
    private final String UPDATE_SUCCESS = "UPDATE_SUCCESS";
    private final String PRODUCT_NOT_FOUND_ERROR = "PRODUCT_NOT_FOUND_ERROR";
    private final String CART_EXCEED_LIMIT = "CART_EXCEED_LIMIT";
    private final String DELETE_SUCCESS = "DELETE_SUCCESS";
    private final String DELETE_ALL_SUCCESS = "DELETE_ALL_SUCCESS";
    private final String CART_ERROR = "CART_ERROR";
    private final String UPDATE_TYPE_ERROR = "UPDATE_TYPE_ERROR"; //bug: usually happens when user load the cart page
    
    private HttpServletRequest request;
    private HttpServletResponse response;
    
    private HttpSession session;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.request = request;
        this.response = response;
        
        validateRequestParameters();
        initiateRequests();
        
        getServletContext().getRequestDispatcher("/ViewCart.jsp").forward(this.request, this.response);
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

    private void validateRequestParameters() {
        this.updateType = request.getParameter("updateType");
        this.productTarget = request.getParameter("productTarget");
        this.productQuantity = request.getParameter("productQuantity");
        
        //Validate all requests
        if (this.updateType != null && !this.updateType.isEmpty()) {
            this.actual_updateType = this.updateType;
        } else {
            this.actual_updateType = this.DEFAULT_UPDATE_TYPE;
        }
        if (this.productTarget != null && !this.productTarget.isEmpty()) {
            try {
                this.actual_productTarget = Integer.valueOf(this.productTarget);
            } catch (NumberFormatException e) {
                this.actual_productTarget = this.DEFAULT_PRODUCT_TARGET;
            }
        } else {
            this.actual_productTarget = this.DEFAULT_PRODUCT_TARGET;
        }
        if (this.productQuantity != null && !this.productQuantity.isEmpty()) {
            try {
                this.actual_productQuantity = Integer.valueOf(this.productQuantity);
            } catch (NumberFormatException e) {
                this.actual_productQuantity = this.DEFAULT_PRODUCT_QUANTITY;
            }
        } else {
            this.actual_productQuantity = this.DEFAULT_PRODUCT_QUANTITY;
        }
        
        //Get update type. This can be either update cart or remove items from cart.
        if (actual_updateType.equalsIgnoreCase(UPDATE_TYPE[0])) { //Type is update
            updateProductFromCart(actual_productTarget, actual_productQuantity);
        } else if (actual_updateType.equalsIgnoreCase(UPDATE_TYPE[1])) { //Type is remove
            deleteProductFromCart(actual_productTarget);
        } else if (actual_updateType.equalsIgnoreCase(UPDATE_TYPE[2])) { //Type is clear
            deleteAllProductFromCart();
        } else { //Neither both
            errorCode = UPDATE_TYPE_ERROR;
        }
        
    }
    
    public void updateProductFromCart(int target, int quantity) {
        this.session = this.request.getSession(false);
        
        //Make quantity a valid number within a specified range
        if (quantity < DEFAULT_PRODUCT_QUANTITY_MIN) {
            quantity = DEFAULT_PRODUCT_QUANTITY_MIN;
        }
        if (quantity > DEFAULT_PRODUCT_QUANTITY_MAX) {
            quantity = DEFAULT_PRODUCT_QUANTITY_MAX;
        }
        
        //Find product in session
        if (session != null) {
            List<Products> productList = (List<Products>) session.getAttribute("cartProductList");
            //Check if product list is still there.
            if (productList == null) {
                this.errorCode = CART_ERROR;
                return;
            }
            for (Products p : productList) {
                if (p.getProductId() == target) {
                    int quantityDifference = 0 - (p.getProductStock() - quantity);
                    int count = quantityDifference; //Initialize total items checker in shopping cart 
                    this.updatedProductName = p.getProductName();
                    this.updatedProductId = p.getProductId();
                    //Check how many total items are in a shopping cart.
                    for (Products p2 : productList) {
                        count += p2.getProductStock();
                    }
                    //If exceeds limit, user won't be able to update product quantity
                    if (count > MAXIMUM_CART_ITEMS_ALLOWED) {
                        this.errorCode = CART_EXCEED_LIMIT;
                        return;
                    } else {
                        this.errorCode = UPDATE_SUCCESS;
                        p.setProductStock((short) quantity);
                        session.setAttribute("cartProductList", productList); //Update session
                        return;
                    }
                }
            }
            this.errorCode = PRODUCT_NOT_FOUND_ERROR;
        } else {
            //Can't add because session is already invalid.
            this.errorCode = SESSION_NULL_ERROR;
        }
    }
    
    public void deleteProductFromCart(int target) {
        this.session = this.request.getSession(false);
        
        if (session != null) {
            List<Products> productList = (List<Products>) session.getAttribute("cartProductList");
            //Check if product list is still there.
            if (productList == null) {
                this.errorCode = CART_ERROR;
                return;
            }
            int index = 0;
            for (Products p : productList) {
                if (p.getProductId() == target) {
                    this.updatedProductName = p.getProductName();
                    this.updatedProductId = p.getProductId();
                    this.errorCode = DELETE_SUCCESS;
                    productList.remove(index);
                    session.setAttribute("cartProductList", productList);
                    return;
                }
                index++;
            }
            this.errorCode = PRODUCT_NOT_FOUND_ERROR;
            return;
        } else {
            this.errorCode = SESSION_NULL_ERROR;
            return;
        }
    }

    private void deleteAllProductFromCart() {
        this.session = this.request.getSession(false);
        
        if (session != null) {
            List<Products> productList = (List<Products>) session.getAttribute("cartProductList");
            //Check if product list is still there.
            if (productList == null) {
                this.errorCode = CART_ERROR;
                return;
            }
            productList.clear();
            this.errorCode = DELETE_ALL_SUCCESS;
            session.setAttribute("cartProductList", productList); //Update session
            return;
            
        } else {
            this.errorCode = SESSION_NULL_ERROR;
            return;
        }
    }
    
    private void initiateRequests() {
        this.request.setAttribute("errorCode", errorCode);
        this.request.setAttribute("updatedProductName", updatedProductName);
        this.request.setAttribute("updatedProductId", updatedProductId);
    }

}
