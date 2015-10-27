<%-- 
    Document   : observeSiteEdit
    Created on : 2015/10/22, 下午 04:30:03
    Author     : Jean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
        <meta name="author" content="GeeksLabs">
        <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
        <link rel="shortcut icon" href="img/favicon.png">



        <title></title>

        <%@include file="../template/style.jsp" %>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
          <script src="js/lte-ie7.js"></script>
        <![endif]-->
    </head>
    <body>
        <!-- container section start -->
        <section id="container" class="">

            <header class="header dark-bg">
                <%@include file="../template/header.jsp" %>
            </header>      
            <!--header end-->

            <aside>
                <%@include file="../template/sidebar.jsp" %>
            </aside>
            <!--sidebar end-->
            <!--main content start-->
            <section id="main-content">

                <section class="wrapper">

                    <div class="panel panel-info">
                        <div class="row">
                            <div class="col-lg-12">
                                <ol class="breadcrumb">
                                    <li><i class="fa fa-home"></i><a href="../index.jsp">Home</a></li>
                                    <li><i class="icon_documents_alt"></i><a href="observeSiteManager.jsp">观测站</a></li>
                                    <li><i class="icon_documents_alt"></i>观测站編輯</li>
                                </ol>
                            </div>
                        </div>
                        <div class="panel-content ">
                            <div class="panel-body">
                                <form id="addForm" class="form-horizontal " method="post"  >
                                    <input type="hidden" class="form-control" id="postType" name="postType" value="edit" >
                                    <div class="panel-heading"></div>
                                    <div class="panel-content">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">实况观测站站号</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="observeSiteId" name="observeSiteId">
                                            </div>
                                            <label class="col-sm-2 control-label">观测站类别</label>
                                            <div class="col-sm-2">
                                                <select class="form-control m-bot15" id="observeSiteType" name="observeSiteType">
                                                    <option value=""></option>
                                                    <option value="1">人工观测站-基本站</option>
                                                    <option value="2">人工观测站-一般站</option>
                                                    <option value="9">自动观测站</option>
                                                </select>
                                            </div>
                                            <label class="col-sm-2 control-label">站点名称</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="observeSiteName" name="observeSiteName">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">经度</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="longitude" name="longitude">
                                            </div>
                                            <label class="col-sm-2 control-label">纬度</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="latitude" name="latitude">
                                            </div>
                                            <label class="col-sm-2 control-label">海拔高度</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="altitude" name="altitude">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">台站等级</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="stationLevel" name="stationLevel">
                                            </div>
                                            <label class="col-sm-2 control-label">站点所在行政区域代码;前六码</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="areaCode1" name="areaCode1">
                                            </div>
                                            <label class="col-sm-2 control-label">站点所在行政区域代码;后六码</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="areaCode2" name="areaCode2">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">邮递区号</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="postCode" name="postCode">
                                            </div>
                                            <label class="col-sm-2 control-label">是否为考核站</label>
                                            <div class="col-sm-2">
                                                <select class="form-control m-bot15" id="evaluationFlag" name="evaluationFlag">
                                                    <option value=""></option>
                                                    <option value="0">否</option>
                                                    <option value="1">是</option>
                                                </select>
                                            </div>
                                            <label class="col-sm-2 control-label">观测站状态</label>
                                            <div class="col-sm-2">
                                                <select class="form-control m-bot15" id="status" name="status">
                                                    <option value=""></option>
                                                    <option value="0">不可用</option>
                                                    <option value="1">可用</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">有效时间(起)</label>
                                            <div class="col-sm-2">
                                                <input id="validFrom" name="validFrom" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">有效时间(讫)</label>
                                            <div class="col-sm-2">
                                                <input id="validEnd" name="validEnd" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">中国天气网预报编码</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="weatherCNSiteId" name="weatherCNSiteId">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">预报替代站1</label>
                                            <div class="col-sm-2">
                                                <input id="forecastAsite1" name="forecastAsite1" type="text" value=""  class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">预报替代站2</label>
                                            <div class="col-sm-2">
                                                <input id="forecastAsite2" name="forecastAsite2" type="text" value="" class="form-control" >
                                            </div>
                                            <label class="col-sm-2 control-label">预报替代站3</label>
                                            <div class="col-sm-2">
                                                <input id="forecastAsite3" name="forecastAsite3" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">摄氏温度标示;负数表示不可用</label>
                                            <div class="col-sm-2">
                                                <input id="temperatureC" name="temperatureC" type="text" value=""  class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">摄氏温度替代站1</label>
                                            <div class="col-sm-2">
                                                <input id="temperatureAsite1" name="temperatureAsite1" type="text" value="" class="form-control" >
                                            </div>
                                            <label class="col-sm-2 control-label">摄氏温度替代站2</label>
                                            <div class="col-sm-2">
                                                <input id="temperatureAsite2" name="temperatureAsite2" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">摄氏温度替代站3</label>
                                            <div class="col-sm-2">
                                                <input id="temperatureAsite3" name="temperatureAsite3" type="text" value=""  class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">风观测替代站1</label>
                                            <div class="col-sm-2">
                                                <input id="windAsite1" name="windAsite1" type="text" value="" class="form-control" >
                                            </div>
                                            <label class="col-sm-2 control-label">风观测替代站2</label>
                                            <div class="col-sm-2">
                                                <input id="windAsite2" name="windAsite2" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">风观测替代站3</label>
                                            <div class="col-sm-2">
                                                <input id="windAsite3" name="windAsite3" type="text" value="" class="form-control" >
                                            </div>
                                            <label class="col-sm-2 control-label">向标示;负数表示不可用</label>
                                            <div class="col-sm-2">
                                                <input id="windDirectionC" name="windDirectionC" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">风力等级标示;负数表示不可用</label>
                                            <div class="col-sm-2">
                                                <input id="windGradeC" name="windGradeC" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">风速标示;负数表示不可用</label>
                                            <div class="col-sm-2">
                                                <input id="windSpeedC" name="windSpeedC" type="text" value="" class="form-control" >
                                            </div>
                                            <label class="col-sm-2 control-label">相对湿度标示;负数表示不可用</label>
                                            <div class="col-sm-2">
                                                <input id="rhC" name="rhC" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">相对湿度替代站1</label>
                                            <div class="col-sm-2">
                                                <input id="rhAsite1" name="rhAsite1" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">相对湿度替代站2</label>
                                            <div class="col-sm-2">
                                                <input id="rhAsite2" name="rhAsite2" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">相对湿度替代站3</label>
                                            <div class="col-sm-2">
                                                <input id="rhAsite3" name="rhAsite3" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">能见度标示;负数表示不可用</label>
                                            <div class="col-sm-2">
                                                <input id="vibilityC" name="vibilityC" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">能见度替代站1</label>
                                            <div class="col-sm-2">
                                                <input id="vibilityAsite1" name="vibilityAsite1" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">能见度替代站2</label>
                                            <div class="col-sm-2">
                                                <input id="vibilityAsite2" name="vibilityAsite2" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">能见度替代站3</label>
                                            <div class="col-sm-2">
                                                <input id="vibilityAsite3" name="vibilityAsite3" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">一小时累积降水标示</label>
                                            <div class="col-sm-2">
                                                <input id="precipitation1C" name="precipitation1C" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">六小时累积降水标示</label>
                                            <div class="col-sm-2">
                                                <input id="precipitation6C" name="precipitation6C" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">十二小时累积降水标示</label>
                                            <div class="col-sm-2">
                                                <input id="precipitation12C" name="precipitation12C" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">二十四小时累积降水标示</label>
                                            <div class="col-sm-2">
                                                <input id="precipitation24C" name="precipitation24C" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">降水量替代站1</label>
                                            <div class="col-sm-2">
                                                <input id="precipitationAsite1" name="precipitationAsite1" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">降水量替代站2</label>
                                            <div class="col-sm-2">
                                                <input id="precipitationAsite2" name="precipitationAsite2" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">降水量替代站3</label>
                                            <div class="col-sm-2">
                                                <input id="precipitationAsite3" name="precipitationAsite3" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">大气压力标示</label>
                                            <div class="col-sm-2">
                                                <input id="atmoPreesureC" name="atmoPreesureC" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">大气压力替代站1</label>
                                            <div class="col-sm-2">
                                                <input id="atmoPreesureAsite1" name="atmoPreesureAsite1" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">大气压力替代站2</label>
                                            <div class="col-sm-2">
                                                <input id="atmoPreesureAsite2" name="atmoPreesureAsite2" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">大气压力替代站3</label>
                                            <div class="col-sm-2">
                                                <input id="atmoPreesureAsite3" name="atmoPreesureAsite3" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">蒸发量标示</label>
                                            <div class="col-sm-2">
                                                <input id="evaporationC" name="evaporationC" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">蒸发量替代站1</label>
                                            <div class="col-sm-2">
                                                <input id="evaporationAsite1" name="evaporationAsite1" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">蒸发量替代站2</label>
                                            <div class="col-sm-2">
                                                <input id="evaporationAsite2" name="evaporationAsite2" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">蒸发量替代站3</label>
                                            <div class="col-sm-2">
                                                <input id="evaporationAsite3" name="evaporationAsite3" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">日照时长标示</label>
                                            <div class="col-sm-2">
                                                <input id="sunHourC" name="sunHourC" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">日照时长替代站1</label>
                                            <div class="col-sm-2">
                                                <input id="sunHourAsite1" name="sunHourAsite1" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">日照时长替代站2</label>
                                            <div class="col-sm-2">
                                                <input id="sunHourAsite2" name="sunHourAsite2" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">日照时长替代站3</label>
                                            <div class="col-sm-2">
                                                <input id="sunHourAsite3" name="sunHourAsite3" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">0CM地温摄氏标示</label>
                                            <div class="col-sm-2">
                                                <input id="zeroCmGrandTempC" name="zeroCmGrandTempC" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">天气现象标示</label>
                                            <div class="col-sm-2">
                                                <input id="phenomenaC" name="phenomenaC" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">空气质量指标标示</label>
                                            <div class="col-sm-2">
                                                <input id="aqiC" name="aqiC" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">PM10标示</label>
                                            <div class="col-sm-2">
                                                <input id="pm10C" name="pm10C" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">PM2.5标示</label>
                                            <div class="col-sm-2">
                                                <input id="pm25C" name="pm25C" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">空气质量替代站1</label>
                                            <div class="col-sm-2">
                                                <input id="aqSite1" name="aqSite1" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">空气质量替代站2</label>
                                            <div class="col-sm-2">
                                                <input id="aqSite2" name="aqSite2" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">空气质量替代站3</label>
                                            <div class="col-sm-2">  
                                                <input id="aqSite3" name="aqSite3" type="text" value="" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label"></label>
                                    <a class="btn btn-default"  title="保存" id="submitBtn">保存</a>
                                    <input type="reset" class="btn btn-default" value="重置">
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
            <!--main content end-->
        </section>
        <!-- container section start -->
        <%@include file="../template/script.jsp" %>

        <script>
            $(document).ready(function () {

                $.ajax({
                    url: "../observeSiteQuery",
                    //  data: $('#queryForm').serialize(),
                    type: "POST",
                    dataType: "json",
                    success: function (JData) {

                        $.each(JData, function (index, element) {
                            $("#observeSiteId").val(element.observeSiteId);
                            $("#observeSiteType").val(element.observeSiteType);
                            $("#observeSiteName").val(element.observeSiteName);
                            $("#longitude").val(element.longitude);
                            $("#latitude").val(element.latitude);
                            $("#altitude").val(element.altitude);
                            $("#stationLevel").val(element.stationLevel);
                            $("#areaCode1").val(element.areaCode1);
                            $("#areaCode2").val(element.areaCode2);
                            $("#postCode").val(element.postCode);
                            $("#evaluationFlag").val(element.evaluationFlag);
                            $("#status").val(element.status);
                            $("#validFrom").val(element.validFrom);
                            $("#validEnd").val(element.validEnd);
                            $("#weatherCNSiteId").val(element.weatherCNSiteId);
                            $("#forecastAsite1").val(element.forecastAsite1);
                            $("#forecastAsite2").val(element.forecastAsite2);
                            $("#forecastAsite3").val(element.forecastAsite3);
                            $("#temperatureC").val(element.temperatureC);
                            $("#temperatureAsite1").val(element.temperatureAsite1);
                            $("#temperatureAsite2").val(element.temperatureAsite2);
                            $("#temperatureAsite3").val(element.temperatureAsite3);
                            $("#windAsite1").val(element.windAsite1);
                            $("#windAsite2").val(element.windAsite2);
                            $("#windAsite3").val(element.windAsite3);
                            $("#windDirectionC").val(element.windDirectionC);
                            $("#windGradeC").val(element.windGradeC);
                            $("#windSpeedC").val(element.windSpeedC);
                            $("#rhC").val(element.rhC);
                            $("#rhAsite1").val(element.rhAsite1);
                            $("#rhAsite2").val(element.rhAsite2);
                            $("#rhAsite3").val(element.rhAsite3);
                            $("#vibilityC").val(element.vibilityC);
                            $("#vibilityAsite1").val(element.vibilityAsite1);
                            $("#vibilityAsite2").val(element.vibilityAsite2);
                            $("#vibilityAsite3").val(element.vibilityAsite3);
                            $("#precipitation1C").val(element.precipitation1C);
                            $("#precipitation6C").val(element.precipitation6C);
                            $("#precipitation12C").val(element.precipitation12C);
                            $("#precipitation24C").val(element.precipitation24C);
                            $("#precipitationAsite1").val(element.precipitationAsite1);
                            $("#precipitationAsite2").val(element.precipitationAsite2);
                            $("#precipitationAsite3").val(element.precipitationAsite3);
                            $("#atmoPreesureC").val(element.atmoPreesureC);
                            $("#atmoPreesureAsite1").val(element.atmoPreesureAsite1);
                            $("#atmoPreesureAsite2").val(element.atmoPreesureAsite2);
                            $("#atmoPreesureAsite3").val(element.atmoPreesureAsite3);
                            $("#evaporationC").val(element.evaporationC);
                            $("#evaporationAsite1").val(element.evaporationAsite1);
                            $("#evaporationAsite2").val(element.evaporationAsite2);
                            $("#evaporationAsite3").val(element.evaporationAsite3);
                            $("#sunHourC").val(element.sunHourC);
                            $("#sunHourAsite1").val(element.sunHourAsite1);
                            $("#sunHourAsite2").val(element.sunHourAsite2);
                            $("#sunHourAsite3").val(element.sunHourAsite3);
                            $("#zeroCmGrandTempC").val(element.zeroCmGrandTempC);
                            $("#phenomenaC").val(element.phenomenaC);
                            $("#aqiC").val(element.aqiC);
                            $("#pm10C").val(element.pm10C);
                            $("#pm25C").val(element.pm25C);
                            $("#aqSite1").val(element.aqSite1);
                            $("#aqSite2").val(element.aqSite2);
                            $("#aqSite3").val(element.aqSite3);
                        });


                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });

                $("#reset").click(function () {
                    $('#addForm')[0].reset();

                });

                //保存 
                $("#submitBtn").click(function () {
                    $.ajax({
                        url: "../observeSiteSave",
                        data: $('#addForm').serialize(),
                        type: "POST",
                        success: function (msg) {
                            alert(msg);
                            window.location.href = "observeSiteView.jsp";
                            //       $("#main-content").load("order/itemManager.jsp");
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(xhr.status);
                            alert(thrownError);
                        }
                    });
                });

            });

        </script>
    </body>

</html>
