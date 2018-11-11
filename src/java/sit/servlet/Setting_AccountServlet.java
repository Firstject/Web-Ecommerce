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
import java.util.List;
import java.util.Objects;
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
import sit.controller.UsersJpaController;
import sit.controller.exceptions.NonexistentEntityException;
import sit.controller.exceptions.RollbackFailureException;
import sit.javaModel.EmailMsgManager;
import sit.javaModel.MD5;
import sit.javaModel.SendMail;
import sit.javaModel.UserManager;
import sit.model.AccountHistory;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class Setting_AccountServlet extends HttpServlet {
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
            throws ServletException, IOException, NonexistentEntityException, RollbackFailureException, Exception {
        //Change password part
        String submit = request.getParameter("submit");
        String OldPass = request.getParameter("oldpass");
        String NewPass1 = request.getParameter("newpass1");
        String NewPass2 = request.getParameter("newpass2");
        //Email part
        String submitEmail = request.getParameter("submitEmail");
        String email = request.getParameter("email");
        //EmailVerify part
        String submitEmailVerify = request.getParameter("submitEmailVerify");
        HttpSession session = request.getSession(false);
        UsersJpaController usersCtrl = new UsersJpaController(utx, emf);
        AccountHistoryJpaController ahisCtrl = new AccountHistoryJpaController(utx, emf);
        UserManager um = new UserManager();
        Users user = new Users();
        
        if (session != null) {
            //Part 1 of 3, change password
            if (submit != null) {
                if (OldPass != null && NewPass1 != null && NewPass2 != null) {
                    user = (Users)session.getAttribute("user");
                    um.setSecondUserToCheck(user);
                    String errorCode = um.changePassword(OldPass, NewPass1, NewPass2);
                    if ("".equals(errorCode)) {
                        //Add to log user changing password
                        if (um.getSecondUserToCheck() != null) {
                            AccountHistory accHistory = new AccountHistory(ahisCtrl.getAccountHistoryCount() + 1);
                            accHistory.setHistoryUserid((Users)session.getAttribute("user"));
                            accHistory.setHistoryType("user.change_password");
                            accHistory.setHistoryDate(new Date());
                            ahisCtrl.create(accHistory);
                        }
                        //--Fix IllegalOrphanException--
                        List<AccountHistory> historyList = ahisCtrl.findAccountHistoryEntities();
                        List<AccountHistory> historyList_add = new ArrayList<>();
                        for (AccountHistory htr : historyList) {
                            if (Objects.equals(htr.getHistoryUserid().getUserid(), user.getUserid())) {
                                historyList_add.add(htr);
                            }
                        }
                        user.setAccountHistoryList(historyList_add);
                        usersCtrl.edit(user);
                        //--End of Fix IllegalOrphanException--
                        
                        session.setAttribute("user", user);
                    }
                    if (errorCode.isEmpty()) {
                        request.setAttribute("isPasswordUpdated", true);
                    } else {
                        request.setAttribute("errorDesc", um.GetErrorCodeDescription(errorCode));
                    }
                }
            }
            //Part 2 of 3, change email
            if (submitEmail != null) {
                //Check if email activation is activated by current email
                //Otherwise, email can't be changed.
                user = (Users)session.getAttribute("user");
                if (((Users)session.getAttribute("user")).getActivateDate() == null) {
                    request.setAttribute("errorDesc", "Can't change email! There is a pending change of your email to <u>" + user.getEmail() + "</u>.");
                    getServletContext().getRequestDispatcher("/Setting_Account.jsp").forward(request, response);
                    return;
                }
                if (email != null) {
                    String errorCode = "";
                    //Check for existence
                    errorCode = um.checkEmailExistence(usersCtrl.findEmail(email), email);
                    //If email is available (not exist), then change email.
                    if (errorCode.isEmpty()) {
                        um.setSecondUserToCheck(user);
                        errorCode = um.changeEmail(email);
                    }
                    if ("".equals(errorCode)) {
                        //Add to log user changing password
                        if (um.getSecondUserToCheck() != null) {
                            AccountHistory accHistory = new AccountHistory(ahisCtrl.getAccountHistoryCount() + 1);
                            accHistory.setHistoryUserid((Users)session.getAttribute("user"));
                            accHistory.setHistoryType("user.change_email");
                            accHistory.setHistoryDate(new Date());
                            accHistory.setHistoryInfo("Changed to " + email);
                            ahisCtrl.create(accHistory);
                        }
                        //--Fix IllegalOrphanException--
                        List<AccountHistory> historyList = ahisCtrl.findAccountHistoryEntities();
                        List<AccountHistory> historyList_add = new ArrayList<>();
                        for (AccountHistory htr : historyList) {
                            if (Objects.equals(htr.getHistoryUserid().getUserid(), user.getUserid())) {
                                historyList_add.add(htr);
                            }
                        }
                        user.setAccountHistoryList(historyList_add);
                        usersCtrl.edit(user);
                        //--End of Fix IllegalOrphanException--
                        
                        session.setAttribute("user", user);
                    }
                    if (errorCode.isEmpty()) {
                        request.setAttribute("isInfoUpdated", true);
                    } else {
                        request.setAttribute("errorDesc", um.GetErrorCodeDescription(errorCode));
                        getServletContext().getRequestDispatcher("/Setting_Account.jsp").forward(request, response);
                        return;
                    }
                }
            }
            //Part 3 of 3 SendEmailVerifyCode
            if (submitEmailVerify != null) {
                user = (Users)session.getAttribute("user");
                
                //Already activated. No need to activate again.
                if (user.getActivateDate() != null) {
                    request.setAttribute("errorDesc", "Email already verified. No need to activate again.");
                    getServletContext().getRequestDispatcher("/Setting_Account.jsp").forward(request, response);
                    return;
                }
                EmailMsgManager emm = new EmailMsgManager();
                String subject, message;
                String username = user.getUsername();
                int userId = user.getUserid();
                String verifyCode = new MD5().generateVerificationCode();
                user.setActivateDate(null);
                user.setVerifyCode(verifyCode);
                
                //--Fix IllegalOrphanException--
                List<AccountHistory> historyList = ahisCtrl.findAccountHistoryEntities();
                List<AccountHistory> historyList_add = new ArrayList<>();
                for (AccountHistory htr : historyList) {
                    if (Objects.equals(htr.getHistoryUserid().getUserid(), user.getUserid())) {
                        historyList_add.add(htr);
                    }
                }
                user.setAccountHistoryList(historyList_add);
                usersCtrl.edit(user);
                //--End of Fix IllegalOrphanException--
                
                usersCtrl.edit(user);
                session.setAttribute("user", user);
                
                subject = "New Email Address"; //Set subject name
                message = emm.changeEmail(username, email, verifyCode, userId, request.getHeader("Host") + getServletContext().getContextPath(), "/AccountVerify"); //Set message as HTML content
                SendMail.send(email, subject, message); //SEND MAIL!
            
                request.setAttribute("isInfoUpdated", true);
            }
        }
        
        
        getServletContext().getRequestDispatcher("/Setting_Account.jsp").forward(request, response);
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
        } catch (RollbackFailureException ex) {
            Logger.getLogger(Setting_AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Setting_AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (RollbackFailureException ex) {
            Logger.getLogger(Setting_AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Setting_AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
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

}
