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
public class customerContactQuey extends HttpServlet {

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
        String customerIndustry = request.getParameter("customerIndustry"); //客户分类代码
        String customerCode = request.getParameter("customerCode"); //客户代码
        String customerName = request.getParameter("customerName"); //客户名称
        String customerAbb = request.getParameter("customerAbb"); //客户英文简称
        String contactPerson = request.getParameter("contactPerson"); //联系人

        try (PrintWriter out = response.getWriter()) {
            obj.put("customerIndustry", "456");  //客户分类代码
            obj.put("customerCode", "123");  //客户代码
            obj.put("customerName", "AAA000");//客户名称
            obj.put("customerSortName", "AAA000");//客户简称
            obj.put("customerAbb", "SSaaa");//客户英文简称
            obj.put("contactPerson", "林小二");//联系人
            obj.put("contactNumber", "021456");//联系电话
            obj.put("invoiceAddress", "XXXXX");//发票地址
            obj.put("sftpAccountId", "Aaaaa");//SFTP帐号
            obj.put("sftpAccountPsw", "asdf");//SFTP密码
            obj.put("sftpAccountIP4", "1234");//SFTP IP(IPV4)
            obj.put("sftpAccountIP6", "5678");//SFTP IP(IPV4)
            obj.put("sftpAccountPath", "SSS");//路徑
            arry.put(obj);

            obj = new JSONObject();
            obj.put("customerIndustry", "123");  //客户分类代码
            obj.put("customerCode", "123");  //客户代码
            obj.put("customerName", "AAA000");//客户名称
            obj.put("customerSortName", "AAA000");//客户简称
            obj.put("customerAbb", "SSSaaa");//客户英文简称
            obj.put("contactPerson", "林小二");//联系人
            obj.put("contactNumber", "021456");//联系电话
            obj.put("invoiceAddress", "XXXXX");//发票地址
            obj.put("sftpAccountId", "Aaaaa");//SFTP帐号
            obj.put("sftpAccountPsw", "asdf");//SFTP密码
            obj.put("sftpAccountIP4", "1234");//SFTP IP(IPV4)
            obj.put("sftpAccountIP6", "5678");//SFTP IP(IPV4)
            obj.put("sftpAccountPath", "SSS");//SFTP路徑

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
