/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import tw.com.mode.vo.WeatherCalVo;
import tw.com.model.dao.data.getHistoryData;

/**
 *
 * @author Jean
 */
@WebServlet(name = "getData", urlPatterns = {"/getData"})
public class getData extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        getHistoryData getData = new getHistoryData();
        WeatherCalVo queryVo = new WeatherCalVo();
        String dateFrom = "2015/04/01";
         String dateEnd = "2015/04/20";
        try {
        //    Date d = new SimpleDateFormat("yyyy/MM/dd").parse(dateFrom);
            queryVo.setEventValidFrom(new SimpleDateFormat("yyyy/MM/dd").parse(dateFrom)); 
            queryVo.setEventValidEnd(new SimpleDateFormat("yyyy/MM/dd").parse(dateEnd));
            queryVo.setAssessmentYear(2);//計算年
            queryVo.setOperationRunningDay("=");
            queryVo.setRunningDay(1);
            queryVo.setOperationUB(null);
            queryVo.setOperationLB(">=");
            
            List list = getData.findHisttoryDataWithAlone(queryVo);

            Map map = null;
            JSONObject jsonObject = null;
            List jsonList = new ArrayList();
            for (int i = 0; i < list.size(); i++) {
                map = (Map) list.get(i);
                jsonObject = new JSONObject(map);
                jsonList.add(jsonObject);
            }
            JSONArray json = new JSONArray(jsonList);
            out.println(json.toString());
        } catch (ParseException e) {
            out.print("日期格式錯誤");
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
