<%-- 
    Document   : observeSiteManager
    Created on : 2015/10/22, 下午 02:52:30
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
                                    <li><i class="icon_documents_alt"></i>观测站</li>
                                </ol>
                            </div>
                        </div>
                        <div class="panel-heading"></div>
                        <!--        <div class="panel-heading"><span style="font-size:36px;">产品管理</span><span style="font-size:24px;">&nbsp;调取活动代码</span></div>-->
                        <div class="panel-content ">
                            <div class="panel-body">           
                                <form id="queryForm" class="form-horizontal " method="post">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">实况观测站站号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="observeSiteId" name="observeSiteId">
                                        </div>
                                        <label class="col-sm-2 control-label">观测站类别</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="observeSiteType" name="observeSiteType">
                                                <option value=""></option>
                                                <option value="1">人工观测站-基本站</option>
                                                <option value="2">人工观测站-一般站</option>
                                                <option value="9">自动观测站</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">站点名称</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="observeSiteName" name="observeSiteName">
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <label class="col-sm-2 control-label">观测站状态</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="status" name="status">
                                                <option value=""></option>
                                                <option value="0">不可用</option>
                                                <option value="1">可用</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">是否为考核站</label>
                                        <div class="col-sm-2">
                                           <select class="form-control m-bot15" id="evaluationFlag" name="evaluationFlag">
                                                <option value=""></option>
                                                <option value="0">否</option>
                                                <option value="1">是</option>
                                            </select>
                                        </div>
                                         <label class="col-sm-2 control-label">中国天气网预报编码</label>
                                        <div class="col-sm-2">
                                             <input type="text" class="form-control" id="weatherCNSiteId" name="weatherCNSiteId">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"></label>
                                        <a class="btn btn-default"  title="查询" id="query">查询</a>
                                        <input type="reset" class="btn btn-default" value="重置">
                                    </div>
                                </form>
                                <div class="form-group">
                                    <a class="btn btn-default" href="observeSiteNew.jsp">新建</a>
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

            $("#query").click(function () {
                $("#table_div").mask("Loading...");
                $.ajax({
                    url: "../observeSiteQuery",
                    data: $('#queryForm').serialize(),
                    type: "POST",
                    dataType: "json",
                    success: function (JData) {

                        $("#table_div").empty();
                        $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th></th><th>实况观测站站号</th><th>观测站类别</th><th>站点名称</th><th>经度</th><th>纬度</th><th>海拔高度</th><th>观测站状态</th><th>操作</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
                        $.each(JData, function (index, element) {
                            $("#detailTable > tbody ").append("<tr role=\"row\" ><td><input type=\"checkbox\" name=\"checkbox\" value=" + index + " ></td><td>" + element.observeSiteId + "</td><td>" + element.observeSiteTypeDesc + "</td><td>" + element.observeSiteName + "</td><td>" + element.longitude + "</td><td>" + element.latitude + "</td><td>" + element.altitude + "</td><td>" + element.statusDesc + "</td><td><select inx=\"" + index + "\" class=\"form-control m-bot15\" id=\"operation\" name=\"operation\"> <option value=\"\">--</option><option value=\"E\">編輯</option>-</option><option value=\"V\">查看</option></select></td></tr>");
                        });
                        $('#detailTable').DataTable({
                            columnDefs: [
                                {orderable: false, targets: 0}
                            ],
                            //     bFilter: false
                        });

                        $("#operation").change(function () {
                            if ($(this).val() === "E") {
                                window.location.href = "observeSiteEdit.jsp?key=" + $(this).attr("inx");
                            } else if ($(this).val() === "V") {
                                window.location.href = "observeSiteView.jsp?key=" + $(this).attr("inx");

                            }
                        });
                        $("#table_div").unmask();
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

            $("#del").click(function () {

                var chkBoxArray = [];
                $('input[name="checkbox"]:checked').each(function () {
                    chkBoxArray.push($(this).val());
                });
                var data = 'checkbox="' + chkBoxArray + '"&postType=del';
                $.ajax({
                    url: "../adminSave",
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

        });
    </script>
</html>