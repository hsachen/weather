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
 * @author Z00907
 */
public class customerContactSave extends HttpServlet {

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
        String customerCode = request.getParameter("customerCode"); //客户代码
        String customerName = request.getParameter("customerName"); //客户名称
        String customerSortName = request.getParameter("customerSortName"); //客户简称
        String customerAbb = request.getParameter("customerAbb"); //客户英文简称
        String contactPerson = request.getParameter("contactPerson"); //联系人
        String contactNumber = request.getParameter("contactNumber"); //联系电话
        String invoiceAddress = request.getParameter("invoiceAddress"); //发票地址
        String sftpAccountId = request.getParameter("sftpAccountId"); //SFTP帐号
        String sftpAccountPsw = request.getParameter("sftpAccountPsw"); //SFTP密码
        String sftpAccountIP4 = request.getParameter("sftpAccountIP4"); //SFTP IP(IPV4)
        String sftpAccountIP6 = request.getParameter("sftpAccountIP6"); //SFTP IP(IPV6)
        String sftpAccountPath = request.getParameter("sftpAccountPath"); //SFTP路徑

        String aa = "";
        if (postType != null && postType.equals("add")) {
            /*新增*/
            out.print("客户联系人新增成功");
        } else if (postType != null && postType.equals("edit")) {
            /*修改*/
            out.print("客户联系人修改成功");
        } else if (postType != null && postType.equals("del")) {
            /*刪除*/
            String checkbox[] = request.getParameter("checkbox").split(",");
            for (String s : checkbox) {
                aa += s + ",";
            }
            out.print("客户联系人刪除成功:" + aa);
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
