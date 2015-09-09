<%-- 
    Document   : index
    Created on : 2015/8/13, 下午 04:32:03
    Author     : Jean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String path = request.getParameter("path");
%>
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
        <!-- Bootstrap CSS -->    
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- bootstrap theme -->
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <!--external css-->
        <!-- font icon -->
        <link href="css/elegant-icons-style.css" rel="stylesheet" />
        <link href="css/font-awesome.min.css" rel="stylesheet" />    
        <!-- full calendar css-->
        <link href="assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
        <link href="assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
        <!-- easy pie chart-->
        <link href="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
        <!-- owl carousel -->
        <link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
        <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
        <!-- Custom styles -->
        <link rel="stylesheet" href="css/fullcalendar.css">
        <link href="css/widgets.css" rel="stylesheet">
        <link href="css/weather.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet" />
        <link href="css/xcharts.min.css" rel=" stylesheet">	
        <link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet">
        <link href="lib/DataTables1.10.8/media/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="css/jquery-ui-timepicker-addon.css" rel="stylesheet">
        <link href="css/dropdowns-enhancement.css" rel="stylesheet">
        <link href="css/jquery-tree.css" rel="stylesheet">

        <style>
            @media (min-width: 768px){
                .col{
                    width: 1%;
                    position: relative;
                    min-height: 1px;
                    padding-left: 15px;
                    padding-right: 15px;
                    float: left;
                }
            }
        </style>
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
                <div class="toggle-nav">
                    <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
                </div>

                <!--logo start-->
                <span class="icon-wt-cloud" style="float:left; margin-top:15px"></span><a href="#" class="logo">恒澤平台管理</a>
                <!--logo end-->

                <div class="top-nav notification-row">                
                    <!-- notificatoin dropdown start-->
                    <ul class="nav pull-right top-menu">
                        <!-- user login dropdown start-->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="profile-ava">
                                    <img alt="" src="img/avatar1_small.jpg">
                                </span>
                                <span class="username">Admin</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu extended logout">
                                <div class="log-arrow-up"></div>
                                <li class="eborder-top">
                                    <a href="#"><i class="icon_profile"></i> My Profile</a>
                                </li>
                                <li>
                                    <a href="login.html"><i class="icon_key_alt"></i> Log Out</a>
                                </li>
                            </ul>
                        </li>
                        <!-- user login dropdown end -->
                    </ul>
                    <!-- notificatoin dropdown end-->
                </div>
            </header>      
            <!--header end-->

            <aside>
                <div id="sidebar"  class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu">                
                        <li class="sub-menu">
                            <a href="javascript:;" class="m1">
                                <i class="icon_drive_alt"></i>
                                <span>主数据管理</span>
                                <span class="menu-arrow arrow_carrot-right"></span>
                            </a>
                            <ul class="sub">
                                <li><a class="" href="#">行政区</a></li>                          
                                <li><a class="" href="#" folder="risk/input.jsp">观测站</a></li>
                                <li><a class="" href="#">天气要素</a></li>
                            </ul>
                        </li>       
                        <li class="sub-menu">
                            <a href="javascript:;" class="">
                                <i class="icon_genius"></i>
                                <span>天气指数评估</span>
                                <span class="menu-arrow arrow_carrot-right"></span>
                            </a>
                            <ul class="sub">
                                <li><a class="clink" href="#" folder="risk/input.jsp">条件配置</a></li>
                                <li><a class="clink" href="#">任务列表</a></li>
                                <li><a class="clink" href="#">站点组管理</a></li>
                            </ul>
                        </li>

                        <li class="sub-menu">
                            <a href="javascript:;" class="">
                                <i class="icon_documents_alt"></i>
                                <span>保险产品</span>
                                <span class="menu-arrow arrow_carrot-right"></span>
                            </a>
                            <ul class="sub">                          
                                <li><a class="clink" href="#" folder="order/itemManager.jsp">项目管理</a></li>
                                <li><a class="clink" href="#" folder="order/productManager.jsp" >产品管理</a></li>
                                <li><a class="clink" href="#">系统监控</a></li>
                            </ul>
                        </li>

                        <li>
                            <a class="" href="#">
                                <i class="icon_cone"></i>
                                <span>站点地图</span>
                            </a>
                        </li>

                        <li class="sub-menu">
                            <a href="javascript:;" class="">
                                <i class="icon_cogs"></i>
                                <span>系统管理</span>
                                <span class="menu-arrow arrow_carrot-right"></span>
                            </a>
                            <ul class="sub">                          
                                <li><a class="" href="#">用户管理</a></li>
                                <li><a class="" href="#">客户联系人管理</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->
            <!--main content start-->
            <section id="main-content">
            </section>
            <!--main content end-->
        </section>
        <!-- container section start -->

        <!-- javascripts -->
        <script src="js/jquery.js"></script>
        <script src="js/jquery-ui-1.10.4.min.js"></script>
        <script src="js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
        <!-- bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- nice scroll -->
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
        <!-- charts scripts -->
        <script src="assets/jquery-knob/js/jquery.knob.js"></script>
        <script src="js/jquery.sparkline.js" type="text/javascript"></script>
        <script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
        <script src="js/owl.carousel.js" ></script>
        <!-- jQuery full calendar -->
        <<script src="js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
        <script src="assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
        <!--script for this page only-->
        <script src="js/calendar-custom.js"></script>
        <script src="js/jquery.rateit.min.js"></script>
        <!-- custom select -->
        <script src="js/jquery.customSelect.min.js" ></script>
        <script src="assets/chart-master/Chart.js"></script>

        <!--custome script for all page-->
        <script src="js/scripts.js"></script>
        <!-- custom script for this page-->
        <script src="js/sparkline-chart.js"></script>
        <script src="js/easy-pie-chart.js"></script>
        <script src="js/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="js/jquery-jvectormap-world-mill-en.js"></script>
        <script src="js/xcharts.min.js"></script>
        <script src="js/jquery.autosize.min.js"></script>
        <script src="js/jquery.placeholder.min.js"></script>
        <script src="js/gdp-data.js"></script>	
        <script src="js/morris.min.js"></script>
        <script src="js/sparklines.js"></script>	
        <script src="js/charts.js"></script>
        <script src="js/jquery.slimscroll.min.js"></script>
        <script src="lib/DataTables1.10.8/media/js/jquery.dataTables.min.js"></script>
        <script src="js/jquery-ui-timepicker-addon.js"></script>
        <script src="js/dropdowns-enhancement.js"></script>
        <script src="js/jquery-tree.js"></script>

        <script>

            //knob
            $(function () {
                $(".knob").knob({
                    'draw': function () {
                        $(this.i).val(this.cv + '%')
                    }
                })
            });

            //carousel
            $(document).ready(function () {
                $("#owl-slider").owlCarousel({
                    navigation: true,
                    slideSpeed: 300,
                    paginationSpeed: 400,
                    singleItem: true

                });
             

                var path = "<%=path%>";
                if (path != "null") {
                    $("#main-content").load(path);
                }
                  $(".clink").click(function () {
                    $("#main-content").empty();
                    $("#main-content").load($(this).attr("folder"));
                });

            });
 
            //custom select box

            $(function () {
                $('select.styled').customSelect();
            });

            /* ---------- Map ---------- */
            $(function () {
                $('#map').vectorMap({
                    map: 'world_mill_en',
                    series: {
                        regions: [{
                                values: gdpData,
                                scale: ['#000', '#000'],
                                normalizeFunction: 'polynomial'
                            }]
                    },
                    backgroundColor: '#eef3f7',
                    onLabelShow: function (e, el, code) {
                        el.html(el.html() + ' (GDP - ' + gdpData[code] + ')');
                    }
                });
            });



        </script>

    </body>
</html>
