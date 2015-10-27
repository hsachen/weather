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
 * @author Jean
 */
public class observeSiteSave extends HttpServlet {

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
        String observeSiteId = request.getParameter("observeSiteId"); //实况观测站站号
        String observeSiteType = request.getParameter("observeSiteType"); //观测站类别
        String observeSiteName = request.getParameter("observeSiteName"); //>站点名称
        String countryEN = request.getParameter("countryEN"); //国名(英文)
        String longitude = request.getParameter("longitude"); //经度
        String latitude = request.getParameter("latitude"); //纬度
        String altitude = request.getParameter("altitude"); //海拔高度
        String stationLevel = request.getParameter("stationLevel"); //台站等级
        String areaCode1 = request.getParameter("areaCode1"); //站点所在行政区域代码;前六码
        String areaCode2 = request.getParameter("areaCode2"); //站点所在行政区域代码;后六码
        String postCode = request.getParameter("postCode"); //邮递区号
        String evaluationFlag = request.getParameter("evaluationFlag"); //是否为考核站
        String status = request.getParameter("status"); //观测站状态
        String validFrom = request.getParameter("validFrom"); //有效时间(起)
        String validEnd = request.getParameter("validEnd"); //有效时间(讫)
        String weatherCNSiteId = request.getParameter("weatherCNSiteId"); //中国天气网预报编码
        String forecastAsite1 = request.getParameter("forecastAsite1"); //预报替代站1
        String forecastAsite2 = request.getParameter("forecastAsite2"); //预报替代站2
        String forecastAsite3 = request.getParameter("forecastAsite3"); //预报替代站3
        String temperatureC = request.getParameter("temperatureC"); //摄氏温度标示;负数表示不可用
        String temperatureAsite1 = request.getParameter("temperatureAsite1"); //摄氏温度替代站1
        String temperatureAsite2 = request.getParameter("temperatureAsite2"); //>摄氏温度替代站2
        String temperatureAsite3 = request.getParameter("temperatureAsite3"); //摄氏温度替代站3
        String windAsite1 = request.getParameter("windAsite1"); //风观测替代站1
        String windAsite2 = request.getParameter("windAsite2"); //风观测替代站2
        String windAsite3 = request.getParameter("windAsite3"); //风观测替代站3
        String windDirectionC = request.getParameter("windDirectionC"); //向标示;负数表示不可用
        String windGradeC = request.getParameter("windGradeC"); //风力等级标示;负数表示不可用
        String windSpeedC = request.getParameter("windSpeedC"); //风速标示;负数表示不可用
        String rhC = request.getParameter("rhC"); //相对湿度标示
        String rhAsite1 = request.getParameter("rhAsite1"); //相对湿度替代站1
        String rhAsite2 = request.getParameter("rhAsite2"); //相对湿度替代站2
        String rhAsite3 = request.getParameter("rhAsite3"); //相对湿度替代站3
        String vibilityC = request.getParameter("vibilityC"); //能见度标示
        String vibilityAsite1 = request.getParameter("vibilityAsite1"); //能见度替代站1
        String vibilityAsite2 = request.getParameter("vibilityAsite2"); //能见度替代站2
        String vibilityAsite3 = request.getParameter("vibilityAsite3"); //能见度替代站3
        String precipitation1C = request.getParameter("precipitation1C"); //一小时累积降水标示
        String precipitation6C = request.getParameter("precipitation6C"); //六小时累积降水标示
        String precipitation12C = request.getParameter("precipitation12C"); //十二小时累积降水标示
        String precipitation24C = request.getParameter("precipitation24C"); //>二十四小时累积降水标示
        String precipitationAsite1 = request.getParameter("precipitationAsite1"); //降水量替代站1
        String precipitationAsite2 = request.getParameter("precipitationAsite2"); //降水量替代站2
        String precipitationAsite3 = request.getParameter("precipitationAsite3"); //降水量替代站3
        String atmoPreesureC = request.getParameter("atmoPreesureC"); //大气压力标示
        String atmoPreesureAsite1 = request.getParameter("atmoPreesureAsite1"); //大气压力替代站1
        String atmoPreesureAsite2 = request.getParameter("atmoPreesureAsite2"); //大气压力替代站2
        String atmoPreesureAsite3 = request.getParameter("atmoPreesureAsite3"); //大气压力替代站3
        String evaporationC = request.getParameter("evaporationC"); //蒸发量标示
        String evaporationAsite1 = request.getParameter("evaporationAsite1"); //蒸发量替代站1
        String evaporationAsite2 = request.getParameter("evaporationAsite2"); //蒸发量替代站2
        String evaporationAsite3 = request.getParameter("evaporationAsite3"); //蒸发量替代站3
        String sunHourC = request.getParameter("sunHourC"); //日照时长标示
        String sunHourAsite1 = request.getParameter("sunHourAsite1"); //日照时长替代站1
        String sunHourAsite2 = request.getParameter("sunHourAsite2"); //日照时长替代站2
        String sunHourAsite3 = request.getParameter("sunHourAsite3"); //日照时长替代站3
        String zeroCmGrandTempC = request.getParameter("zeroCmGrandTempC"); //0CM地温摄氏标示
        String phenomenaC = request.getParameter("phenomenaC"); //天气现象标示
        String aqiC = request.getParameter("aqiC"); //空气质量指标标示
        String pm10C = request.getParameter("pm10C"); //PM10标示
        String pm25C = request.getParameter("pm25C"); //PM2.5标示
        String aqSite1 = request.getParameter("aqSite1"); //空气质量替代站1
        String aqSite2 = request.getParameter("aqSite2"); //空气质量替代站2
        String aqSite3 = request.getParameter("aqSite3"); //空气质量替代站3

        String aa = "";
        if (postType != null && postType.equals("add")) {
            /*新增*/
            out.print("新增站點成功");
        } else if (postType != null && postType.equals("edit")) {
            /*修改*/
            out.print("修改站點成功");
        } else if (postType != null && postType.equals("del")) {
            /*刪除*/
            String checkbox[] = request.getParameter("checkbox").split(","); //FTP端口
            ;
            for (String s : checkbox) {
                aa += s + ",";
            }
            out.print("刪除站點成功:" + aa);
        }else if (postType != null && postType.equals("upload")) {
            /*上傳*/
            out.print("上傳成功");
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
