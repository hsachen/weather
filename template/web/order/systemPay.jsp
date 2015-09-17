<%-- 
    Document   : systemPay
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
                                    <li><i class="icon_documents_alt"></i><a href="systemManager.jsp">系统监控</a></li>
                                    <li><i class="icon_documents_alt"></i>结账监控</li>

                                </ol>
                            </div>
                        </div>

                        <div class="panel-content ">
                            <div class="panel-heading">查看项目结账</div>
                            <form id="form1">
                                <div class="panel-body">           
                                    <div id="product_div">
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"></label>
                                        <a class="btn btn-default"  title="保存" id="submitBtn">保存</a>
                                    </div>
                                </div>
                            </form>
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
                url: "../systemPayQuery",
                data: $('#queryForm').serialize(),
                type: "POST",
                dataType: "json",
                success: function (JData) {
                    $("#product_div").empty();
                    $("#product_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th>项目编号</th><th>客户编号</th><th>项目有效日（起）</th><th>项目有效日（讫）</th><th>项目状态</th><th>币种</th><th>操作</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
                    $.each(JData, function (index, element) {

                        if (element.itemStatusCode == '0') {
                            color = "#B5FFB5";
                        } else {
                            color = "white";
                        }
                        $("#detailTable > tbody ").append("<tr role=\"row\" ><td>" + element.itemCode + "</td><td>" + element.customerCode + "</td><td>" + element.itemValidFrom + "</td><td>" + element.itemValidEnd + "</td><td style=\"background-color:" + color + "\">" + element.itemStatus + "</td><td>" + element.currency + "</td><td><select  inx=\"" + index + "\"  class=\"form-control m-bot15\"  name=\"operation\"> <option value=\"\">--</option><option value=\"0\">未结账</option><option value=\"1\">已结账</option></select></td></tr>");
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

            $('#submitBtn').click(function () {
                $.ajax({
                    url: "../systemPaySave",
                    data: $('#form1').serialize(),
                    type: "POST",
                    success: function (msg) {
                       alert(msg)

                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });
            });
        });
    </script>
