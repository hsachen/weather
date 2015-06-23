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
import tw.com.mode.vo.WeatherCalVo;
import tw.com.model.dao.data.riskAssessment;

/**
 *
 * @author Jean
 */
@WebServlet(name = "getData", urlPatterns = {"/getData"})
public class FspWeatherAssess extends HttpServlet {

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
        riskAssessment getData = new riskAssessment();
        WeatherCalVo queryVo = new WeatherCalVo();
        JSONObject jObj = new JSONObject();
        String dateFrom = "2015/05/01";
        String dateEnd = "2015/05/20";

        try {
           // String para_piProductH = request.getParameter("piProductH");
            String para_piProductH = "{\"piProductH\":{\"assessmentYears\":\"2\","
                    + "\"elementethod\":\"\",\"eventDescription\":\"新测试雨01\""
                    + ",\"eventId\":\"2000245002\",\"eventSDescription\":\"新测试雨01\""
                    + ",\"eventValidEnd\":\"2015-06-30 12:16:00\",\"eventValidFrom\":\"2015-06-01 12:16:00\""
                    + ",\"operationRunningDays\":\"=\",\"pkiCode\":\"\",\"productId\":\"r_001\""
                    + ",\"productName\":\"降雨01\",\"returnVariable\":\"4\","
                    + "\"runningDays\":\"1\",\"statisticMethod\":\"1\"}}"; 
          //  String para_piProductH = "{\"assessmentYears\":\"20\"}";
           // String para_piTimeSpace = request.getParameter("piTimeSpace");
           // String para_piProductI = request.getParameter("piProductI");
            JSONObject piProductH = new JSONObject(para_piProductH);
           // JSONObject piTimeSpace = jObj.getJSONObject(para_piTimeSpace);
           // JSONObject piProductI = jObj.getJSONObject(para_piProductI);
            queryVo.setEventId(piProductH.getJSONObject("piProductH").getString("eventId"));
            queryVo.setEventName(piProductH.getJSONObject("piProductH").getString("eventDescription"));
            queryVo.setProductId(piProductH.getJSONObject("piProductH").getString("productId"));
            queryVo.setProductName(piProductH.getJSONObject("piProductH").getString("productName"));

            //    Date d = new SimpleDateFormat("yyyy/MM/dd").parse(dateFrom);
            queryVo.setAreaCode("110000");
            queryVo.setEventValidFrom(new SimpleDateFormat("yyyy/MM/dd").parse(dateFrom));
            queryVo.setEventValidEnd(new SimpleDateFormat("yyyy/MM/dd").parse(dateEnd));
            queryVo.setAssessmentYear(Integer.parseInt(piProductH.getJSONObject("piProductH").getString("assessmentYears")));//計算年
          //  queryVo.setAssessmentYear(20);//計算年
            queryVo.setOperationRunningDay("=");
            queryVo.setRunningDay(1);
            queryVo.setMeteroElement("10");
            queryVo.setOperationUB(null);
            queryVo.setOperationLB(">=");
            queryVo.setTrigerPointUB(null);
            queryVo.setTrigerPointLB("50");
            queryVo.setMeasureUnit("mm");
            queryVo.setStatisticMethod("1");
            queryVo.setElementMethod("10");
            queryVo.setReturnVarible("1");
            queryVo.setElementMethod(" ");

          //  List list = new ArrayList();
          //  list.add(getData.findHistoryData(queryVo));
            List list = getData.findHistoryData(queryVo);
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
        } catch (JSONException ex) {
            out.print("json格式錯誤");
            System.out.print(ex.toString());
            Logger.getLogger(FspWeatherAssess.class.getName()).log(Level.SEVERE, null, ex);
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
