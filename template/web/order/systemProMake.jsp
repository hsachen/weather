<%-- 
    Document   : systemProMake
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
                                    <li><i class="fa fa-home"></i><a href="../index.jsp">Home</a></li>
                                    <li><i class="icon_documents_alt"></i><a href="systemManager.jsp">系统监控</a></li>
                                    <li><i class="icon_documents_alt"></i>保单补录</li>
                                </ol>
                            </div>
                        </div>
                        <div class="panel-heading"></div>
                        <!--        <div class="panel-heading"><span style="font-size:36px;">产品管理</span><span style="font-size:24px;">&nbsp;调取活动代码</span></div>-->
                        <div class="panel-content ">
                            <div class="panel-body">     

                                <form id="queryForm" class="form-horizontal " method="get">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">项目编号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="itemCode" name="itemCode">
                                        </div>
                                        <label class="col-sm-2 control-label">客户编号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="customerId" name="customerId">
                                        </div>
                                        <label class="col-sm-2 control-label">保单号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="salesDoc" name="salesDoc">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">订单号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="orderId" name="orderId">
                                        </div>
                                        <label class="col-sm-2 control-label">有效时间（起）</label>
                                        <div class="col-sm-2">
                                            <input id="validFrom" name="validFrom" type="text" value="" size="16" class="form-control">
                                        </div>
                                        <label  class="col-sm-2 control-label" >有效时间（讫）</label>
                                        <div class="col-sm-2">
                                            <input id="validEnd" name="validEnd" type="text" value="" size="16" class="form-control">
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">产品代码</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="productCode" name="productCode">
                                        </div>
                                        <label class="col-sm-2 control-label">保费价格</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="premium" name="premium" >
                                        </div>
                                        <label class="col-sm-2 control-label">姓氏</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="lastName" name="lastName" >
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">名称</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="name" name="name" >
                                        </div>
                                        <label class="col-sm-2 control-label">币种</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="currency" name="currency" >
                                        </div>
                                        <label class="col-sm-2 control-label">中国手机号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="mobile" name="mobile" >
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">性别</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="gender" name="gender" >
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"></label>
                                        <a class="btn btn-default"  title="查询" id="query">补录</a>

                                    </div>
                                </form>
                                <br>
                                <div > 
                                    <form id="uploadForm" class="form-horizontal " method="post" enctype="multipart/form-data" >


                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">批量模板</label>
                                            <div class="col-sm-3">
                                                <a class="btn btn-default" href="download.xls" title="確定" target="_blank">下載</a>
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="file" class="form-control" name="file">
                                            </div>
                                            <div class="col-sm-3">
                                                <button type="button" class="btn btn-default" id="uploadBtn"  >上传</button>
                                            </div>
                                        </div>

                                    </form>
                                </div>
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

            $("#query").click(function () {
                $("#table_div").mask("Loading...");
                $.ajax({
                    url: "../systemProMakeQuery",
                    data: $('#queryForm').serialize(),
                    type: "POST",
                    dataType: "json",
                    success: function (JData) {
                        $("#table_div").empty();
                        $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th></th><th>订单号</th><th>保单号</th><th>客户产品描述</th><th>保单成立日期</th><th>承保时间（起）</th><th>承保时间（讫</th><th>保单状态</th><th>操作</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
                        $.each(JData, function (index, element) {
                            $("#detailTable > tbody ").append("<tr role=\"row\" ><td><input type=\"checkbox\" name=\"checkbox\" value=" + index + " ></td><td>" + element.itemCode + "</td><td>" + element.salesDoc + "</td><td>" + element.prodName + "</td><td>" + element.orderDate + "</td><td>" + element.validFrom + "</td><td>" + element.validEnd + "</td><td>" + element.orderState + "</td><td><select inx=\"" + index + "\" class=\"form-control m-bot15\" id=\"operation\" name=\"operation\"> <option value=\"\">--</option><option value=\"E\">編輯</option><option value=\"V\">查看</option><option value=\"C\">審核</option></select></td></tr>");
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
                        $("#table_div").unmask();
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });
            });

            //上傳
            $("#uploadBtn").click(function () {
                $.ajax({
                    url: "../productSave",
                    data: $('#uploadForm').serialize(),
                    type: "POST",
                    success: function (msg) {
                        alert(msg);
                        //       $("#main-content").load("order/itemManager.jsp");
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });
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
        });
    </script>
</html>