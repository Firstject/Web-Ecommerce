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
    
    private static final String CHECKOUT_ERROR = "CHECKOUT_ERROR";
    private static final String PATH_TO_VIEWCART = "/ViewCart.jsp";
    private static final String PATH_TO_CHECKOUT = "/CheckOut.jsp";
    
    HttpSession session;
    HttpServletRequest request;
    HttpServletResponse response;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.request = request;
        this.response = response;
        
        session = this.request.getSession(false);
        if (session != null) {
            List<Products> cart = (List<Products>) session.getAttribute("cartProductList");
            if (cart == null) {
                this.errorCode = CHECKOUT_ERROR;
                this.returnPath = PATH_TO_VIEWCART;
            } else {
                this.returnPath = PATH_TO_CHECKOUT;
            }
        }
        
        initRequest();
        
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

    private void initRequest() {
        this.errorCode = CHECKOUT_ERROR;
    }

}
