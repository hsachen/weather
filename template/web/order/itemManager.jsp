<%-- 
    Document   : itemManager
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
                                    <li><i class="icon_documents_alt"></i>项目管理</li>
                                </ol>
                            </div>
                        </div>

                        <div class="panel-content ">
                            <div class="panel-body">           
                                <form id="queryForm" class="form-horizontal " method="get">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">项目编号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="projectCode" name="projectCode">
                                        </div>
                                        <label class="col-sm-2 control-label">项目开始时间</label>
                                        <div class="col-sm-2">
                                            <input id="validFrom" name="validFrom" type="text" value="" size="16" class="form-control">
                                        </div>
                                        <label class="col">至</label>
                                        <div class="col-sm-2">
                                            <input id="validFrom1" name="validFrom1" type="text" value="" size="16" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">客户编号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="customerId" name="customerId">
                                        </div>
                                        <label class="col-sm-2 control-label">项目结束时间</label>
                                        <div class="col-sm-2">
                                            <input id="validEnd" name="validEnd" type="text" value="" size="16" class="form-control">
                                        </div>
                                        <label class="col">至</label>
                                        <div class="col-sm-2">
                                            <input id="validEnd1" name="validEnd1" type="text" value="" size="16" class="form-control">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">项目状态</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="projectStatus" name="projectStatus">
                                                <option value="0">结项</option>
                                                <option value="I">IT项目对接确认</option>
                                                <option value="P">保险项目经理确认</option>
                                                <option value="D">保险项目总监确认</option>
                                                <option value="V">保险项目副总确认</option>
                                                <option value="1">启用</option>
                                                <option value="2">暂停</option>
                                                <option value="3">结算</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">项目名称关键字</label>
                                        <div class="col-sm-2">
                                            <input id="projectName" name="projectName" type="text"   class="form-control">
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"></label>
                                        <a class="btn btn-default"  title="查询" id="query">查询</a>
                                        <input type="reset" class="btn btn-default" value="重置">
                                    </div>
                                </form>
                                <div class="form-group">
                                    <a class="btn btn-default" href="itemNew.jsp">新建</a>
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
            $('#validFrom').datepicker({
                dateFormat: 'yy/mm/dd'
            });
            $('#validFrom1').datepicker({
                dateFormat: 'yy/mm/dd'
            });

            $('#validEnd').datepicker({
                dateFormat: 'yy/mm/dd'
            });
            $('#validEnd1').datepicker({
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
                    url: "../itemQuery",
                    data: $('#queryForm').serialize(),
                    type: "POST",
                    dataType: "json",
                    success: function (JData) {
                        $("#table_div").empty();
                        $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th></th><th>项目编号</th><th>客户编号</th><th>项目有效日（起）</th><th>项目有效日（讫）</th><th>项目状态</th><th>修改时间</th><th>修改人</th><th>操作</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
                        $.each(JData, function (index, element) {
                            $("#detailTable > tbody ").append("<tr role=\"row\" ><td><input type=\"checkbox\" name=\"checkbox\" value=" + index + " ></td><td>" + element.projectCode + "</td><td>" + element.customerId + "</td><td>" + element.validFrom + "</td><td>" + element.validEnd + "</td><td>" + element.projectStatus + "</td><td>" + element.logTime + "</td><td>" + element.logUser + "</td><td><select inx=\"" + index + "\" class=\"form-control m-bot15\" id=\"operation\" name=\"operation\"> <option value=\"\">--</option><option value=\"E\">編輯</option><option value=\"V\">查看</option><option value=\"C\">審核</option></select></td></tr>");
                        });
                        $('#detailTable').DataTable({
                            columnDefs: [
                                {orderable: false, targets: 0}
                            ],
                            //     bFilter: false
                        });

                        $("#operation").change(function () {
                            if ($(this).val() === "E") {
                                window.location.href = "itemEdit.jsp?key=" + $(this).attr("inx");
                            } else if ($(this).val() === "C") {
                                window.location.href = "itemCheck.jsp?key=" + $(this).attr("inx");
                            } else if ($(this).val() === "V") {
                                window.location.href = "itemView.jsp?key=" + $(this).attr("inx");

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