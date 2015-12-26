<%-- 
    Document   : chart
    Created on : 2015/10/4, 下午 01:21:10
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

        <%@include file="template/style.jsp" %>

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
                <%@include file="template/header.jsp" %>
            </header>      
            <!--header end-->

            <aside>
                <%@include file="template/sidebar.jsp" %>
            </aside>
            <section id="main-content"> 
                <section class="wrapper">
                    <div class="panel panel-info">
                        <div class="row">
                            <div class="col-lg-12">
                                <ol class="breadcrumb">
                                    <li><i class="fa fa-home"></i><a href="../index.jsp">Home</a></li>
                                    <li><i class="icon_documents_alt"></i><a href="productManager.jsp">产品管理</a></li>
                                    <li><i class="icon_documents_alt"></i>调取活动代码</li>
                                </ol>
                            </div>
                        </div>
                        <div class="panel-heading"></div>
                        <!--        <div class="panel-heading"><span style="font-size:36px;">产品管理</span><span style="font-size:24px;">&nbsp;调取活动代码</span></div>-->
                        <div class="panel-content ">
                            <div class="panel-body">           
                                <form id="queryForm" class="form-horizontal " method="get">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">城市</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="city" name="city">
                                        </div>
                                        <label class="col-sm-1 control-label">站點</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="site" name="site">
                                        </div>
                                        <label class="col-sm-1 control-label">时间区间</label>
                                        <div class="col-sm-2">
                                            <input id="date1" name="date1" type="text" value="" size="16" class="form-control">
                                        </div>
                                        <label class="col">至</label>
                                        <div class="col-sm-2">
                                            <input id="date2" name="date2" type="text" value="" size="16" class="form-control">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"></label>
                                        <a class="btn btn-default"  title="查询" id="query">查询</a>
                                        <input type="reset" class="btn btn-default" value="重置">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" >
                        <div >
                            <table class="table table-bordered" id="tbl2">

                            </table>
                        </div>
                    </div>
                    <div id="conDiv" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                </section>
            </section>
            <!--main content end-->
        </section>
        <!-- container section start -->

    </body>
    <%@include file="template/script.jsp" %>
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <script src="http://code.highcharts.com/modules/data.js"></script>
    <script src="http://code.highcharts.com/modules/exporting.js"></script>
    <script>
        $(document).ready(function () {
            $('#date1').datepicker({
                dateFormat: 'yy/mm/dd'
            });
            $('#date2').datepicker({
                dateFormat: 'yy/mm/dd'
            });
            $("#query").click(function () {
                $("#tbl2").append("<tr><td rowspan=\"2\">整点天气实况</td><td>最新整點實況風力:2級</td> <td class=\"\" rowspan=\"2\"><button id=\"temperature\" type=\"button\" class=\"btn btn-default\">溫度</button><button id=\"humidity\"  type=\"button\" class=\"btn btn-default\">相對溼度</button><button id=\"precipitation\"  type=\"button\" class=\"btn btn-default\">降水量</button><button id=\"wind\"  type=\"button\" class=\"btn btn-default\">風向</button></td></tr>");
                $("#tbl2").append("<tr> <td >最大風力:3級</td> </tr>");
                $("#temperature").click(
                        function () {
                            $("#conDiv").html("Wait, Loading graph...");
                            var options = {
                                series: [{
                                    }],
                                chart: {
                                },
                                title: {
                                    text: '歷史溫度'
                                },
                                yAxis: {
                                    allowDecimals: false,
                                    title: {
                                        text: '溫度'
                                    }
                                },
                                xAxis: {
                                    categories: [{}]
                                },
                                shared: true
                            };


                            $.ajax({
                                url: "historyChartJson.json",
                                //	data: 'show=impression',
                                type: 'post',
                                dataType: "json",
                                success: function (data) {
                                    debugger;
                                    options.xAxis.categories = data.thead[0].value;
                                    options.series[0].name = data.data[0].title;
                                    options.series[0].data = data.data[0].value;
                                    options.chart.type = data.data[0].gtype;
                                    $("#conDiv").highcharts(options);
                                }
                            });
                        });


                $("#humidity").click(
                        function () {
                            $("#conDiv").html("Wait, Loading graph...");
                            var options = {
                                series: [{
                                    }],
                                chart: {
                                },
                                title: {
                                    text: '相對溼度'
                                },
                                yAxis: {
                                    allowDecimals: false,
                                    title: {
                                        text: '濕度'
                                    }
                                },
                                xAxis: {
                                    categories: [{}]
                                },
                                tooltip: {
                                    shared: true
                                }
                            };


                            $.ajax({
                                url: "historyChartJson.json",
                                //	data: 'show=impression',
                                type: 'post',
                                dataType: "json",
                                success: function (data) {
                                    debugger;
                                    options.xAxis.categories = data.thead[0].value;
                                    options.series[0].name = data.data[0].title;
                                    options.series[0].data = data.data[0].value;
                                    options.chart.type = data.data[0].gtype;
                                    $("#conDiv").highcharts(options);
                                }
                            });
                        });

                $("#precipitation").click(
                        function () {
                            $("#conDiv").html("Wait, Loading graph...");
                            var options = {
                                series: [{
                                    }],
                                chart: {
                                },
                                title: {
                                    text: '降水量'
                                },
                                yAxis: {
                                    allowDecimals: false,
                                    title: {
                                        text: '降水量'
                                    }
                                },
                                xAxis: {
                                    categories: [{}]
                                },
                                tooltip: {
                                    shared: true
                                }
                            };


                            $.ajax({
                                url: "historyChartJson.json",
                                //	data: 'show=impression',
                                type: 'post',
                                dataType: "json",
                                success: function (data) {
                                    debugger;
                                    options.xAxis.categories = data.thead[0].value;
                                    options.series[0].name = data.data[0].title;
                                    options.series[0].data = data.data[0].value;
                                    options.chart.type = data.data[0].gtype;
                                    $("#conDiv").highcharts(options);
                                }
                            });
                        });


                $("#wind").click(
                        function () {
                            $("#conDiv").html("Wait, Loading graph...");
                            var options = {
                                series: [{
                                    }],
                                chart: {
                                },
                                title: {
                                    text: '相對溼度'
                                },
                                yAxis: {
                                    allowDecimals: false,
                                    title: {
                                        text: '濕度'
                                    }
                                },
                                xAxis: {
                                    categories: [{}]
                                },
                                shared: true
                            };


                            $.ajax({
                                url: "historyChartWindJson.json",
                                //	data: 'show=impression',
                                type: 'post',
                                dataType: "json",
                                success: function (data) {
                                    debugger;
                                    options.xAxis.categories = data.thead[0].value;
                                    options.series[0].name = data.data[0].title;
                                    options.series[0].data = data.data[0].value;
                                    options.chart.type = data.data[0].gtype;
                                    $("#conDiv").highcharts(options);
                                }
                            });
                        });
            });


        });


    </script>
