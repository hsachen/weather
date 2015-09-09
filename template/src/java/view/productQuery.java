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
public class productQuery extends HttpServlet {

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
        String projectCode = request.getParameter("projectCode"); //项目编号
        String customerId = request.getParameter("customerId"); //客户编号
        String productId = request.getParameter("productId"); //产品编号
        String CstpoductDec = request.getParameter("CstpoductDec"); //客户产品描述
        String productDate = request.getParameter("productDate"); //产品建立时间
        String productStatus = request.getParameter("productStatus"); //产品状态状态
        String changeTime = request.getParameter("changeTime"); //修改时间
        String changeBy = request.getParameter("changeBy"); //修改人

        try (PrintWriter out = response.getWriter()) {
            obj.put("projectCode", "ZA20140001");
            obj.put("customerId", "I000000001");
            obj.put("productId", "110000420");
            obj.put("CstpoductDec", "众安在线财产保险股份有限公司完美婚礼险");
            obj.put("productDate", "9999/12/31 23:59");
            obj.put("productStatus", "启用");
            obj.put("changeTime", "2014/11/16 21:51");
            obj.put("changeBy", "Alfred Luo");
            arry.put(obj);
            obj = new JSONObject();
            obj.put("projectCode", "ZA20140002");
            obj.put("customerId", "I000000001");
            obj.put("productId", "110000420");
            obj.put("CstpoductDec", "众安在线财产保险股份有限公司完美婚礼险");
            obj.put("productDate", "9999/12/31 23:59");
            obj.put("productStatus", "结算");
            obj.put("changeTime", "2014/11/16 21:51");
            obj.put("changeBy", "Alfred Luo");
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
