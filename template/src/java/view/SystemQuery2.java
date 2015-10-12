/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Jean
 */
public class SystemQuery2 extends HttpServlet {

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
        String table = "ajax";
        PrintWriter out = response.getWriter();
        JSONObject result = new JSONObject();
        JSONArray array = new JSONArray();
        int amount = 10;
        int start = 0;
        int echo = 0;
        int col = 0;

        String engine = "";
        String browser = "";
        String platform = "";
        String version = "";
        String grade = "";

        String dir = "asc";
        String sStart = request.getParameter("iDisplayStart");
        String sAmount = request.getParameter("iDisplayLength");
        String sEcho = request.getParameter("sEcho");
        String sCol = request.getParameter("iSortCol_0");
        String sdir = request.getParameter("sSortDir_0");
        List<String> sArray = new ArrayList<String>();
        String individualSearch = "";
        if (sArray.size() == 1) {
            individualSearch = sArray.get(0);
        } else if (sArray.size() > 1) {
            for (int i = 0; i < sArray.size() - 1; i++) {
                individualSearch += sArray.get(i) + " and ";
            }
            individualSearch += sArray.get(sArray.size() - 1);
        }

        if (sStart != null) {
            start = Integer.parseInt(sStart);
            if (start < 0) {
                start = 0;
            }
        }
        if (sAmount != null) {
            amount = Integer.parseInt(sAmount);
            if (amount < 10 || amount > 100) {
                amount = 10;
            }
        }
        if (sEcho != null) {
            echo = Integer.parseInt(sEcho);
        }
        if (sCol != null) {
            col = Integer.parseInt(sCol);
            if (col < 0 || col > 5) {
                col = 0;
            }
        }
        if (sdir != null) {
            if (!sdir.equals("asc")) {
                dir = "desc";
            }
        }
        /*  String colName = cols[col];
         int total = 0;
         Connection conn = ConnectManager.getConnection();
         try {
         String sql = "SELECT count(*) FROM "+table;
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery();
         if(rs.next()){
         total = rs.getInt("count(*)");
         }
         }catch(Exception e){
         
         }*/
        int total = 20;
        int totalAfterFilter = total;
    //result.put("sEcho",echo);

        try {
            /*    String searchSQL = "";
             String sql = "SELECT * FROM "+table;
             String searchTerm = request.getParameter("sSearch");
             String globeSearch =  " where (engine like '%"+searchTerm+"%'"
             + " or browser like '%"+searchTerm+"%'"
             + " or platform like '%"+searchTerm+"%'"
             + " or version like '%"+searchTerm+"%'"
             + " or grade like '%"+searchTerm+"%')";
             if(searchTerm!=""&&individualSearch!=""){
             searchSQL = globeSearch + " and " + individualSearch;
             }
             else if(individualSearch!=""){
             searchSQL = " where " + individualSearch;
             }else if(searchTerm!=""){
             searchSQL=globeSearch;
             }
             sql += searchSQL;
             sql += " order by " + colName + " " + dir;
             sql += " limit " + start + ", " + amount;
 
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery();
             while (rs.next()) {
             JSONArray ja = new JSONArray();
             ja.put(rs.getString("engine"));
             ja.put(rs.getString("browser"));
             ja.put(rs.getString("platform"));
             ja.put(rs.getString("version"));
             ja.put(rs.getString("grade"));
             array.put(ja);
             }
             String sql2 = "SELECT count(*) FROM "+table;
             if (searchTerm != "") {
             sql2 += searchSQL;
             PreparedStatement ps2 = conn.prepareStatement(sql2);
             ResultSet rs2 = ps2.executeQuery();
             if (rs2.next()) {
             totalAfterFilter = rs2.getInt("count(*)");
             }
             }*/

            for (int i =start ;i <= start+amount; i++) {
                JSONArray ja = new JSONArray();
                ja.put("ZA2014000" + i);
                ja.put("I000000001");
                ja.put("2015/3/31 0:00");
                ja.put("2015/7/31 23:59");
                ja.put("启用");
                ja.put("125687");
                ja.put("414856");
                ja.put("1"); //0:正常(綠色) 1:異常(紅色)
                ja.put("同步运行异常");
                ja.put("1");//0:正常(綠色) 1:異常(紅色) 2:未處理(白色)
                ja.put("应结账");
                array.put(ja);
            }
            result.put("iTotalRecords", total);
            result.put("iTotalDisplayRecords", totalAfterFilter);
            result.put("aaData", array);
            response.setContentType("application/json");
            response.setHeader("Cache-Control", "no-store");
            out.print(result);
            //   conn.close();
        } catch (Exception e) {

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
