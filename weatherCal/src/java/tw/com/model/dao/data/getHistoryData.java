/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.model.dao.data;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.json.JSONArray;
import org.json.JSONObject;
import tw.com.mode.vo.WeatherCalVo;
import tw.com.model.base.BaseDAO;
import tw.com.model.base.HibernateUtil;

/**
 *
 * @author Jean
 */
public class getHistoryData {

    public static Calendar calendar = Calendar.getInstance();

    // private HibernateUtil HUtil;  

    public List<Map<String, Object>> findHisttoryDataWithAlone(WeatherCalVo queryVo) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Date fromDate = queryVo.getEventValidFrom();
        Date endDate = queryVo.getEventValidEnd();
        calendar.setTime(fromDate);
        int yearFrom = calendar.get(Calendar.YEAR);
        int monthFrom = calendar.get(Calendar.MONTH);
        int dayFrom = calendar.get(Calendar.DAY_OF_MONTH);
        calendar.setTime(endDate);
        int yearEnd = calendar.get(Calendar.YEAR);
        int monthEnd = calendar.get(Calendar.MONTH);
        int dayEnd = calendar.get(Calendar.DAY_OF_MONTH);
        String tableName = null;
        String dayString=null;
        StringBuffer StrBuffer = new StringBuffer();
        
        String formatStr = "%02d";

        if (yearFrom == yearEnd) {
               if(monthFrom == monthEnd){
                   tableName = "WeatherData.ViewHistory"+String.valueOf(yearFrom)+String.format(formatStr, monthFrom);
                   dayString =" and Day between " + dayFrom +" and "+ dayEnd;
               }
        }
        try {
            StrBuffer.append("SELECT  count(1)  FROM  "+ tableName
                    + " where  SiteId = 50136 " + dayString +" and TemperatureMax >= 50");
            session.beginTransaction(); //開啟交易
            SQLQuery query = session.createSQLQuery(StrBuffer.toString());
            query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);

            return query.list();
        } catch (Exception e) {
            System.out.print(e.toString());
            return null;
        } finally {
            session.getTransaction().commit();
            session.close();
        }

    }
    
   // public 

}
