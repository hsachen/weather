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
public class adminSave extends HttpServlet {

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
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        String postType = request.getParameter("postType"); //增刪改查
        String areaCode1 = request.getParameter("areaCode1"); //行政区域代码
        String areaCode2 = request.getParameter("areaCode2"); //行政区域代码2
        String countryCN = request.getParameter("countryCN"); //>国名(中文)
        String countryEN = request.getParameter("countryEN"); //国名(英文)
        String fAreaCode = request.getParameter("fAreaCode"); //F_area_code
        String provinceCN = request.getParameter("provinceCN"); //省名(中文)
        String provinceEN = request.getParameter("provinceEN"); //省名(英文)
        String postCode = request.getParameter("postCode"); //邮政编码
        String areaCode = request.getParameter("areaCode"); //中国天气网区域代码
        String ciryCN = request.getParameter("ciryCN"); //城市名称(中文)
        String ciryEN = request.getParameter("ciryEN"); //城市名称(英文)
        String observeSiteId = request.getParameter("observeSiteId"); //实况观测站代码
        String forecastSiteId = request.getParameter("forecastSiteId"); //预报站代码
        String forecastASiteId = request.getParameter("forecastASiteId"); //预报替代站代码
        String radarId = request.getParameter("radarId"); //雷达站代码
        String longitude = request.getParameter("longitude"); //经度(行政区代表经度)
        String latitude = request.getParameter("latitude"); //纬度(行政区代表纬度)
        String altitude = request.getParameter("altitude"); //海拔高度(行政区代表海拔高度)

        String aa = "";
        if (postType != null && postType.equals("add")) {
            /*新增*/
            out.print("新增成功");
        } else if (postType != null && postType.equals("edit")) {
            /*修改*/
            out.print("修改成功");
        } else if (postType != null && postType.equals("check")) {
            /*審核*/
            out.print("審核成功");
        } else if (postType != null && postType.equals("del")) {
            /*刪除*/
            String checkbox[] = request.getParameter("checkbox").split(","); //FTP端口
            ;
            for (String s : checkbox) {
                aa += s + ",";
            }
            out.print("刪除成功:" + aa);
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
