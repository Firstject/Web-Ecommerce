/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import sit.controller.UsersJpaController;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class ResetPasswordServlet extends HttpServlet {
    
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*
            This page is used in both receiving password reset code and send reset email, which is divided into 2 parts:
            Part 1: Receives password reset code and redirects user to password renew page.
            Part 2: Send password reset code.
        */
        
        /* PART 1*/
        String a = request.getParameter("a");
        String b = request.getParameter("b");
        /* PART 2*/
        String parameter = request.getParameter("parameter"); //This can be either username or email. But we have to check it.
        /* END */
        UsersJpaController usersCtrl = new UsersJpaController(utx, emf);
        Users user;
        
        /* Check for part 1 */
        if (a != null && b != null) {
            int userId = Integer.parseInt(b);
            user = usersCtrl.findUsers(userId);
            //Check if reset code is valid
            if (user.getResetpassCode() != null && user.getResetpassCode().equals(a)) {
                //Check if it is expire or not
                                
            }
        }
        
        //Debug
//        Date currentDate = new Date();
//        Date regisDate = usersCtrl.findUsers(1).getRegisterDate();
//        Calendar cal = Calendar.getInstance();
//        cal.setTime(regisDate);
//        System.out.println("Register Date: " + regisDate);
//        cal.add(Calendar.HOUR, -1);
//        System.out.println("Register Date after -1: " + cal.getTime());
//        System.out.println("Current Date: " + currentDate);
        //Debug
        
        System.out.println("----------------");
        
        //DEBUG
        Date date1 = new Date();
        Date date2 = usersCtrl.findUsers(1).getRegisterDate();
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MINUTE, -44);
        date1 = cal.getTime();
        boolean isExpired = false;
        if (date1.getTime() > date2.getTime()) {
            isExpired = true;
        }
        System.out.println("Date 1 (Cur - x Mills) : " + date1);
        System.out.println("Date 2 (Register Time) : " + date2);
        System.out.println("Late ; 1 > 2 ; is expired: " + isExpired);
        //DEBUG
        
        getServletContext().getRequestDispatcher("/Password_Reset.jsp").forward(request, response);
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

}
