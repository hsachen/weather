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
public class observeSiteQuery extends HttpServlet {

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
        String observeSiteId = request.getParameter("observeSiteId"); //实况观测站站号
        String observeSiteType = request.getParameter("observeSiteType"); //观测站类别
        String observeSiteName = request.getParameter("observeSiteName"); //站点名称
        String status = request.getParameter("status"); //观测站状态
        String evaluationFlag = request.getParameter("evaluationFlag"); //是否为考核站
        String weatherCNSiteId = request.getParameter("weatherCNSiteId"); //中国天气网预报编码

        try (PrintWriter out = response.getWriter()) {
            obj.put("observeSiteId", "AAA000"); //实况观测站站号
            obj.put("observeSiteType", "1");//观测站类别
               obj.put("observeSiteTypeDesc", "人工观测站-基本站");//观测站类别
            obj.put("observeSiteName", "北京"); //站点名称
            obj.put("longitude", "100.5"); // 经度
            obj.put("latitude", "99.9"); //纬度
            obj.put("altitude", "200"); //海拔高度
            obj.put("stationLevel", "200"); //台站等级
            obj.put("areaCode1", "123456"); //站点所在行政区域代码
            obj.put("areaCode2", "654321"); //站点所在行政区域代码
            obj.put("postCode", "402"); //邮递区号
            obj.put("status", "1"); //观测站状态
            obj.put("validFrom", "2015/10/22"); //有效时间(起)
            obj.put("validEnd", "2015/10/22"); //有效时间(讫)
            obj.put("weatherCNSiteId", "222222"); //中国天气网预报编码
            obj.put("forecastAsite1", "预报替代站1"); //预报替代站1
            obj.put("forecastAsite2", "预报替代站2"); //预报替代站2
            obj.put("forecastAsite3", "预报替代站3"); //预报替代站3
            obj.put("temperatureC", "C"); //摄氏温度标示
            obj.put("temperatureAsite1", "摄氏温度替代站1"); //摄氏温度替代站1
            obj.put("temperatureAsite2", "摄氏温度替代站2"); //摄氏温度替代站2
            obj.put("temperatureAsite3", "摄氏温度替代站3"); //摄氏温度替代站3
            obj.put("windAsite1", "风观测替代站1"); //风观测替代站1
            obj.put("windAsite2", "风观测替代站2"); //风观测替代站2
            obj.put("windAsite3", "风观测替代站3"); //风观测替代站3
            obj.put("windDirectionC", "X"); //向标示
            obj.put("windGradeC", "mm"); //风力等级标示
            obj.put("windSpeedC", "aa"); //风速标示
            obj.put("rhC", "aa"); //相对湿度标示
            obj.put("rhAsite1", "相对湿度替代站1"); //相对湿度替代站1
            obj.put("rhAsite2", "相对湿度替代站2"); //相对湿度替代站2
            obj.put("rhAsite3", "相对湿度替代站3"); //相对湿度替代站3
            obj.put("vibilityC", "能见度标示"); //能见度标示
            obj.put("vibilityAsite1", "能见度替代站1"); //能见度替代站1
            obj.put("vibilityAsite2", "能见度替代站2"); //能见度替代站2
            obj.put("vibilityAsite3", "能见度替代站3"); //能见度替代站3
            obj.put("precipitation1C", "10"); //一小时累积降水标示
            obj.put("precipitation6C", "60"); //六小时累积降水标示
            obj.put("precipitation12C", "120"); //十二小时累积降水标示
            obj.put("precipitation24C", "240"); //二十四小时累积降水标示
            obj.put("precipitationAsite1", "降水量替代站1"); //降水量替代站1
            obj.put("precipitationAsite2", "降水量替代站2"); //降水量替代站2
            obj.put("precipitationAsite3", "降水量替代站3"); //降水量替代站3
            obj.put("atmoPreesureC", "大气压力标示"); //大气压力标示
            obj.put("atmoPreesureAsite1", "大气压力替代站1"); //大气压力替代站1
            obj.put("atmoPreesureAsite2", "大气压力替代站2"); //大气压力替代站2
            obj.put("atmoPreesureAsite3", "大气压力替代站3"); //大气压力替代站3
            obj.put("evaporationC", "蒸发量标示"); //蒸发量标示
            obj.put("evaporationAsite1", "蒸发量替代站1"); //蒸发量替代站1
            obj.put("evaporationAsite2", "蒸发量替代站2"); //蒸发量替代站2
            obj.put("evaporationAsite3", "蒸发量替代站3"); //蒸发量替代站3
            obj.put("sunHourC", "日照时长标示"); //日照时长标示
            obj.put("sunHourAsite1", "日照时长替代站1"); //日照时长替代站1
            obj.put("sunHourAsite2", "日照时长替代站2"); //日照时长替代站2
            obj.put("sunHourAsite3", "日照时长替代站3"); //日照时长替代站3
            obj.put("zeroCmGrandTempC", "0CM地温摄氏标示"); //0CM地温摄氏标示
            obj.put("phenomenaC", "天气现象标示"); //天气现象标示
            obj.put("aqiC", "空气质量指标标示"); //空气质量指标标示
            obj.put("pm10C", "PM10标示"); //PM10标示
            obj.put("pm25C", "PM2.5标示"); //PM2.3标示
            obj.put("aqSite1", "空气质量替代站1"); //空气质量替代站1
            obj.put("aqSite2", "空气质量替代站2"); //空气质量替代站2
            obj.put("aqSite3", "空气质量替代站3"); //空气质量替代站3

            obj.put("statusDesc", "不可用");//观测站状态

            arry.put(obj);
            obj = new JSONObject();
            obj.put("observeSiteId", "AAA002"); //实况观测站站号
                  obj.put("observeSiteType", "2");//观测站类别
               obj.put("observeSiteTypeDesc", "人工观测站-基本站");//观测站类别
            obj.put("observeSiteName", "上海"); //站点名称
            obj.put("longitude", "100.5"); // 经度
            obj.put("latitude", "99.9"); //纬度
            obj.put("altitude", "200"); //海拔高度
            obj.put("stationLevel", "200"); //台站等级
            obj.put("areaCode1", "123456"); //站点所在行政区域代码
            obj.put("areaCode2", "654321"); //站点所在行政区域代码
            obj.put("postCode", "402"); //邮递区号
            obj.put("status", "1"); //观测站状态
            obj.put("validFrom", "2015/10/22"); //有效时间(起)
            obj.put("validEnd", "2015/10/22"); //有效时间(讫)
            obj.put("weatherCNSiteId", "222222"); //中国天气网预报编码
            obj.put("forecastAsite1", "预报替代站1"); //预报替代站1
            obj.put("forecastAsite2", "预报替代站2"); //预报替代站2
            obj.put("forecastAsite3", "预报替代站3"); //预报替代站3
            obj.put("temperatureC", "C"); //摄氏温度标示
            obj.put("temperatureAsite1", "摄氏温度替代站1"); //摄氏温度替代站1
            obj.put("temperatureAsite2", "摄氏温度替代站2"); //摄氏温度替代站2
            obj.put("temperatureAsite3", "摄氏温度替代站3"); //摄氏温度替代站3
            obj.put("windAsite1", "风观测替代站1"); //风观测替代站1
            obj.put("windAsite2", "风观测替代站2"); //风观测替代站2
            obj.put("windAsite3", "风观测替代站3"); //风观测替代站3
            obj.put("windDirectionC", "X"); //向标示
            obj.put("windGradeC", "mm"); //风力等级标示
            obj.put("windSpeedC", "aa"); //风速标示
            obj.put("rhC", "aa"); //相对湿度标示
            obj.put("rhAsite1", "相对湿度替代站1"); //相对湿度替代站1
            obj.put("rhAsite2", "相对湿度替代站2"); //相对湿度替代站2
            obj.put("rhAsite3", "相对湿度替代站3"); //相对湿度替代站3
            obj.put("vibilityC", "能见度标示"); //能见度标示
            obj.put("vibilityAsite1", "能见度替代站1"); //能见度替代站1
            obj.put("vibilityAsite2", "能见度替代站2"); //能见度替代站2
            obj.put("vibilityAsite3", "能见度替代站3"); //能见度替代站3
            obj.put("precipitation1C", "10"); //一小时累积降水标示
            obj.put("precipitation6C", "60"); //六小时累积降水标示
            obj.put("precipitation12C", "120"); //十二小时累积降水标示
            obj.put("precipitation24C", "240"); //二十四小时累积降水标示
            obj.put("precipitationAsite1", "降水量替代站1"); //降水量替代站1
            obj.put("precipitationAsite2", "降水量替代站2"); //降水量替代站2
            obj.put("precipitationAsite3", "降水量替代站3"); //降水量替代站3
            obj.put("atmoPreesureC", "大气压力标示"); //大气压力标示
            obj.put("atmoPreesureAsite1", "大气压力替代站1"); //大气压力替代站1
            obj.put("atmoPreesureAsite2", "大气压力替代站2"); //大气压力替代站2
            obj.put("atmoPreesureAsite3", "大气压力替代站3"); //大气压力替代站3
            obj.put("evaporationC", "蒸发量标示"); //蒸发量标示
            obj.put("evaporationAsite1", "蒸发量替代站1"); //蒸发量替代站1
            obj.put("evaporationAsite2", "蒸发量替代站2"); //蒸发量替代站2
            obj.put("evaporationAsite3", "蒸发量替代站3"); //蒸发量替代站3
            obj.put("sunHourC", "日照时长标示"); //日照时长标示
            obj.put("sunHourAsite1", "日照时长替代站1"); //日照时长替代站1
            obj.put("sunHourAsite2", "日照时长替代站2"); //日照时长替代站2
            obj.put("sunHourAsite3", "日照时长替代站3"); //日照时长替代站3
            obj.put("zeroCmGrandTempC", "0CM地温摄氏标示"); //0CM地温摄氏标示
            obj.put("phenomenaC", "天气现象标示"); //天气现象标示
            obj.put("aqiC", "空气质量指标标示"); //空气质量指标标示
            obj.put("pm10C", "PM10标示"); //PM10标示
            obj.put("pm25C", "PM2.5标示"); //PM2.3标示
            obj.put("aqSite1", "空气质量替代站1"); //空气质量替代站1
            obj.put("aqSite2", "空气质量替代站2"); //空气质量替代站2
            obj.put("aqSite3", "空气质量替代站3"); //空气质量替代站3
            
             obj.put("statusDesc", "不可用");//观测站状态
            arry.put(obj);
            out.print(arry);

        } catch (JSONException ex) {
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
