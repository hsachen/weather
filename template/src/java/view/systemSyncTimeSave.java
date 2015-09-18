/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Z00907
 */
public class systemSyncTimeSave extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
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
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        String productSyncMethod = request.getParameter("productSyncMethod");//产品同步方式
        String productSyncProperty = request.getParameter("productSyncProperty");//产品同步属性
        String productSyncOnTime = request.getParameter("productSyncOnTime");//指定整点同步

        String orderSyncMethod = request.getParameter("orderSyncMethod");//保单同步方式
        String orderSyncProperty = request.getParameter("orderSyncProperty");//保单同步属性
        String orderSyncOnTime = request.getParameter("orderSyncOnTime");//保单整点同步

        String judgeSyncMethod = request.getParameter("judgeSyncMethod");//判赔同步方式
        String judgeSyncWeek = request.getParameter("judgeSyncWeek");//指定周几同步
        String judgeSyncDayTime = request.getParameter("judgeSyncDayTime");//每日同步时间
        String judgeSyncProperty = request.getParameter("judgeSyncProperty");//判赔同步属性
        String judgeSynDay = request.getParameter("judgeSynDay");//指定哪日同步
        String judgeSyncTime = request.getParameter("judgeSyncTime");//指定同步时间
        String judgeSyncOnTime = request.getParameter("judgeSyncOnTime");//指定整点同步
        String judgeSyncDetail = request.getParameter("judgeSyncDetail");//判赔同步内容

        out.print("儲存成功");
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
