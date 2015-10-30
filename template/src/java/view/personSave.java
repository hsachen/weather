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
public class personSave extends HttpServlet {

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
        String customerIndustry = request.getParameter("customerIndustry"); //客户分类代码
        String customerCode = request.getParameter("customerCode"); //客户分类代码
        String userId = request.getParameter("userId"); //用户名
        String userpwd = request.getParameter("userpwd"); //密码
        String userName = request.getParameter("userName"); //真实姓名
        String cellPhone = request.getParameter("cellPhone"); //手机号
        String eMail = request.getParameter("eMail"); //邮箱地址
        String validFrom = request.getParameter("validFrom"); //生效日期(起)址
        String validEnd = request.getParameter("validEnd"); //生效日期(迄)
        String userPrivilege = request.getParameter("userPrivilege"); //用户权限

        String aa = "";
        if (postType != null && postType.equals("add")) {
            /*新增*/
            out.print("用户新增成功");
        } else if (postType != null && postType.equals("edit")) {
            /*修改*/
            out.print("用户修改成功");
        } else if (postType != null && postType.equals("del")) {
            /*刪除*/
            String checkbox[] = request.getParameter("checkbox").split(",");
            for (String s : checkbox) {
                aa += s + ",";
            }
            out.print("用户刪除成功:" + aa);
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
