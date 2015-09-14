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
public class systemQuery extends HttpServlet {

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
        String itemCode = request.getParameter("itemCode"); //项目号代码
           String orderDate = request.getParameter("orderDate"); //保单建立日期
              String productDesc = request.getParameter("productDesc"); //产品描述关键字
        String customerCode = request.getParameter("customerCode"); //客户代码
        String validFrom = request.getParameter("validFrom"); //承保开始时间
        String validEnd = request.getParameter("validEnd"); //承保终止时间
        String productCode = request.getParameter("productCode"); //产品代码
        String orderStatus = request.getParameter("orderStatus"); //保单状态

        try (PrintWriter out = response.getWriter()) {
            obj.put("itemCode", "ZA20140001");
            obj.put("customerCode", "I000000001");
            obj.put("itemValidFrom", "2015/3/31 0:00");
            obj.put("itemValidEnd", "2015/7/31 23:59");
            obj.put("itemStatus", "启用");
            obj.put("itemOrderNum", "125687");
            obj.put("activityOrderNum", "414856");
            obj.put("operationStatusCode", "1"); //0:正常(綠色) 1:異常(紅色)
            obj.put("operationStatus", "同步运行异常");
            obj.put("payStatusCode", "1");//0:正常(綠色) 1:異常(紅色) 2:未處理(白色)
            obj.put("payStatus", "应结账");
            arry.put(obj);
            obj = new JSONObject();
           obj.put("itemCode", "ZA20140002");
            obj.put("customerCode", "I000000002");
            obj.put("itemValidFrom", "2015/3/31 0:00");
            obj.put("itemValidEnd", "2015/7/31 23:59");
            obj.put("itemStatus", "启用");
            obj.put("itemOrderNum", "125687");
            obj.put("activityOrderNum", "414856");
            obj.put("operationStatusCode", "0"); //0:正常(綠色) 1:異常(紅色)
            obj.put("operationStatus", "运行正常");
            obj.put("payStatusCode", "2");//0:正常(綠色) 1:異常(紅色) 2:未處理(白色)
            obj.put("payStatus", "未到对账日期");
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
