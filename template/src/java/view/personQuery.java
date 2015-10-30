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
public class personQuery extends HttpServlet {

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
        processRequest(request, response);
        JSONObject obj = new JSONObject();
        JSONArray arry = new JSONArray();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String userId = request.getParameter("userId"); //用户名
        String userName = request.getParameter("userName"); //真实姓名
        String userPrivilege = request.getParameter("userPrivilege"); //用户权限


        try (PrintWriter out = response.getWriter()) {
                obj.put("customerIndustry", "保险公司");//客户分类代码
                  obj.put("customerCode", "123");  //客户代码
            obj.put("userId", "AAA000");//用户名
            obj.put("userpwd", "A123456");//密码
            obj.put("userName", "林小二");//真实姓名
            obj.put("cellPhone", "98654654");//手机号
            obj.put("eMail", "asda@gmail.com");//邮箱地址
            obj.put("userPrivilege", "全部权限（项目副总）");//用户权限

            arry.put(obj);
            obj = new JSONObject();
               obj.put("customerIndustry", "保险公司");//客户分类代码
                  obj.put("customerCode", "456");  //客户代码
            obj.put("userId", "BBB000");//用户名
            obj.put("userpwd", "A123456");//密码
            obj.put("userName", "林小二");//真实姓名
            obj.put("cellPhone", "98654654");//手机号
            obj.put("eMail", "asda@gmail.com");//邮箱地址
            obj.put("userPrivilege", "全部权限（项目经理）");//用户权限
            
            arry.put(obj);
            out.print(arry);

        } catch (JSONException ex) {
            System.out.print(ex);
            //      Logger.getLogger(itemQuery.class.getName()).log(Level.SEVERE, null, ex);
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
