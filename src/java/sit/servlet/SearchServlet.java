/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Firsty
 */
public class SearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private String searchQuery;
    private String category;
    private String brand;
    private String priceMin;
    private String priceMax;
    private String excludeOutOfStock;
    
    protected String  actual_searchQuery;
    protected String  actual_category;
    protected String  actual_brand;
    protected double  actual_priceMin;
    protected double  actual_priceMax;
    protected boolean actual_excludeOutOfStock;
    
    private final String  VALUE_DEFAULT_SEARCHQUERY = "";
    private final String  VALUE_DEFAULT_CATEGORY    = "All";
    private final String  VALUE_DEFAULT_BRAND       = "All";   
    private final double  VALUE_DEFAULT_PRICEMIN    = 0;
    private final double  VALUE_DEFAULT_PRICEMAX    = 100000000l;
    private final boolean VALUE_DEFAULT_EXCLUDEOUTOFSTOCK = true; //Unused
    
    HttpServletRequest request;
    HttpServletResponse response;
    
    private final String TITLE_NAME = "title"; //Used to define request parameter name
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.request = request; //Move to local variable for use later.
        this.response = response; //Move to local variable for use later.
        
        this.searchQuery       = request.getParameter("searchQuery");
        this.category          = request.getParameter("category");
        this.brand             = request.getParameter("brand");
        this.priceMin          = request.getParameter("priceMin");
        this.priceMax          = request.getParameter("priceMax");
        this.excludeOutOfStock = request.getParameter("excludeOutOfStock");
        
        System.out.println("Search Query: " + searchQuery);
        System.out.println("Category: " + category);
        System.out.println("Brand: " + brand);
        System.out.println("Minimum Price: " + priceMin);
        System.out.println("Maximun Price: " + priceMax);
        System.out.println("Exclude: " + excludeOutOfStock);
        
        ValidateRequestParameter();
        
        if (isValidForSearch()) {
            setRequestAttributes();
            System.out.println(this.toString());
            setRequestTitle();
            getServletContext().getRequestDispatcher("/Search.jsp").forward(request, response);
            return;
        }
        
        getServletContext().getRequestDispatcher("/HomePage").forward(request, response);
    }

    @Override
    public String toString() {
        return "SearchServlet{" + "searchQuery=" + searchQuery + ", category=" + category + ", brand=" + brand + ", priceMin=" + priceMin + ", priceMax=" + priceMax + ", excludeOutOfStock=" + excludeOutOfStock + ", actual_searchQuery=" + actual_searchQuery + ", actual_category=" + actual_category + ", actual_brand=" + actual_brand + ", actual_priceMin=" + actual_priceMin + ", actual_priceMax=" + actual_priceMax + ", actual_excludeOutOfStock=" + actual_excludeOutOfStock + ", VALUE_DEFAULT_SEARCHQUERY=" + VALUE_DEFAULT_SEARCHQUERY + ", VALUE_DEFAULT_CATEGORY=" + VALUE_DEFAULT_CATEGORY + ", VALUE_DEFAULT_BRAND=" + VALUE_DEFAULT_BRAND + ", VALUE_DEFAULT_PRICEMIN=" + VALUE_DEFAULT_PRICEMIN + ", VALUE_DEFAULT_PRICEMAX=" + VALUE_DEFAULT_PRICEMAX + ", VALUE_DEFAULT_EXCLUDEOUTOFSTOCK=" + VALUE_DEFAULT_EXCLUDEOUTOFSTOCK + ", request=" + request + ", response=" + response + ", TITLE_NAME=" + TITLE_NAME + '}';
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
    
    private void ValidateRequestParameter() {
        //If request parameters is null, validate all values to default defined by local variables
        
        if (this.searchQuery == null || this.searchQuery.isEmpty()) {
            this.actual_searchQuery = VALUE_DEFAULT_SEARCHQUERY;
        } else {
            this.actual_searchQuery = searchQuery;
        }
        if (this.category == null || this.category.isEmpty()) {
            this.actual_category = VALUE_DEFAULT_CATEGORY;
        } else {
            this.actual_category = category;
        }
        if (this.brand == null || this.brand.isEmpty()) {
            this.actual_brand = VALUE_DEFAULT_BRAND;
        } else {
            this.actual_brand = brand;
        }
        if (this.priceMin == null || this.priceMin.isEmpty()) {
            this.actual_priceMin = VALUE_DEFAULT_PRICEMIN;
        } else {
            try {
                this.actual_priceMin = Double.valueOf(priceMin);
            } catch (NumberFormatException e) {
                this.actual_priceMin = 0; 
            }
        }
        if (this.priceMax == null || this.priceMax.isEmpty()) {
            this.actual_priceMax = VALUE_DEFAULT_PRICEMAX;
        } else {
            try {
                this.actual_priceMax = Double.valueOf(priceMax);
            } catch (NumberFormatException e) {
                this.actual_priceMax = 0; 
            }
        }
        if (this.excludeOutOfStock == null || this.excludeOutOfStock.isEmpty()) {
            this.actual_excludeOutOfStock = VALUE_DEFAULT_EXCLUDEOUTOFSTOCK;
        }
    }
    
    private void setRequestAttributes() {
        this.request.setAttribute("searchField", this.searchQuery);
        this.request.setAttribute("categoryField", this.category);
        this.request.setAttribute("brandField", this.brand);
        this.request.setAttribute("minPriceField", this.priceMin);
        this.request.setAttribute("maxPriceField", this.priceMax);
    }
    
    private void setRequestTitle() {
        //Actual title of the page <title></title>
        
        if (actual_searchQuery.trim().isEmpty()) { //If search query is not specified, either category title or brand title will be used.
            if (!actual_category.equalsIgnoreCase(VALUE_DEFAULT_CATEGORY)) {
                this.request.setAttribute(TITLE_NAME, actual_category);
            } else {
                this.request.setAttribute(TITLE_NAME, actual_brand);
            }
        } else {
            this.request.setAttribute(TITLE_NAME, searchQuery);
        }
    }
    
    private boolean isValidForSearch() {
        boolean isValid = true;
        
        //If all field is its default field of SET VALUES, then it's invalid.
        if (actual_searchQuery.equalsIgnoreCase(VALUE_DEFAULT_SEARCHQUERY)
                && actual_category.equalsIgnoreCase(VALUE_DEFAULT_CATEGORY)
                && actual_brand.equalsIgnoreCase(VALUE_DEFAULT_BRAND)
                && actual_priceMin == VALUE_DEFAULT_PRICEMIN
                && actual_priceMax == VALUE_DEFAULT_PRICEMAX
                && actual_excludeOutOfStock == VALUE_DEFAULT_EXCLUDEOUTOFSTOCK) {
            isValid = false;
        }
        
        return isValid;
    }
}
