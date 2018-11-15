/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import sit.controller.ProductsJpaController;
import sit.model.Products;

/**
 *
 * @author Firsty
 */
public class SearchServlet extends HttpServlet {
    
    @PersistenceUnit(unitName = "ECommerce_WebPU")
    EntityManagerFactory emf;
    @Resource
    UserTransaction utx;
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
    private String priceMin;
    private String priceMax;
    private String excludeOutOfStock;
    
    String[] categoryList = {
        "ALL",
        "APPLE",
        "SMARTPHONE",
        "NOTEBOOK",
        "TABLET",
        "CAMERA",
        "GADGET",
        "ACCESSORY",
    };
    
    protected String  actual_searchQuery;
    protected String  actual_category;
    protected double  actual_priceMin;
    protected double  actual_priceMax;
    protected boolean actual_excludeOutOfStock;
    
    private final String  VALUE_DEFAULT_SEARCHQUERY = "";
    private final String  VALUE_DEFAULT_CATEGORY    = "All";
    private final double  VALUE_DEFAULT_PRICEMIN    = 0;
    private final double  VALUE_DEFAULT_PRICEMAX    = 100000000l;
    private final boolean VALUE_DEFAULT_EXCLUDEOUTOFSTOCK = true; //Unused
    
    HttpServletRequest request;
    HttpServletResponse response;
    
    private String returnSearchUrl;
    private String returnCategoryUrl;
    private String returnMinPrice;
    private String returnMaxPrice;
    private final String DEFAULT_RETURN_SEARCH_URL = "searchQuery="; //Used for add to cart and send error code.
    private final String DEFAULT_RETURN_CATEGORY_URL = "category=Apple"; //Used for add to cart and send error code.
    private final String DEFAULT_RETURN_MINPRICE_URL = ""; //Used for add to cart and send error code.
    private final String DEFAULT_RETURN_MAXPRICE_URL = ""; //Used for add to cart and send error code.
    private final String TITLE_NAME = "title"; //Used to define request parameter name
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.request = request; //Move to local variable for use later.
        this.response = response; //Move to local variable for use later.
        
        this.searchQuery       = request.getParameter("searchQuery");
        this.category          = request.getParameter("category");
        this.priceMin          = request.getParameter("priceMin");
        this.priceMax          = request.getParameter("priceMax");
        this.excludeOutOfStock = request.getParameter("excludeOutOfStock");
        
        ValidateRequestParameter();
        fetchReturnUrl();
        
        if (isValidForSearch()) {
            setRequestAttributes();
            setRequestTitle();
            setRequestResult(); //Find query result
            getServletContext().getRequestDispatcher("/Search.jsp").forward(this.request, this.response);
            return;
        }
        
        getServletContext().getRequestDispatcher("/HomePage").forward(this.request, this.response);
    }

    @Override
    public String toString() {
        return "SearchServlet{" + "searchQuery=" + searchQuery + ", category=" + category + ", priceMin=" + priceMin + ", priceMax=" + priceMax + ", excludeOutOfStock=" + excludeOutOfStock + ", actual_searchQuery=" + actual_searchQuery + ", actual_category=" + actual_category + ", actual_priceMin=" + actual_priceMin + ", actual_priceMax=" + actual_priceMax + ", actual_excludeOutOfStock=" + actual_excludeOutOfStock + ", VALUE_DEFAULT_SEARCHQUERY=" + VALUE_DEFAULT_SEARCHQUERY + ", VALUE_DEFAULT_CATEGORY=" + VALUE_DEFAULT_CATEGORY + ", VALUE_DEFAULT_PRICEMIN=" + VALUE_DEFAULT_PRICEMIN + ", VALUE_DEFAULT_PRICEMAX=" + VALUE_DEFAULT_PRICEMAX + ", VALUE_DEFAULT_EXCLUDEOUTOFSTOCK=" + VALUE_DEFAULT_EXCLUDEOUTOFSTOCK + ", request=" + request + ", response=" + response + ", TITLE_NAME=" + TITLE_NAME + '}';
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
        
        if (this.searchQuery == null || this.searchQuery.trim().isEmpty()) {
            this.actual_searchQuery = VALUE_DEFAULT_SEARCHQUERY;
        } else {
            //Bonus: if user entered a search keyword containing category, it will fetch all data from that category instead.
            for (String clist : categoryList) {
                if (clist.matches(searchQuery.toUpperCase())) {
                    this.searchQuery = VALUE_DEFAULT_SEARCHQUERY;
                    this.actual_searchQuery = VALUE_DEFAULT_SEARCHQUERY;
                    this.category = clist;
                    break;
                }
            }
            this.actual_searchQuery = searchQuery;
        }
        if (this.category == null || this.category.isEmpty()) {
            this.actual_category = VALUE_DEFAULT_CATEGORY;
        } else {
            this.actual_category = category;
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
        this.request.setAttribute("minPriceField", this.priceMin);
        this.request.setAttribute("maxPriceField", this.priceMax);
    }
    
    private void setRequestTitle() {
        //Actual title of the page <title></title>
        
        if (actual_searchQuery.trim().isEmpty()) { //If search query is not specified, either category title or brand title will be used.
            this.request.setAttribute(TITLE_NAME, actual_category);
        } else {
            this.request.setAttribute(TITLE_NAME, searchQuery);
        }
    }
    
    private boolean isValidForSearch() {
        boolean isValid = true;
        
        //If all field is its default field of SET VALUES, then it's invalid.
        if (actual_searchQuery.equalsIgnoreCase(VALUE_DEFAULT_SEARCHQUERY)
                && actual_category.equalsIgnoreCase(VALUE_DEFAULT_CATEGORY)
                && actual_priceMin == VALUE_DEFAULT_PRICEMIN
                && actual_priceMax == VALUE_DEFAULT_PRICEMAX
                && actual_excludeOutOfStock == VALUE_DEFAULT_EXCLUDEOUTOFSTOCK) {
            isValid = false;
        }
        
        return isValid;
    }
    
    private void setRequestResult() {
        ProductsJpaController productCtrl = new ProductsJpaController(utx, emf);
        List<Products> productList = productCtrl.findProductsByUserInputs(actual_searchQuery, actual_category, actual_priceMin, actual_priceMax, actual_excludeOutOfStock);
        this.request.setAttribute("productList", productList);
    }
    
    private void fetchReturnUrl() {
        this.returnSearchUrl = request.getParameter("searchQuery");
        this.returnCategoryUrl = request.getParameter("category");
        this.returnMinPrice = request.getParameter("priceMin");
        this.returnMaxPrice = request.getParameter("priceMax");
        
        if (this.returnSearchUrl != null) {
            request.setAttribute("searchQuery", this.returnSearchUrl);
        } else {
            this.returnSearchUrl = this.DEFAULT_RETURN_SEARCH_URL;
            request.setAttribute("searchQuery", this.returnSearchUrl);
        }
        
        if (this.returnCategoryUrl != null) {
            request.setAttribute("category", this.returnCategoryUrl);
        } else {
            this.returnCategoryUrl = this.DEFAULT_RETURN_CATEGORY_URL;
            request.setAttribute("category", this.returnCategoryUrl);
        }
        
        if (this.returnMinPrice != null) {
            request.setAttribute("priceMin", this.returnMinPrice);
        } else {
            this.returnMinPrice = this.DEFAULT_RETURN_MINPRICE_URL;
            request.setAttribute("priceMin", this.returnMinPrice);
        }
        
        if (this.returnMaxPrice != null) {
            request.setAttribute("priceMax", this.returnMaxPrice);
        } else {
            this.returnMaxPrice = this.DEFAULT_RETURN_MAXPRICE_URL;
            request.setAttribute("priceMax", this.returnMaxPrice);
        }
        
        
    }
}
