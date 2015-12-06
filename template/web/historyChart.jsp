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
                    <div class="form-group">
                        <div >
                            <table class="table table-bordered">
                                <tr>
                                    <td class="warning" rowspan="2">整点天气实况</td><td>最新整點實況風力:2級</td> <td class="" rowspan="2"><button id="temperature" type="button" class="btn btn-default">溫度</button><button id="humidity"  type="button" class="btn btn-default">相對溼度</button><button id="3"  type="button" class="btn btn-default">降水量</button></td>
                                </tr>
                                <tr>
                                    <td >最大風力:3級</td>
                                </tr>
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
        $("#temperature").click(
                function () {
                    $("#conDiv").html("Wait, Loading graph...");
                    var options = {
                        series: [{

                            }],
                        chart: {
                            type: 'column'
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
                        tooltip: {
                            formatter: function () {
                                return '<b>' + this.series.name + '</b><br/>' +
                                        this.point.y + ' ' + this.point.name.toLowerCase();
                            }
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
                            $("#conDiv").highcharts(options);
                        }
                    });
                });
    </script>
