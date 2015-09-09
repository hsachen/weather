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
public class activityQuery extends HttpServlet {

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
             response.setContentType("text/html;charset=UTF-8");
        JSONObject obj = new JSONObject();
        JSONArray arry = new JSONArray();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String productID = request.getParameter("productID"); //产品代码
        String productName = request.getParameter("productName"); //产品名称
        String EventId = request.getParameter("EventId"); //活动代码
        String EventName = request.getParameter("EventName"); //活动名称
        String submitDate = request.getParameter("submitDate"); //任务提交时间(起)
        String submitDate1 = request.getParameter("submitDate1"); //任务提交时间(迄)
        
        try (PrintWriter out = response.getWriter()) {
            obj.put("productID", "test_01");
            obj.put("productName", "测试");
            obj.put("EventId", "2000255002");
            obj.put("EventName", "测试雨01");
            obj.put("taskId", "200025500201");
            obj.put("taskStatus", "成功");
            obj.put("submitDate", "2014/11/16 21:51");
            arry.put(obj);
            obj = new JSONObject();
             obj.put("productID", "test_02");
            obj.put("productName", "测试");
            obj.put("EventId", "2000255002");
            obj.put("EventName", "测试雨01");
            obj.put("taskId", "200025500201");
            obj.put("taskStatus", "成功");
            obj.put("submitDate", "2014/11/16 21:51");;
            arry.put(obj);
            out.print(arry);
            

        } catch (JSONException ex) {
            String a = ex.toString();
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
