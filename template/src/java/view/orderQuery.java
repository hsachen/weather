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
public class orderQuery extends HttpServlet {

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
        String orderId = request.getParameter("orderId"); //订单代码
        String orderDesc = request.getParameter("orderDesc"); //订单关键字
        String orderStatus = request.getParameter("orderStatus"); //订单状态
        String salesDoc = request.getParameter("salesDoc"); //保单号
        String productDate = request.getParameter("productDate"); //订单开始时间
        String orderDate = request.getParameter("orderDate"); //订单开始时间
        String orderDate1 = request.getParameter("orderDate1"); //订单开始时间

        try (PrintWriter out = response.getWriter()) {
            obj.put("orderId", "201507011110066699586"); //订单号
            obj.put("salesDoc", "2507150829"); //保单号
            obj.put("orderDesc", "汇源高温险（北京市）");
            obj.put("orderDate", "2015/7/2 11:00"); //保单成立日期
            obj.put("validFrom", "2015/7/2 0:00"); //承保时间(始)
            obj.put("validEnd", "2015/8/1 23:59");
            obj.put("orderStatus", "有效"); //订单状态
            obj.put("customerId", "123"); //客户编号
            obj.put("productID", "123");  //产品编号
            obj.put("lastName", "AA");  //客戶姓氏
            obj.put("firtName", "BB");  //名字
            obj.put("premium", "123");  //保费
            obj.put("currency", "$$");  //币别
            obj.put("mobile", "123456789");  //中国手机号
            obj.put("gender", "F");  //性别
            obj.put("happenTime", "2015/8/1 23:59");  //实际发生时间
            obj.put("returnTime", "2015/8/1 23:59");  //保险公司反馈接收时间
            obj.put("resultQuantity", "123");  //判赔触发量
            obj.put("resultNum", "123");  //当日最终发生值
            obj.put("siteCode", "123");  //依据站别代码
            obj.put("measurementUnit", "123");  //计量单位
            obj.put("resultJudgeNum", "123");  //客戶反饋判賠認定值
            obj.put("resultJudgeDesc", "123");  //客户反馈判赔认定说明
            obj.put("sysOrderDate", "2015/8/1 23:59");  //订单入系统时间
            obj.put("orderUpdateDate", "2015/8/1 23:59");  //订单更新时间
            obj.put("createBy", "123");  //建立记录账号
            obj.put("changeBy", "123");  //修改记录账号
            arry.put(obj);
            
            obj = new JSONObject();
           obj.put("orderId", "201507011110066699586"); //订单号
            obj.put("salesDoc", "2507150829"); //保单号
            obj.put("orderDesc", "汇源高温险（北京市）");
            obj.put("orderDate", "2015/7/1 11:00"); //保单成立日期
            obj.put("validFrom", "2015/7/1 0:00"); //承保时间(始)
            obj.put("validEnd", "2015/8/1 23:59");
            obj.put("orderStatus", "有效"); //订单状态
            obj.put("customerId", "123"); //客户编号
            obj.put("productID", "123");  //产品编号
            obj.put("lastName", "AA");  //客戶姓氏
            obj.put("firtName", "BB");  //名字
            obj.put("premium", "123");  //保费
            obj.put("currency", "$$");  //币别
            obj.put("mobile", "123456789");  //中国手机号
            obj.put("gender", "F");  //性别
            obj.put("happenTime", "2015/8/1 23:59");  //实际发生时间
            obj.put("returnTime", "2015/8/1 23:59");  //保险公司反馈接收时间
            obj.put("resultQuantity", "123");  //判赔触发量
            obj.put("resultNum", "123");  //当日最终发生值
            obj.put("siteCode", "123");  //依据站别代码
            obj.put("measurementUnit", "123");  //计量单位
            obj.put("resultJudgeNum", "123");  //客戶反饋判賠認定值
            obj.put("resultJudgeDesc", "123");  //客户反馈判赔认定说明
            obj.put("sysOrderDate", "2015/8/1 23:59");  //订单入系统时间
            obj.put("orderUpdateDate", "2015/8/1 23:59");  //订单更新时间
            obj.put("createBy", "123");  //建立记录账号
            obj.put("changeBy", "123");  //修改记录账号
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
