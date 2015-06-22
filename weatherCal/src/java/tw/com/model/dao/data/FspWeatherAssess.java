/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.model.dao.data;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
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
    public String formatStr = "%02d"; //兩位數補0

    // private HibernateUtil HUtil;  
    public List<Map<String, Object>> findHistoryData(WeatherCalVo queryVo) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Session sessionHist = HibernateUtil.getSessionFactoryHist().openSession();
        Date fromDate = queryVo.getEventValidFrom();
        Date endDate = queryVo.getEventValidEnd();
        //起日
        calendar.setTime(fromDate);
        int yearFrom = calendar.get(Calendar.YEAR);
        int monthFrom = calendar.get(Calendar.MONTH) + 1;
        int dayFrom = calendar.get(Calendar.DAY_OF_MONTH);
        //迄日
        calendar.setTime(endDate);
        int yearEnd = calendar.get(Calendar.YEAR);
        int monthEnd = calendar.get(Calendar.MONTH) + 1;
        int dayEnd = calendar.get(Calendar.DAY_OF_MONTH);

        String tableName = null;
        String dayString = null;
        StringBuffer StrBuffer = new StringBuffer();
        Map<String, Object> resMap = new HashMap<String, Object>();
        List<Map<String, Object>> reslist = new ArrayList<Map<String, Object>>();
        int calyear = queryVo.getAssessmentYear(); //計算年
        calyear = 2;
        Map<String, Object> returnMap = new HashMap<String, Object>(); //計算後結果

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

        SQLQuery query = session.createSQLQuery("SELECT VIEW_COLUMN FROM weather.metero_operation_tbl where METERO_ELEMENT= '" + queryVo.getMeteroElement() + "' " + tempsql);
        String viewColumn = query.uniqueResult().toString();

        /**
         * 觸發條件 不累加直接在sql過濾 累加則要全部傳入運算
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
                StrBuffer.append("SELECT  Day," + viewColumn + " AS COL  FROM  " + tableName
                        + " where  SiteId = 50136 " + dayString + tempOperation + " order by Day");
                query = sessionHist.createSQLQuery(StrBuffer.toString());
                query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
                resMap.put(yyyymm, query.list());
            }
            /**
             * *
             * resMap : [yyyymm : {Day,viewcolumn}]
             */

            if (queryVo.getReturnVarible().equals("1")) {
                reslist = returnVariable_01(resMap, queryVo);
            } else if (queryVo.getReturnVarible().equals("2")) {
                reslist = returnVariable_02(resMap, queryVo);
            } else if (queryVo.getReturnVarible().equals("3")) {
                reslist = returnVariable_04(resMap, queryVo);
            } else if (queryVo.getReturnVarible().equals("4")) {
                reslist = returnVariable_04(resMap, queryVo);
            } else if (queryVo.getReturnVarible().equals("5")) {
                reslist = returnVariable_05(resMap, queryVo);
            }
            // reslist.add(returnMap);

            return reslist;
        } catch (Exception e) {
            System.out.print(e.toString());
            return null;
        } finally {
            sessionHist.getTransaction().commit();
            sessionHist.close();
        }

    }

    /**
     * 输出格式：(1)环比日概率 RUNNING_DAYS =1
     */
    public List<Map<String, Object>> returnVariable_01(Map<String, Object> tempmap, WeatherCalVo queryVo) {
        Map<String, Object> countMap = new HashMap<String, Object>();
        Map<String, Object> tmptMap = new HashMap<String, Object>();
        List<Map<String, Object>> valuslist = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> reslist = new ArrayList<Map<String, Object>>();
        Set<String> set = tempmap.keySet();
        Iterator<String> its = set.iterator();
        String yy = null;
        String mm = null;
        String dd = null;
        Integer count = 0;
        int i = 0;
        while (its.hasNext()) {
            // key
            String key = its.next();
            // value
            Object list = tempmap.get(key);

            valuslist = cast(list);
            mm = key.substring(4, 6);

            for (Map<String, Object> data : valuslist) {
                countMap = new HashMap<String, Object>();
                dd = String.format(formatStr, Integer.parseInt(data.get("Day").toString()));

                count = (Integer) tmptMap.get(key + dd);
                if (count == null) {
                    countMap.put("AREA_CODE", queryVo.getAreaCode());
                    countMap.put("DATE", key + dd);
                    Double a = 1 / queryVo.getAssessmentYear().doubleValue();
                    countMap.put("RESULTS", 1 / queryVo.getAssessmentYear().doubleValue());
                    tmptMap.put(key + dd, 1);
                } else {
                    countMap.put("AREA_CODE", queryVo.getAreaCode());
                    countMap.put("DATE", key + dd);
                    countMap.put("RESULTS", (count + 1) / queryVo.getAssessmentYear().doubleValue());
                    tmptMap.put(key + dd, count + 1);
                }
                reslist.add(countMap);
            }
        }
        return reslist;

    }

    /**
     * 输出格式：(3)平均次數(獨立)(4)平均天数(連續)
     *
     */
    public List<Map<String, Object>> returnVariable_04(Map<String, Object> tempmap, WeatherCalVo queryVo) {
        Map<String, Object> countMap = new HashMap<String, Object>();
        List<Map<String, Object>> valuslist = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> reslist = new ArrayList<Map<String, Object>>();
        Set<String> set = tempmap.keySet();
        Iterator<String> its = set.iterator();
        Integer dd = 0;
        Integer count = 0;
        Integer tempcount = 0;
        int i = 0;

        while (its.hasNext()) {
            // key
            String key = its.next();
            // value     
            Object list = tempmap.get(key);
            //   list = new ArrayList<String>();
            valuslist = cast(list);
            //獨立 有達到RUNNING_DAYS
            if (queryVo.getStatisticMethod() != null && queryVo.getStatisticMethod().equals("1")) {
                count = count + valuslist.size();
            } else {
                //連續
                for (Map<String, Object> data : valuslist) {
                    i++;
                    tempcount = 0;
                    if (dd == 0) {
                        tempcount = tempcount + 1;
                    }
                    if (Integer.parseInt(data.get("Day").toString()) - dd == 1) {
                        //連續天數差1累加
                        tempcount = tempcount + 1;
                    } else {
                        count = count + tempcount;
                        tempcount = 0;
                    }
                }

            }

        }
        countMap.put("AREA_CODE", queryVo.getAreaCode());
        countMap.put("DATE", new SimpleDateFormat("yyyy/MM/dd").format(queryVo.getEventValidFrom()));
        countMap.put("RESULTS", count / queryVo.getAssessmentYear());
        reslist.add(countMap);
        //     countMap.put(queryVo.getEventValidFrom().toString(), count / queryVo.getAssessmentYear());
        return reslist;

    }

    /**
     * 输出格式：(2)环比年概率 RUNNING_DAYS >= -->獨立, RUNNING_DAYS = -->連續
     */
    public List<Map<String, Object>> returnVariable_02(Map<String, Object> tempmap, WeatherCalVo queryVo) {
        Map<String, Object> countMap = new HashMap<String, Object>();
        List<Map<String, Object>> valuslist = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> reslist = new ArrayList<Map<String, Object>>();
        Set<String> set = tempmap.keySet();
        Iterator<String> its = set.iterator();
        Integer tempcount = 0;
        Integer dd = 0;
        Integer count = 0;
        LinkedList listcount = new LinkedList();
        Double sum = 0.00;
        int i = 0;
        while (its.hasNext()) {
            i = 0;
            sum = 0.00;
            // key
            String key = its.next();
            // value    
            Object list = tempmap.get(key);
            list = new ArrayList<String>();
            valuslist = cast(list);

            //獨立 有達到RUNNING_DAYS
            if (queryVo.getStatisticMethod() != null && queryVo.getStatisticMethod().equals("1")) {
                if (valuslist.size() >= queryVo.getRunningDay()) {
                    count = count + 1;
                }
                //連續
            } else {
                for (Map<String, Object> data : valuslist) {
                    tempcount = 0;
                    i++;
                    //不累加
                    if (queryVo.getElementMethod() != null && queryVo.getElementMethod().equals(" ")) {

                        //第一筆
                        if (dd == 0) {
                            tempcount = tempcount + 1;
                        } else {
                            //
                            if (Integer.parseInt(data.get("Day").toString()) - dd == 1 && dd != 0) {
                                tempcount = tempcount + 1;
                            } else {
                                tempcount = 0;
                            }
                            //達到連續天數記為是並跳出迴圈
                            if (tempcount >= queryVo.getRunningDay()) {
                                count = count + 1;
                                break;
                            }
                        }
                        dd = Integer.parseInt(data.get("Day").toString());
                    } else {
                        //累加
                        if (i >= queryVo.getRunningDay()) {
                            sum = sum - Double.parseDouble(listcount.getFirst().toString());
                            listcount.removeFirst();
                            listcount.addLast(data.get("COL"));
                            sum = sum + Double.parseDouble(data.get("COL").toString());
                        } else {
                            listcount.addLast(data.get("COL"));
                            sum = sum + Double.parseDouble(data.get("COL").toString());
                        }

                        if (sum >= Double.parseDouble(queryVo.getTigerPointLB().toString())) {
                            count = count + 1;
                            break;
                        }

                    }

                }
            }

        }
         countMap.put("AREA_CODE", queryVo.getAreaCode());
        countMap.put("DATE", new SimpleDateFormat("yyyy/MM/dd").format(queryVo.getEventValidFrom()));
        countMap.put("RESULTS", count / queryVo.getAssessmentYear());
        reslist.add(countMap);
        
       /// countMap.put(queryVo.getEventValidFrom().toString(), count / queryVo.getAssessmentYear());
        return reslist;
    }

    /**
     * 输出格式：(5)差值累计平均天数
     *
     */
    public List<Map<String, Object>> returnVariable_05(Map<String, Object> tempmap, WeatherCalVo queryVo) {
        Map<String, Object> countMap = new HashMap<String, Object>();
        List<Map<String, Object>> valuslist = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> reslist = new ArrayList<Map<String, Object>>();
        Set<String> set = tempmap.keySet();
        Iterator<String> its = set.iterator();
        Integer dd = 0;
        Integer count = 0;
        Integer tempcount = 0;
        int i = 0;

        while (its.hasNext()) {
            // key
            String key = its.next();
            // value    
            Object list = tempmap.get(key);
            list = new ArrayList<String>();
            valuslist = cast(list);
            //獨立 有達到RUNNING_DAYS
            if (queryVo.getStatisticMethod() != null && queryVo.getStatisticMethod().equals("1")) {
                count = count + valuslist.size() - queryVo.getRunningDay().intValue();
            } else {
                //連續
                for (Map<String, Object> data : valuslist) {
                    i++;
                    tempcount = 0;
                    if (dd == 0) {
                        tempcount = tempcount + 1;
                    }
                    if (Integer.parseInt(data.get("Day").toString()) - dd == 1) {
                        //連續天數差1累加
                        tempcount = tempcount + 1;
                    } else {
                        count = count + (tempcount - queryVo.getRunningDay().intValue());
                        tempcount = 0;
                    }
                }

            }

        }
        countMap.put("AREA_CODE", queryVo.getAreaCode());
        countMap.put("DATE", new SimpleDateFormat("yyyy/MM/dd").format(queryVo.getEventValidFrom()));
        countMap.put("RESULTS", count / queryVo.getAssessmentYear());
        reslist.add(countMap);
        
       // countMap.put(queryVo.getEventValidFrom().toString(), count / queryVo.getAssessmentYear());
        return reslist;

    }

    @SuppressWarnings("unchecked")
    public static <T extends List<?>> T cast(Object obj) {
        return (T) obj;
    }

}
