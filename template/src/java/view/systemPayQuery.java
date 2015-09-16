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
public class systemPayQuery extends HttpServlet {

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
        JSONObject obj = new JSONObject();
        JSONArray arry = new JSONArray();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        try (PrintWriter out = response.getWriter()) {
            obj.put("itemCode", "ZA20140001");
            obj.put("customerCode", "I000000001");
            obj.put("itemValidFrom", "2015/3/31 0:00");
            obj.put("itemValidEnd", "2015/7/31 23:59");
            obj.put("itemStatusCode", "0"); //0:紅色 1:白色 
            obj.put("itemStatus", "待结账");
            obj.put("currency", "RMB");
            arry.put(obj);
            obj = new JSONObject();
            obj.put("itemCode", "ZA20140002");
            obj.put("customerCode", "I000000002");
            obj.put("itemValidFrom", "2015/3/31 0:00");
            obj.put("itemValidEnd", "2015/7/31 23:59");
            obj.put("itemStatusCode", "1"); //0:紅色 1:白色 
            obj.put("itemStatus", "已结账");
            obj.put("currency", "RMB");
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
