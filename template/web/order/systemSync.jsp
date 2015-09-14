<%-- 
    Document   : systemManager
    Created on : 2015/9/12, 下午 04:50:39
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
                                    <li><i class="icon_documents_alt"></i>系统监控</li>
                                    <li><i class="icon_documents_alt"></i>同步监控</li>

                                </ol>
                            </div>
                        </div>

                        <div class="panel-content ">
                            <div class="panel-heading">产品同步监控</div>
                            <div class="panel-body">           
                                <div id="product_div">
                                </div>
                            </div>
                        </div>

                        <div class="panel-content ">
                            <div class="panel-heading">保单同步监控</div>
                            <div class="panel-body">           
                                <div id="order_div">
                                </div>
                            </div>
                        </div>
                        <div class="panel-content ">
                            <div class="panel-heading">判赔同步监控</div>
                            <div class="panel-body">           
                                <div id="judge_div">
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
            <!--main content end-->
        </section>
        <!-- container section start -->

    </body>
    <%@include file="../template/script.jsp" %>

    <script>
        var color;
        $(document).ready(function () {
            $.ajax({
                url: "../systemSyncQuery",
                data: $('#queryForm').serialize(),
                type: "POST",
                dataType: "json",
                success: function (JData) {
                    $("#product_div").empty();
                    $("#product_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th>任务</th><th>计划时间</th><th>实际执行时间</th><th>实际完成时间</th><th>状态</th><th>操作</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
                    $.each(JData, function (index, element) {

                        if (element.statusCode == '0') {
                            color = "#B5FFB5";
                        } else {
                            color = "#FFB5B5";
                        }
                        $("#detailTable > tbody ").append("<tr role=\"row\" ><td>" + element.task + "</td><td>" + element.planDate + "</td><td>" + element.exeDate + "</td><td>" + element.compDate + "</td><td style=\"background-color:" + color + "\">" + element.status + "</td><td><select  inx=\"" + index + "\"  class=\"form-control m-bot15\"  name=\"operation\"> <option value=\"\">--</option><option value=\"R\">重新抓取</option></select></td></tr>");
                    });
                    $('#detailTable').DataTable({
                        columnDefs: [
                            {orderable: false, targets: 0}
                        ],
                        //     bFilter: false
                    });
                    $("select[name='operation']").change(function () {
                        if ($(this).val() === "R") {
                        }
                    });

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            });

            $.ajax({
                url: "../systemSyncQuery",
                data: $('#queryForm').serialize(),
                type: "POST",
                dataType: "json",
                success: function (JData) {
                    $("#order_div").empty();
                    $("#order_div").append("<table id=\"detailTable1\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th>任务</th><th>计划时间</th><th>实际执行时间</th><th>实际完成时间</th><th>状态</th><th>操作</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
                    $.each(JData, function (index, element) {

                        if (element.statusCode == '0') {
                            color = "#B5FFB5";
                        } else {
                            color = "#FFB5B5";
                        }
                        $("#detailTable1 > tbody ").append("<tr role=\"row\" ><td>" + element.task + "</td><td>" + element.planDate + "</td><td>" + element.exeDate + "</td><td>" + element.compDate + "</td><td style=\"background-color:" + color + "\">" + element.status + "</td><td><select  inx=\"" + index + "\"  class=\"form-control m-bot15\"  name=\"operation1\"> <option value=\"\">--</option><option value=\"R\">重新抓取</option></select></td></tr>");
                    });
                    $('#detailTable1').DataTable({
                        columnDefs: [
                            {orderable: false, targets: 0}
                        ],
                        //     bFilter: false
                    });
                    $("select[name='operation1']").change(function () {
                        if ($(this).val() === "R") {
                        }
                    });

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            });

            $.ajax({
                url: "../systemSyncQuery",
                data: $('#queryForm').serialize(),
                type: "POST",
                dataType: "json",
                success: function (JData) {
                    $("#judge_div").empty();
                    $("#judge_div").append("<table id=\"detailTable2\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th>任务</th><th>计划时间</th><th>实际执行时间</th><th>实际完成时间</th><th>状态</th><th>操作</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
                    $.each(JData, function (index, element) {

                        if (element.statusCode == '0') {
                            color = "#B5FFB5";
                        } else {
                            color = "#FFB5B5";
                        }
                        $("#detailTable2 > tbody ").append("<tr role=\"row\" ><td>" + element.task + "</td><td>" + element.planDate + "</td><td>" + element.exeDate + "</td><td>" + element.compDate + "</td><td style=\"background-color:" + color + "\">" + element.status + "</td><td><select  inx=\"" + index + "\"  class=\"form-control m-bot15\"  name=\"operation2\"> <option value=\"\">--</option><option value=\"R\">重新抓取</option></select></td></tr>");
                    });
                    $('#detailTable2').DataTable({
                        columnDefs: [
                            {orderable: false, targets: 0}
                        ],
                        //     bFilter: false
                    });
                    $("select[name='operation2']").change(function () {
                        if ($(this).val() === "R") {
                        }
                    });

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            });
        });
    </script>
