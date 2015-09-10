<%-- 
    Document   : orderReport
    Created on : 2015/9/10, 下午 04:21:46
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
                                    <li><i class="icon_documents_alt"></i>订单报表</li>
                                </ol>
                            </div>
                        </div>
                        <div class="panel-heading"></div>
                        <!--        <div class="panel-heading"><span style="font-size:36px;">产品管理</span><span style="font-size:24px;">&nbsp;产品报表</span></div>-->
                        <div class="panel-content ">
                            <div class="panel-body">           
                                <form id="queryForm" class="form-horizontal " method="get">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">订单代码</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="orderId" name="orderId">
                                        </div>
                                        <label class="col-sm-2 control-label">订单关键字</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="orderDesc" name="orderDesc">
                                        </div>
                                         <label class="col-sm-2 control-label">订单状态</label>
                                        <div class="col-sm-2">
                                           <select class="form-control m-bot15" id="orderStatus" name="orderStatus">
                                                <option value="0">关闭</option>
                                                <option value="1">有效</option>
                                                <option value="2">无效</option>
                                                <option value="3">判赔已发布</option>
                                                <option value="4">判赔已发布</option>
                                                <option value="5">判赔失败(其他因素)</option>
                                                <option value="6">判赔成功</option>
                                                <option value="7">判赔回退</option>
                                                <option value="8">待结账</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                         <label class="col-sm-2 control-label">保单号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="salesDoc" name="salesDoc">
                                        </div>
                                        <label class="col-sm-2 control-label">订单开始时间</label>
                                        <div class="col-sm-2">
                                            <input id="orderDate" name="orderDate" type="text" value="" size="16" class="form-control">
                                        </div>
                                        <label class="col">至</label>
                                        <div class="col-sm-2">
                                            <input id="orderDate1" name="orderDate1" type="text" value="" size="16" class="form-control">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"></label>
                                        <a class="btn btn-default"  title="查询" id="query">查询</a>
                                        <input type="reset" class="btn btn-default" value="重置">
                                    </div>
                                </form>
                                <div class="form-group">
                                    <button class="btn btn-default"  id="del">刪除</button>
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
        $(document).ready(function () {
            $('#orderDate').datepicker({
                dateFormat: 'yy/mm/dd'
            });
            $('#orderDate1').datepicker({
                dateFormat: 'yy/mm/dd'
            });


     

            $("#del").click(function () {

                var chkBoxArray = [];
                $('input[name="checkbox"]:checked').each(function () {
                    chkBoxArray.push($(this).val());
                });
                var data = 'checkbox="' + chkBoxArray + '"&postType=del';
                $.ajax({
                    url: "itemSave",
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
                    url: "../orderQuery",
                    data: $('#queryForm').serialize(),
                    type: "POST",
                    dataType: "json",
                    success: function (JData) {
                        $("#table_div").empty();
                        $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th></th><th>订单号</th><th>保单号</th><th>客户产品描述</th><th>保单成立日期</th><th>承保时间（起）</th><th>承保时间（讫）</th><th>保单状态</th><th>操作</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
                        $.each(JData, function (index, element) {
                            $("#detailTable > tbody ").append("<tr role=\"row\" ><td><input type=\"checkbox\" name=\"checkbox\" value=" + index + " ></td><td>" + element.orderId + "</td><td>" + element.salesDoc + "</td><td>" + element.orderDesc + "</td><td>" + element.orderDate + "</td><td>" + element.validFrom + "</td><td>" + element.validEnd + "</td><td>" + element.orderStatus + "</td><td><select  inx=\"" + index + "\"  class=\"form-control m-bot15\"  name=\"operation\"> <option value=\"\">--</option><option value=\"V\">查看</option><option value=\"D\">删除</option></select></td></tr>");
                        });
                        $('#detailTable').DataTable({
                            columnDefs: [
                                {orderable: false, targets: 0}
                            ],
                            //     bFilter: false
                        });
                        $("select[name='operation']").change(function () {
                            if ($(this).val() === "D") {
                                $("#main-content").load("order/itemEdit.jsp");
                            } else if ($(this).val() === "V") {
                                window.location.href = "orderView.jsp?key=" + $(this).attr("inx");
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
