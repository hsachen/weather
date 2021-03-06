/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Jean
 */
@WebServlet(name = "itemQuery", urlPatterns = {"/itemQuery"})
public class itemQuery extends HttpServlet {

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
        JSONObject obj = new JSONObject();
        JSONArray arry = new JSONArray();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String projectCode = request.getParameter("projectCode"); //项目编号
        String validFrom = request.getParameter("validFrom"); //项目开始时间(起)
        String validFrom1 = request.getParameter("validFrom1"); //项目开始时间(迄)
        String customerId = request.getParameter("customerId"); //客户编号(迄)
        String validEnd = request.getParameter("validEnd"); //项目结束时间(迄)
        String validEnd1 = request.getParameter("validEnd1"); //项目结束时间(迄)
        String projectStatus = request.getParameter("projectStatus"); //项目状态(迄)
        String projectName = request.getParameter("projectName"); //项目名称关键字

        try (PrintWriter out = response.getWriter()) {
            obj.put("projectCode", "项目编号");
            obj.put("validFrom", "项目开始时间");
            obj.put("validEnd", "项目結束时间");
            obj.put("customerId", "客户编号");
            obj.put("projectStatus", "项目状态");
            obj.put("logTime", "修改时间");
            obj.put("logUser", "修改人");
            arry.put(obj);
            obj = new JSONObject();
            obj.put("projectCode", "项目编号");
            obj.put("validFrom", "项目开始时间");
            obj.put("validEnd", "项目結束时间");
            obj.put("customerId", "客户编号");
            obj.put("projectStatus", "项目状态");
            obj.put("logTime", "修改时间");
            obj.put("logUser", "修改人");
                arry.put(obj);
            out.print(arry);
            
        } catch (JSONException ex) {
            String a = ex.toString();
            System.out.print(ex);
            //      Logger.getLogger(itemQuery.class.getName()).log(Level.SEVERE, null, ex);
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
