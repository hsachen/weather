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
public class adminQuery extends HttpServlet {

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
        String countryCN = request.getParameter("areaCode1"); //行政区域代码
        String provinceCN = request.getParameter("provinceCN"); //中文省名
        String provinceEN = request.getParameter("provinceEN"); //英文省名
        String areaCode = request.getParameter("areaCode"); //中国天气网区域代码
        String postCode = request.getParameter("postCode"); //邮政编码

        try (PrintWriter out = response.getWriter()) {
            obj.put("areaCode1", "AAA000");
            obj.put("areaCode2", "AAA001");
            obj.put("countryCN", "A0001");
            obj.put("countryEN", "A0001");
            obj.put("fAreaCode", "fAreaCode");
            obj.put("provinceCN", "北京");
            obj.put("provinceEN", "北京");
            obj.put("postCode", "1234");
            obj.put("areaCode", "2567");
            obj.put("cityCN", "北京");
            obj.put("cityEN", "北京");
            obj.put("observeSiteId", "123456");
            obj.put("forecastSiteId", "123456");
            obj.put("forecastSiteId", "654321");
            obj.put("radarId", "111");
            obj.put("longitude", "150");
            obj.put("latitude", "300");
            obj.put("altitude", "600");
            arry.put(obj);
            obj = new JSONObject();
            obj.put("areaCode1", "BBB000");
            obj.put("areaCode2", "BBB001");
            obj.put("countryCN", "A0002");
            obj.put("countryEN", "A0001");
            obj.put("fAreaCode", "fAreaCode");
            obj.put("provinceCN", "上海");
            obj.put("provinceEN", "上海");
            obj.put("postCode", "1234");
            obj.put("areaCode", "2567");
            obj.put("cityCN", "上海");
            obj.put("cityEN", "上海");
             obj.put("observeSiteId", "123456");
            obj.put("forecastSiteId", "123456");
            obj.put("forecastSiteId", "654321");
            obj.put("radarId", "111");
            obj.put("longitude", "150");
            obj.put("latitude", "300");
            obj.put("altitude", "600");
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
