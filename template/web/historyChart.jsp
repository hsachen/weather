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
                                    <td class="warning" rowspan="2">整点天气实况</td><td>最新整點實況風力:2級</td> <td class="" rowspan="2"><button id="1" type="button" class="btn btn-default">溫度</button><button id="2"  type="button" class="btn btn-default">相對溼度</button><button id="3"  type="button" class="btn btn-default">降水量</button></td>
                                </tr>
                                <tr>
                                    <td >最大風力:3級</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="conDiv" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

                    <table id="datatable" class="table">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Jane</th>
                                <th>John</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>Apples</th>
                                <td>3</td>
                                <td>4</td>
                            </tr>
                            <tr>
                                <th>Pears</th>
                                <td>2</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>Plums</th>
                                <td>5</td>
                                <td>11</td>
                            </tr>
                            <tr>
                                <th>Bananas</th>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <th>Oranges</th>
                                <td>2</td>
                                <td>4</td>
                            </tr>
                        </tbody>
                    </table>
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
        $(function () {
            $('#conDiv').highcharts({
                data: {
                    table: 'datatable'
                },
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Data extracted from a HTML table in the page'
                },
                yAxis: {
                    allowDecimals: false,
                    title: {
                        text: 'Units'
                    }
                },
                tooltip: {
                    formatter: function () {
                        return '<b>' + this.series.name + '</b><br/>' +
                                this.point.y + ' ' + this.point.name.toLowerCase();
                    }
                }
            });
        });
    </script>
