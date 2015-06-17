/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.model.dao.data;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
public class FspWeatherAssess {

    public static Calendar calendar = Calendar.getInstance();

    // private HibernateUtil HUtil;  
    public List<Map<String, Object>> findHistoryData(WeatherCalVo queryVo) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Session sessionHist = HibernateUtil.getSessionFactoryHist().openSession();
        Date fromDate = queryVo.getEventValidFrom();
        Date endDate = queryVo.getEventValidEnd();
        //起日
        calendar.setTime(fromDate);
        int yearFrom = calendar.get(Calendar.YEAR);
        int monthFrom = calendar.get(Calendar.MONTH)+1;
        int dayFrom = calendar.get(Calendar.DAY_OF_MONTH);
        //迄日
        calendar.setTime(endDate);
        int yearEnd = calendar.get(Calendar.YEAR);
        int monthEnd = calendar.get(Calendar.MONTH)+1;
        int dayEnd = calendar.get(Calendar.DAY_OF_MONTH);

        String tableName = null;
        String dayString = null;
        StringBuffer StrBuffer = new StringBuffer();
        Map<String, Object> resMap = new HashMap<String, Object>();
        List<Map<String, Object>> reslist = new ArrayList<Map<String, Object>>();
        int calyear = queryVo.getAssessmentYear(); //計算年
        calyear = 2;
        Map<String, Object> returnMap = new HashMap<String, Object>(); //計算後結果

        String formatStr = "%02d"; //兩位數補0
        String yyyymm = "00000";
        
        if (yearFrom == yearEnd) {
            if (monthFrom == monthEnd) {
               
                dayString = " and Day between " + dayFrom + " and " + dayEnd;
            }
        }
        sessionHist.beginTransaction(); //開啟交易
        session.beginTransaction(); //開啟交易
        String tempsql = "";
        String tempOperation = "";
        if (queryVo.getOperationUB() != null) {
            tempsql += " AND OPERATION_UB = '" + queryVo.getOperationUB() + "'";
        }
        if (queryVo.getOperationLB() != null) {
            tempsql += " AND OPERATION_LB = '" + queryVo.getOperationLB() + "'";
        }

    
        SQLQuery query = session.createSQLQuery("SELECT VIEW_COLUMN FROM weather.metero_operation_tbl where METERO_ELEMENT= '"+queryVo.getMeteroElement()+"' " + tempsql);
        String viewColumn = query.uniqueResult().toString();

        /**
         * 條件 不累加直接在sql過濾
         */
        if (queryVo.getElementMethod().equals(" ")) {
            if (queryVo.getOperationUB() != null) {
                tempOperation += " AND " + viewColumn + " " + queryVo.getOperationUB() + " " + queryVo.getTigerPointUB();
            }
            if (queryVo.getOperationLB() != null) {
                tempOperation += " AND " + viewColumn + " " + queryVo.getOperationLB() + " " + queryVo.getTigerPointLB();
            }
        }

        try {
            for (int i = 1; i <= calyear; i++) {
                yyyymm = String.valueOf(yearFrom - i) + String.format(formatStr, monthFrom); //年月
                 tableName = "WeatherData.ViewHistory" + yyyymm;
               StrBuffer.delete(0, StrBuffer.length());
                StrBuffer.append("SELECT  Day," + viewColumn + "," + yyyymm + "  FROM  " + tableName
                        + " where  SiteId = 50136 " + dayString + tempOperation);
                query = sessionHist.createSQLQuery(StrBuffer.toString());
                query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
                resMap.put(yyyymm, query.list());
            }

            if (queryVo.getReturnVarible().equals("1")) {
                returnMap = returnVariable_01(resMap, queryVo);
            } else if (queryVo.getReturnVarible().equals("2")) {
                returnMap = returnVariable_02(resMap, queryVo);
            }
            reslist.add(returnMap);

            return reslist;
        } catch (Exception e) {
            System.out.print(e.toString());
            return null;
        } finally {
            sessionHist.getTransaction().commit();
            sessionHist.close();
        }

    }

    //输出格式：(1)环比日概率

      public Map<String, Object> returnVariable_01(Map<String, Object> tempmap, WeatherCalVo queryVo) {
        Map<String, Object> countMap = new HashMap<String, Object>();
        List<Map<String, Object>> valuslist = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> reslist = new ArrayList<Map<String, Object>>();
        Set<String> set = tempmap.keySet();
        Iterator<String> its = set.iterator();
        String mm = null;
        String dd = null;
        Integer count = 0;
        while (its.hasNext()) {
            // key
            String key = its.next();
            // value
            Object list = tempmap.get(key); 
           // list = new ArrayList<String>();
            valuslist = cast(list);
            mm = key.substring(4, 6);
            for (Map<String, Object> data : valuslist) {
                dd = data.get("Day").toString();
                //如果累加
                count = (Integer) countMap.get(mm + dd);
                if (count == null) {
                    countMap.put(mm + dd, 1); 
                } else {
                   countMap.put(mm + dd, count + 1);
                }
            }
        }
        return countMap;

    }

    //输出格式：(2)环比年概率
    public Map<String, Object> returnVariable_02(Map<String, Object> tempmap, WeatherCalVo queryVo) {
        Map<String, Object> countMap = new HashMap<String, Object>();
        List<Map<String, Object>> valuslist = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> reslist = new ArrayList<Map<String, Object>>();
        Set<String> set = tempmap.keySet();
        Iterator<String> its = set.iterator();
        String mm = null;
        String dd = null;
        Integer count = 0;
        while (its.hasNext()) {
            // key
            String key = its.next();
            // value
            Object list = tempmap.get(key);
            list = new ArrayList<String>();
            valuslist = cast(list);
            mm = key.substring(5, 2);
            for (Map<String, Object> data : valuslist) {
                dd = data.get("Day").toString();
                //如果累加
                count = (Integer) countMap.get(mm + dd);
                if (count == null) {
                    countMap.put(key, 0);
                } else {
                    countMap.put(key, count + 1);
                }
            }
        }
        return countMap;

    }

    @SuppressWarnings("unchecked")
    public static <T extends List<?>> T cast(Object obj) {
        return (T) obj;
    }

}
