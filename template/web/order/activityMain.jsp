<%-- 
    Document   : activityMain
    Created on : 2015/9/1, 下午 04:10:41
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
                <li><i class="fa fa-home"></i><a href="index.jsp">Home</a></li>
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
                        <label class="col-sm-2 control-label">产品代码</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="productID" name="productID">
                        </div>
                        <label class="col-sm-2 control-label">产品名称</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="productName" name="productName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">活动代码</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="EventId" name="EventId">
                        </div>
                        <label class="col-sm-2 control-label">活动名称</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="EventName" name="EventName">
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">任务提交时间</label>
                        <div class="col-sm-2">
                            <input id="submitDate" name="submitDate" type="text" value="" size="16" class="form-control">
                        </div>
                        <label class="col">至</label>
                        <div class="col-sm-2">
                            <input id="submitDate1" name="submitDate1" type="text" value="" size="16" class="form-control">
                        </div>

                    </div>


                    <div class="form-group">
                        <label class="col-sm-5 control-label"></label>
                        <a class="btn btn-default"  title="查询" id="query">查询</a>
                        <input type="reset" class="btn btn-default" value="重置">
                    </div>
                </form>
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
        $('#submitDate').datepicker({
            dateFormat: 'yy/mm/dd'
        });
        $('#submitDate1').datepicker({
            dateFormat: 'yy/mm/dd'
        });

        $("#query").click(function () {
            $.ajax({
                url: "../activityQuery",
                data: $('#queryForm').serialize(),
                type: "POST",
                dataType: "json",
                success: function (JData) {
                    $("#table_div").empty();
                    $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th>产品代码</th><th>产品名称</th><th>活动代码</th><th>活动名称</th><th>任务编号</th><th>任务状态</th><th>任务提交时间</th><th>操作</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
                    $.each(JData, function (index, element) {
                        $("#detailTable > tbody ").append("<tr role=\"row\" ></td><td>" + element.productID + "</td><td>" + element.productName + "</td><td>" + element.EventId + "</td><td>" + element.EventName + "</td><td>" + element.taskId + "</td><td>" + element.taskStatus + "</td><td>" + element.submitDate + "</td><td><select class=\"form-control m-bot15\" id=\"operation\" name=\"operation\" key='" + element.EventId + "'> <option value=\"\">--</option><option value=\"C\">确定活动代码</option><option value=\"V\">查看详情</option></select></td></tr>");
                    });
                    $('#detailTable').DataTable({
                        columnDefs: [
                            {orderable: false, targets: 0}
                        ],
                        //     bFilter: false
                    });

                    $("#operation").change(function () {
                        if ($(this).val() === "V") {
                            //   $("#main-content").load("order/itemEdit.jsp");
                        } else if ($(this).val() === "C") {
                            $('#eventInput', opener.document).val($(this).attr("key"));
                            window.close();
                        }
                    });
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            });
        });
    });
</script>
</html>