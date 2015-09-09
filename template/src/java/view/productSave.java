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
public class productSave extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        
        String postType = request.getParameter("postType"); //增刪改查
        String projectCode = request.getParameter("projectCode"); //项目编号
        String cstEstProductId = request.getParameter("cstEstProductId"); //试算产品代码
        String customerId = request.getParameter("customerId"); //客户编号
        String projectName = request.getParameter("projectName"); //项目名称
        String cstEventId = request.getParameter("cstEventId"); //试算活动代码
        String validFrom = request.getParameter("validFrom"); //项目开始时间
        String projectStatus = request.getParameter("projectStatus"); //项目状态
        String insuranceID = request.getParameter("insuranceID"); //保险代码
        String validEnd = request.getParameter("validEnd"); //项目结束时间
        String insuranceBaseTime = request.getParameter("insuranceBaseTime"); //承保基础时间
        String currency = request.getParameter("currency"); //币别
        String contactPerson = request.getParameter("contactPerson"); //客户联系人
        String invoiceAddress = request.getParameter("invoiceAddress"); //联系人邮箱
        String contactNumber = request.getParameter("contactNumber"); //联系人电话
        String security = request.getParameter("security"); //同步是否加密
        String encryption = request.getParameter("encryption"); //加密脚本
        String decryption = request.getParameter("decryption"); //解密脚本
        /**
         * 產品
         */
        String prodSyncMethod = request.getParameter("prodSyncMethod"); //产品同步方式
        String prodSyncProperty = request.getParameter("prodSyncProperty"); //产品同步属性
        String prodSyncOnTime = request.getParameter("prodSyncOnTime"); //指定整点同步
        String prodFtpAddress = request.getParameter("prodFtpAddress"); //同步FTP地址
        String prodFtpName = request.getParameter("prodFtpName"); //FTP用户名
        String prodFtpPassword = request.getParameter("prodFtpPassword"); //FTP密码
        String prodFtpPort = request.getParameter("prodFtpPort"); //FTP端口
        String prodSyncPath = request.getParameter("prodSyncPath"); //产品同步路径
        /**
         * 保單
         */
        String soSyncMethod = request.getParameter("soSyncMethod"); //保单同步方式
        String soSyncProperty = request.getParameter("soSyncProperty"); //保单同步属性
        String sodSyncOnTime = request.getParameter("sodSyncOnTime"); //保单整点同步
        String soFtpAddress = request.getParameter("soFtpAddress"); //同步FTP地址
        String soFtpName = request.getParameter("soFtpName"); //FTP用户名
        String soFtpPassword = request.getParameter("soFtpPassword"); //FTP密码
        String soFtpPort = request.getParameter("soFtpPort"); //FTP端口
        String soSyncPath = request.getParameter("soSyncPath"); //产品同步路径
        /**
         * 判賠
         */
        String judgeSyncMethod = request.getParameter("judgeSyncMethod"); //判赔同步方式
        String judgeSyncWeek = request.getParameter("judgeSyncWeek"); //指定周几同步
        String judgeSyncDayTime = request.getParameter("judgeSyncDayTime"); //每日同步时间
        String judgeSyncProperty = request.getParameter("judgeSyncProperty"); //判赔同步属性
        String judgeSynDay = request.getParameter("judgeSynDay"); //指定哪日同步
        String judgeSyncTime = request.getParameter("judgeSyncTime"); //指定同步时间
        String judgeSyncOnTime = request.getParameter("judgeSyncOnTime"); //指定整点同步
        String judgeSyncDetail = request.getParameter("judgeSyncDetail"); //判赔同步内容
        String judgeFtpAddress = request.getParameter("judgeFtpAddress"); //同步FTP地址
        String judgeSyncPath = request.getParameter("judgeSyncPath"); //产品同步路径
        String judgeFtpName = request.getParameter("judgeFtpName"); //FTP用户名
        String judgeFtpPassword = request.getParameter("judgeFtpPassword"); //FTP密码
        String judgeFtpPort = request.getParameter("judgeFtpPort"); //FTP端口
        String aa = "";
        
        if (postType != null && postType.equals("add")) {
            /*新增*/
            out.print("新增成功");
        } else if (postType != null && postType.equals("edit")) {
            /*修改*/
            out.print("修改成功");
        } else if (postType != null && postType.equals("check")) {
            /*審核*/
            out.print("審核成功");
        } else if (postType != null && postType.equals("del")) {
            /*刪除*/
            String checkbox[] = request.getParameter("checkbox").split(","); //FTP端口
            ;
            for (String s : checkbox) {
                aa += s+",";
            }
            out.print("刪除成功:" + aa);
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
