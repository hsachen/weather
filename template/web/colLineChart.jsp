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
                    <div id="conDiv" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                    <div></div>
                    <div  style="background-color:white;">
                        <table id="table1" class="table"  >
                            <thead>
                                <tr>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
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
        /*     $(function () {
         $('#container').highcharts({
         chart: {
         zoomType: 'xy'
         },
         title: {
         text: 'Average Monthly Temperature and Rainfall in Tokyo'
         },
         subtitle: {
         text: 'Source: WorldClimate.com'
         },
         xAxis: [{
         categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
         'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
         crosshair: true
         }],
         yAxis: [{// Primary yAxis
         labels: {
         format: '{value}°C',
         style: {
         color: Highcharts.getOptions().colors[1]
         }
         },
         title: {
         text: 'Temperature',
         style: {
         color: Highcharts.getOptions().colors[1]
         }
         }
         }, {// Secondary yAxis
         title: {
         text: 'Rainfall',
         style: {
         color: Highcharts.getOptions().colors[0]
         }
         },
         labels: {
         format: '{value} mm',
         style: {
         color: Highcharts.getOptions().colors[0]
         }
         },
         opposite: true
         }],
         tooltip: {
         shared: true
         },
         legend: {
         layout: 'vertical',
         align: 'left',
         x: 120,
         verticalAlign: 'top',
         y: 100,
         floating: true,
         backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
         },
         series: [{
         name: 'Rainfall',
         type: 'column',
         yAxis: 1,
         data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
         tooltip: {
         valueSuffix: ' mm'
         }
         
         }, {
         name: 'Temperature',
         type: 'spline',
         data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
         tooltip: {
         valueSuffix: '°C'
         }
         }]
         });
         });
         */

        $(function () {
            $("#conDiv").html("Wait, Loading graph...");
            var options = {
                series: [{
                    }, {}],
                title: {
                },
                yAxis: [{// Primary yAxis
                        labels: {
                            format: '{value}°C',
                            style: {
                                color: Highcharts.getOptions().colors[1]
                            }
                        },
                        title: {
                            text: '溫度',
                            style: {
                                color: Highcharts.getOptions().colors[1]
                            }
                        }
                    }, {// Secondary yAxis
                        title: {
                            text: '天數',
                            style: {
                                color: Highcharts.getOptions().colors[0]
                            }
                        },
                        labels: {
                            format: '{value} 天',
                            style: {
                                color: Highcharts.getOptions().colors[0]
                            }
                        },
                        opposite: true
                    }],
                xAxis: {
                    categories: [{}]
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true
                        },
                    },
                    column: {
                        dataLabels: {
                            enabled: true
                        }
                    }
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
                    options.title.text = data.header;
                    options.series[0].name = data.data[0].title;
                    options.series[0].data = data.data[0].value;
                    options.series[0].type = data.data[0].gtype;
                    options.series[0].tooltip = {};
                    options.series[0].tooltip.valueSuffix = '°C';
                    options.series[1].name = data.data[1].title;
                    options.series[1].data = data.data[1].value;
                    options.series[1].type = data.data[1].gtype;
                    options.series[1].yAxis = 1;
                    $("#conDiv").highcharts(options);

                    $.each(data.thead[0].value, function (index, value) {
                        $("#table1 > thead > tr").append("<td>" + value + "</td>")
                    });
                   
                    $("#table1 > tbody").append("<tr><th>" + data.data[0].title + "</th></tr>");
                    $.each(data.data[0].value, function (index, value) {
                        $("#table1 > tbody > tr:last" ).append(" <td> " + value + " </td>")
                    });
                  
                    $("#table1 > tbody").append("<tr><th>" + data.data[1].title + "</th></tr>");
                    $.each(data.data[1].value, function (index, value) {
                        $("#table1 > tbody > tr:last" ).append(" <td> " + value + " </td>")
                    });
                    
                }
            });
        });

    </script>
