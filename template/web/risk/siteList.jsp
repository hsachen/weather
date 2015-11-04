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
                                <li><i class="icon_documents_alt"></i>站點組列表</li>
                            </ol>
                        </div>
                        <div class="panel-heading"></div>

                        <div class="panel-content ">
                            <div class="panel-body">     
                                <div class="form-group">

                                </div>
                                <div class="form-group">
                                    <button class="btn btn-default"  id="sel">確定</button>
                                </div>
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
            $("#sel").click(function () {

                var chkBoxArray = [];
                var site = "";
                $('input[name="checkbox"]:checked').each(function () {
                    //    chkBoxArray.push($(this).val());
                    site = site + $(this).val() + ";";
                });
                $('#eventInput', opener.document).val(site);
                window.close();
            });

            $.ajax({
                url: "../siteListQuery",
                data: $('#queryForm').serialize(),
                type: "POST",
                dataType: "json",
                success: function (JData) {
                    $("#table_div").empty();
                    $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th></th><th>站点组名称</th><th>站点组描述</th><th width=\"50%\">站点列表</th><th>操作</th></tr></thead><tfoot></tfoot><tbody></tbody></table>");
                    $.each(JData, function (index, element) {
                        $("#detailTable > tbody ").append("<tr role=\"row\" ><td><input type=\"checkbox\" name=\"checkbox\" value=" + element.siteName + " ></td><td>" + element.siteName + "</td><td>" + element.siteDesc + "</td><td>" + element.siteList + "</td><td><select  inx=\"" + index + "\"  class=\"form-control m-bot15\"  name=\"operation\"> <option value=\"\">--</option><option value=\"V\">查看</option></select></td></tr>");
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
                        } else if ($(this).val() === "D") {
                            $("#main-content").load("order/itemCheck.jsp");
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