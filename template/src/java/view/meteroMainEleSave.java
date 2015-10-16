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
public class meteroMainEleSave extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        String postType = request.getParameter("postType"); //增刪改查
        String metetoElementId = request.getParameter("metetoElementId"); //天气要素代码
        String metetoElementCN = request.getParameter("metetoElementCN"); //天气要素描述(中文)
        String metetoElementEN = request.getParameter("metetoElementEN"); //天气要素描述(英文)
        String aa = "";
        processRequest(request, response);
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
                aa += s + ",";
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
