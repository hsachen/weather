/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tw.com.model.entity.AccountTbl;
import tw.com.model.base.BaseDAO;

/**
 *
 * @author Jean
 */
public class AccountServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private BaseDAO<AccountTbl> baseDao = new BaseDAO<AccountTbl>();
    public String msg = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        if (action.equals("add")) {
            add(request, response);
        } else if (action.equals("list")) {
            list(request, response);
        }  else if (action.equals("update")) {
            update(request, response);
        }

    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        PrintWriter out = response.getWriter();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss", Locale.US);
        try {

            AccountTbl account = new AccountTbl();
            account.setAccountGroup(request.getParameter("account_group"));
            account.setEmailAddress(request.getParameter("email"));
            account.setPkiCode("pki");
            account.setStatus(null);
            account.setStatusText(null);
            account.setUserId(request.getParameter("user_id"));
            account.setUserName(request.getParameter("user_name"));
            account.setValidEnd(sdf.parse(request.getParameter("valid_end")));
            account.setValidFrom(sdf.parse(request.getParameter("valid_from")));
            baseDao.create(account);
            msg = baseDao.getMessage();
            //request.setAttribute("msg", dao);
        } catch (ParseException ex) {
            msg = "新增失敗，日期格式錯誤";
            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        out.print(msg);
    }
    
        protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        PrintWriter out = response.getWriter();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss", Locale.US);
        try {

            AccountTbl account = new AccountTbl();
            account.setAccountGroup(request.getParameter("account_group"));
            account.setEmailAddress(request.getParameter("email"));
            account.setPkiCode("pki");
            account.setStatus(null);
            account.setStatusText(null);
            account.setUserId(request.getParameter("user_id"));
            account.setUserName(request.getParameter("user_name"));
            account.setValidEnd(sdf.parse(request.getParameter("valid_end")));
            account.setValidFrom(sdf.parse(request.getParameter("valid_from")));
            baseDao.update(account);
            msg = baseDao.getMessage();
            //request.setAttribute("msg", dao);
        } catch (ParseException ex) {
            msg = "修改失敗，日期格式錯誤";
            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        out.print(msg);
    }

    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.setAttribute("accountList", baseDao.list("  FROM AccountTbl  "));
            request.getRequestDispatcher("webpages/account.jsp").forward(request, response);
            //request.setAttribute("msg", dao);
        } catch (Exception ex) {
            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        } catch (ParseException ex) {
            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
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
