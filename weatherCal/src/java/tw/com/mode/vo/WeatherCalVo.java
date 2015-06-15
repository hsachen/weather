/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.mode.vo;

import java.util.Date;

/**
 *
 * @author Jean
 */
public class WeatherCalVo {
    
   private Date eventValidFrom;  //天氣風險評估日期（起）
    private Date eventValidEnd;  //天氣風險評估日期（迄）
    private Integer assessmentYear ; //計算年
    private String operationRunningDay;//連續天數操作符號
    private Integer runningDay;//天數
    private String meteroElement;//氣象要素代碼
    private String operationUB;//操作符(上限):>,>=,=,><,<=,<
    private String operationLB;//操作符(下限):>,>=,=,><,<=,<
    private String trigerPointUB;//觸發條件(上限)
    private String trigerPointLB;//觸發條件(下限)
    private String measureUnit;//單位
    private String statisticMethod;//阀值统计方法:(1)独立;(2)连续 ;
    private String elementMethod;//气象要素累加：(SPACE)否;(1)是
    private String returnVarible; //格式：(1)环比日概率;(2)环比年概率;(3)平均次数;(4)平均天数;(5)差值累计平均天数
    private String phenomenaID;//天氣要素代碼
    private String meteroElementGradeId;//天氣要素等級
    private String operationGrade;//天气要素等级操作符,天气要素等级操作符:>,>=,=,><,<=,<
    
    
    public void setEventValidFrom(Date eventValidFrom){
        this.eventValidFrom=eventValidFrom;
    }
    public Date getEventValidFrom(){
        return this.eventValidFrom;
    }
    
    public void setEventValidEnd(Date eventValidEnd){
        this.eventValidEnd=eventValidEnd;
    }
    public Date getEventValidEnd(){
        return this.eventValidEnd;
    }
    
    public void setAssessmentYear(Integer assessmentYear){
        this.assessmentYear=assessmentYear;
    }
    public Integer getAssessmentYear(){
        return this.assessmentYear;
    }
    
     public void setOperationRunningDay(String operationRunningDay){
        this.operationRunningDay=operationRunningDay;
    }
    public String getOperationRunningDay(){
        return this.operationRunningDay;
    }
    
      public void setRunningDay(Integer runningDay){
        this.runningDay=runningDay;
    }
    public Integer getRunningDay(){
        return this.runningDay;
    }
    
     public void setMeteroElement(String meteroElement){
        this.meteroElement=meteroElement;
    }
    public String getMeteroElement(){
        return this.meteroElement;
    }
    
     public void setOperationUB(String operationUB){
        this.operationUB=operationUB;
    }
    public String getOperationUB(){
        return this.operationUB;
    }
    
     public void setOperationLB(String operationLB){
        this.operationLB=operationLB;
    }
    public String getOperationLB(){
        return this.operationLB;
    }
    
      public void setTrigerPointUB(String trigerPointUB){
        this.trigerPointUB=trigerPointUB;
    }
    public String getTigerPointUB(){
        return this.trigerPointUB;
    }
    
     public void setTrigerPointLB(String trigerPointLB){
        this.trigerPointLB=trigerPointLB;
    }
    public String getTigerPointLB(){
        return this.trigerPointLB;
    }
    
     public void setMeasureUnit(String measureUnit){
        this.measureUnit=measureUnit;
    }
    public String getMeasureUnit(){
        return this.measureUnit;
    }
    
      public void setStatisticMethod(String statisticMethod){
        this.statisticMethod=statisticMethod;
    }
    public String getStatisticMethod(){
        return this.statisticMethod;
    }
    
     public void setElementMethod(String elementMethod){
        this.elementMethod=elementMethod;
    }
    public String getElementMethod(){
        return this.elementMethod;
    }
    
     public void setReturnVarible(String returnVarible){
        this.returnVarible=returnVarible;
    }
    public String getReturnVarible(){
        return this.returnVarible;
    }
    
    public void setPhenomenaID(String phenomenaID){
        this.phenomenaID=phenomenaID;
    }
    public String getPhenomenaID(){
        return this.phenomenaID;
    }
    
      public void setMeteroElementGradeId(String meteroElementGradeId){
        this.meteroElementGradeId=meteroElementGradeId;
    }
    public String getMeteroElementGradeId(){
        return this.meteroElementGradeId;
    }
    
     public void setOperationGrade(String operationGrade){
        this.operationGrade=operationGrade;
    }
    public String getOperationGrade(){
        return this.operationGrade;
    }
}
