/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Z00907
 */
public class riskInputSave extends HttpServlet {

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
//        String inputForm = request.getParameter("inputForm");//S:手動輸入 B:批次輸入

//        /*手動輸入*/
//        if (inputForm != null && inputForm.equals("S")) {
//            String inputType = request.getParameter("inputType"); //0:行政区域 1:经纬海拔
//            String areaName = request.getParameter("areaName"); //行政区域
//            String observeSite = request.getParameter("observeSite"); //观测站点关系 1:单一站点 2:多站点代表
//            String longLaAl = request.getParameter("longLaAl");//  经纬海拔
//            String siteRadius = request.getParameter("siteRadius");//半径(km)
//            String surveyName = request.getParameter("surveyName");//经纬度命名
//            String posttype = request.getParameter("posttype");
//            String id = request.getParameter("id");
//            if (posttype != null && posttype.equals("del")) {
//                out.print("命名刪除成功");
//            } else {
//                out.print("命名保存成功");
//            }
//
//        } else if (inputForm != null && inputForm.equals("B")) {
//            String eventInput = request.getParameter("eventInput"); //输入活动代码或活动名称
//            String siteName = request.getParameter("siteName"); //输入站点组名称
//            String siteName2 = request.getParameter("siteName2"); //输入站点组名称
//            String[] checkboxSite = request.getParameterValues("checkboxSite");
//            String[] checkboxSite2 = request.getParameterValues("checkboxSite2");
//            //上傳
//            out.print("已保存至站点组" + siteName + "");
//
//            //確認並返回
//        } else if (inputForm != null && inputForm.equals("C")) {
//
//            //上傳
//            out.print("儲存成功");
//        }
        String v = request.getParameter("v");
        String[] checkboxSite = request.getParameterValues("checkboxSite"); //站點
        String validFromYear = request.getParameter("validFromYear");
        String validFromMonth = request.getParameter("validFromMonth");
        String validFromDay = request.getParameter("validFromDay");
        String validEndYear = request.getParameter("validEndYear");
        String validEndMonth = request.getParameter("validEndMonth");
        String validEndDay = request.getParameter("validEndDay");
        String historyYear = request.getParameter("historyYear"); //历史年数
        String operationRunningDay = request.getParameter("operationRunningDay"); //事件时长
        String runningDay = request.getParameter("runningDay"); //天
        String statisticMethod = request.getParameter("statisticMethod"); //阈值统计方法
        String elementMethod = request.getParameter("elementMethod"); //要素是否累加
        String countNo = request.getParameter("countNo");
        ArrayList elementType = new ArrayList();
        ArrayList meteroElement = new ArrayList();
        ArrayList operationLB = new ArrayList();
        ArrayList triggerPointLB = new ArrayList();
        ArrayList operationUB = new ArrayList();
        ArrayList triggerPointUB = new ArrayList();
        ArrayList operationGrade = new ArrayList();
        ArrayList meteroElementGrade = new ArrayList();
        int i;
        
        for (i = 1; i <= Integer.parseInt(countNo); i++) {
            elementType.add(request.getParameter("observeSite" + i));
            meteroElement.add(request.getParameter("meteroElement" + i));
            operationLB.add(request.getParameter("operationLB" + i));
            triggerPointLB.add(request.getParameter("triggerPointLB" + i));
            operationUB.add(request.getParameter("operationUB" + i));
            triggerPointUB.add(request.getParameter("triggerPointUB" + i));
            operationGrade.add(request.getParameter("operationGrade" + i));
            meteroElementGrade.add(request.getParameter("meteroElementGrade" + i));
            
        }
        
        if (v != null && v.equals("0")) {
            String areaName = request.getParameter("areaName");
            String observeSite = request.getParameter("observeSite");
        } else if (v != null && v.equals("1")) {
            String surveyName[] = request.getParameterValues("surveyName");
            String lng[] = request.getParameterValues("lng");
            String la[] = request.getParameterValues("la");
            String al[] = request.getParameterValues("al");
            String siteRadius[] = request.getParameterValues("siteRadius");
        } else if (v != null && v.equals("2")) {
            String eventInput = request.getParameter("eventInput");
        }
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
