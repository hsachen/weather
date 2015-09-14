<%-- 
    Document   : systemItemManager
    Created on : 2015/8/20, 上午 10:39:10
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
                                </ol>
                            </div>
                        </div>
                        <div class="panel-heading"></div>
                        <!--        <div class="panel-heading"><span style="font-size:36px;">产品管理</span><span style="font-size:24px;">&nbsp;产品报表</span></div>-->
                        <div class="panel-content ">
                            <div class="panel-body">           
                                <form id="queryForm" class="form-horizontal " method="get">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">项目编号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="itemCode" name="itemCode">
                                        </div>
                                        <label class="col-sm-1 control-label">保单建立日期</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="orderDate" name="orderDate">
                                        </div>
                                        <label class="col-sm-1 control-label">产品描述关键字</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="productDesc" name="productDesc">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">客户代码</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="customerCode" name="customerCode">
                                        </div>
                                        <label class="col-sm-1 control-label">承保开始时间</label>
                                        <div class="col-sm-2">
                                            <input id="validFrom" name="validFrom" type="text" value="" size="16" class="form-control">
                                        </div>
                                        <label  class="col-sm-1" >承保终止时间</label>
                                        <div class="col-sm-2">
                                            <input id="validEnd" name="validEnd" type="text" value="" size="16" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">产品代码</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="productCode" name="productCode">
                                        </div>
                                        <label class="col-sm-1 control-label">保单状态</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="orderStatus" name="orderStatus">
                                                <option value="0">所有保单</option>
                                                <option value="1">新增保单</option>
                                                <option value="2">活动期间保单</option>
                                                <option value="3">已判赔保单(错误)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"></label>
                                        <a class="btn btn-default"  title="查询" id="query">查询</a>
                                        <input type="reset" class="btn btn-default" value="重置">
                                    </div>
                                </form>
                                <div class="form-group">
                                    <button class="btn btn-default" id="btn_export">下载csv文件</button>
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
        var color;
        var color1;
        $(document).ready(function () {
            $('#productDate').datepicker({
                dateFormat: 'yy/mm/dd'
            });
            $('#productDate').datepicker({
                dateFormat: 'yy/mm/dd'
            });

            $("#del").click(function () {

                var chkBoxArray = [];
                $('input[name="checkbox"]:checked').each(function () {
                    chkBoxArray.push($(this).val());
                });
                var data = 'checkbox="' + chkBoxArray + '"&postType=del';
                $.ajax({
                    url: "../itemSave",
                    data: data,
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

            $("#query").click(function () {
                $.ajax({
                    url: "../systemItemQuery",
                    data: $('#queryForm').serialize(),
                    type: "GET",
                    dataType: "json",
                    success: function (JData) {
                        $("#table_div").empty();
                        $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th></th><th>项目号代码</th><th>客户代码</th><th>项目有效期（起）</th><th>项目有效期（讫）</th><th>项目状态</th><th>项目保单数量（项目目前的所有保单）</th><th>活动期保单数量（有效保单）</th><th>运行情况</th><th>结账情况</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
                        $.each(JData, function (index, element) {
                            if (element.operationStatusCode == '0') {
                                color = "#B5FFB5";
                            } else {
                                color = "#FFB5B5";
                            }
                            if (element.payStatusCode == '0') {
                                color1 = "#B5FFB5";
                            } else if (element.payStatusCode == '1'){
                                color1 = "#FFB5B5";
                            } else {
                                color1 = "white";
                            }
                            $("#detailTable > tbody ").append("<tr role=\"row\" ><td><input type=\"checkbox\" name=\"checkbox\" value=" + index + " ></td><td>" + element.itemCode + "</td><td>" + element.customerCode + "</td><td>" + element.itemValidFrom + "</td><td>" + element.itemValidEnd + "</td><td>" + element.itemStatus + "</td><td>" + element.itemOrderNum + "</td><td>" + element.activityOrderNum + "</td><td style=\"background-color:" + color + "\"><a href=\"systemSync.jsp?key=" + index + "\">" + element.operationStatus + "</a></td><td  style=\"background-color:" + color1 + "\"><a href=\"\">" + element.payStatus + "</a></td></tr>");
                        });
                        $('#detailTable').DataTable({
                            columnDefs: [
                                {orderable: false, targets: 0}
                            ],
                            //     bFilter: false
                        });
                        $("select[name='operation']").change(function () {
                            if ($(this).val() === "R") {
                                window.location.href = "orderReport.jsp?key=" + $(this).attr("inx");
                            } else if ($(this).val() === "V") {
                                window.location.href = "productEdit.jsp?key=" + $(this).attr("inx");
                            }
                        });

                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });
            });

            //匯出excel
            $("#btn_export").click(function (e) {
                window.open('data:application/vnd.ms-excel,' + encodeURIComponent($('div[id$=table_div]').html()));
                e.preventDefault();
            });

        });




    </script>

</html>
