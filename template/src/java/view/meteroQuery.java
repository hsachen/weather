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
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Z00907
 */
public class meteroQuery extends HttpServlet {

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
        JSONObject obj = new JSONObject();
        JSONArray arry = new JSONArray();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String metetoElementId = request.getParameter("metetoElementId"); //天气要素代码
        String metetoElementCN = request.getParameter("metetoElementCN"); //天气要素描述(中文)
        String metetoElementEN = request.getParameter("metetoElementEN"); //天气要素描述(英文)
           String standardVersion = request.getParameter("standardVersion"); //天气要素等级标准
              String metetoElementGrade = request.getParameter("metetoElementGrade"); //天气要素等级代码

        try (PrintWriter out = response.getWriter()) {
            obj.put("metetoElementId", "A1"); //天气要素代码
            obj.put("metetoElementCN", "溫度"); //天气要素描述(中文)
            obj.put("metetoElementEN", "ASV"); //天气要素描述(英文)
            obj.put("standardVersion", "DB"); //天气要素等级标准
            obj.put("metetoElementGrade", "2"); //天气要素等级代码
            obj.put("timeBase", "2015/05/06"); //等级衡量时间
            obj.put("timeBaseUnit", "C"); //等级衡量时间单位
            obj.put("operationUB", ">"); //操作符(上限)
            obj.put("operationLB", "<"); //操作符(下限)
            obj.put("triggerPointUB", "aa"); //>触发条件(上限)
            obj.put("triggerPointLB", "bb");//>触发条件(下限)
            obj.put("measureUnit", "1");//衡量基础单位

            arry.put(obj);
            obj = new JSONObject();
            obj.put("metetoElementId", "A2"); //天气要素代码
            obj.put("metetoElementCN", "溫度"); //天气要素描述(中文)
            obj.put("metetoElementEN", "ASV"); //天气要素描述(英文)
            obj.put("standardVersion", "DB"); //天气要素等级标准
            obj.put("metetoElementGrade", "2"); //天气要素等级代码
            obj.put("timeBase", "2015/05/06"); //等级衡量时间
            obj.put("timeBaseUnit", "C"); //等级衡量时间单位
            obj.put("operationUB", ">"); //操作符(上限)
            obj.put("operationLB", "<"); //操作符(下限)
            obj.put("triggerPointUB", "aa"); //>触发条件(上限)
            obj.put("triggerPointLB", "bb");//>触发条件(下限)
            obj.put("measureUnit", "1");//衡量基础单位

            arry.put(obj);
            out.print(arry);

        } catch (JSONException ex) {
            System.out.print(ex);
            //      Logger.getLogger(itemQuery.class.getName()).log(Level.SEVERE, null, ex);
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
