/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Z00907
 */
@WebServlet(name = "siteSetSave", urlPatterns = {"/siteSetSave"})
public class siteSetSave extends HttpServlet {

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
        String inputForm = request.getParameter("inputForm");//S:手動輸入 B:批次輸入

        /*手動輸入*/
        if (inputForm != null && inputForm.equals("S")) {
            String inputType = request.getParameter("inputType"); //0:行政区域 1:经纬海拔
            String areaName = request.getParameter("areaName"); //行政区域
            String observeSite = request.getParameter("observeSite"); //观测站点关系 1:单一站点 2:多站点代表
            String longLaAl = request.getParameter("longLaAl");//  经纬海拔
            String siteRadius = request.getParameter("siteRadius");//半径(km)
            String surveyName = request.getParameter("surveyName");//经纬度命名
            out.print("命名保存成功");
        } else if (inputForm != null && inputForm.equals("B")) {
            String eventId = request.getParameter("eventId"); //输入活动代码或活动名称
            String siteName = request.getParameter("siteName"); //输入站点组名称
            String siteName2 = request.getParameter("siteName2"); //输入站点组名称
            String[] checkboxSite = request.getParameterValues("checkboxSite");
            String[] checkboxSite2 = request.getParameterValues("checkboxSite2");
            //上傳
            out.print("已保存至站点组" + siteName + "");

            //確認並返回
        } else if (inputForm != null && inputForm.equals("C")) {
           
            //上傳
            out.print("儲存成功");
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
