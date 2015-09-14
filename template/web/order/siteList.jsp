<%-- 
    Document   : siteList
    Created on : 2015/9/8, 下午 02:14:10
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
                        <div class="col-lg-12">
                            <ol class="breadcrumb">
                                <li><i class="fa fa-home"></i><a href="../index.jsp">Home</a></li>
                                <li><i class="icon_documents_alt"></i><a href="index.jsp?path=order/productManager.jsp">产品管理</a></li>
                                <li><i class="icon_documents_alt"></i>活动评估详情</li>
                            </ol>
                        </div>
                        <div class="panel-heading"><span style="font-size:24px;">&nbsp;站点列表</span></div>

                        <div class="panel-content ">
                            <div class="panel-body">           
                                <div id="table_div">
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
        $(document).ready(function () {

            $.ajax({
                url: "../siteListQuery",
                data: $('#queryForm').serialize(),
                type: "POST",
                dataType: "json",
                success: function (JData) {
                    $("#table_div").empty();
                    $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th>站点组名称</th><th>站点组描述</th><th>站点列表</th></tr></thead><tfoot></tfoot><tbody></tbody></table>");
                    $.each(JData, function (index, element) {
                        $("#detailTable > tbody ").append("<tr role=\"row\" ><td>" + element.siteName + "</td><td>" + element.siteDesc + "</td><td>" + element.siteList + "</td></tr>");
                    });
                    $('#detailTable').DataTable({
                        columnDefs: [
                            {orderable: false, targets: 0}
                        ],
                        //     bFilter: false
                    });

                    $("#operation").change(function () {
                        if ($(this).val() === "E") {
                            $("#main-content").load("order/itemEdit.jsp");
                        } else if ($(this).val() === "C") {
                            $("#main-content").load("order/itemCheck.jsp");
                        } else if ($(this).val() === "V") {
                            $("#main-content").load("order/itemView.jsp");
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