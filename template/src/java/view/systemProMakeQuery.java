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
 * @author Jean
 */
public class systemProMakeQuery extends HttpServlet {

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
        String itemCode = request.getParameter("itemCode"); //项目编号
        String customerId = request.getParameter("customerId"); //客户编号
        String salesDoc = request.getParameter("salesDoc"); //保单号
        String orderId = request.getParameter("orderId"); //订单号
        String validFrom = request.getParameter("validFrom"); //效时间（起
        String validEnd = request.getParameter("validEnd"); //效时间(迄)
        String productCode = request.getParameter("productCode"); //产品代码
        String premium = request.getParameter("premium"); //保费价格
        String lastName = request.getParameter("lastName"); //姓氏
        String name = request.getParameter("name"); //名称
        String currency = request.getParameter("currency"); //币种
        String mobile = request.getParameter("mobile"); //中国手机号
        String gender = request.getParameter("gender"); //性别

        try (PrintWriter out = response.getWriter()) {
            obj.put("itemCode", "201507011110066699586");
            obj.put("salesDoc", "2507150829");
             obj.put("prodName", "汇源高温险（北京市）");
            obj.put("orderDate", "2015/7/1 11:00");
            obj.put("validFrom", "2015/7/1 0:00");
            obj.put("validEnd", "2015/8/1 23:59");
            obj.put("orderState", "有效");
            arry.put(obj);
            obj = new JSONObject();
            obj.put("itemCode", "201507011110066699586");
            obj.put("salesDoc", "2507150829");
             obj.put("prodName", "汇源高温险（北京市）");
            obj.put("orderDate", "2015/7/1 11:00");
            obj.put("validFrom", "2015/7/1 0:00");
            obj.put("validEnd", "2015/8/1 23:59");
            obj.put("orderState", "有效");
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
