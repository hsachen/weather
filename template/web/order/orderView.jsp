<%-- 
    Document   : orderView
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
                                    <li><i class="fa fa-home"></i><a href="../index.jsp">Home</a></li>
                                    <li><i class="icon_documents_alt"></i><a href="productManager.jsp">产品管理</a></li>
                                    <li><i class="icon_documents_alt"></i><a href="orderReport.jsp">订单报表</a></li>
                                    <li><i class="icon_documents_alt"></i>订单查看</li>
                                </ol>
                            </div>
                        </div>
                        <div class="panel-heading"></div>
                        <!--        <div class="panel-heading"><span style="font-size:36px;">产品管理</span><span style="font-size:24px;">&nbsp;产品报表</span></div>-->
                        <div class="panel-content ">
                            <div class="panel-body">           
                                <form  class="form-horizontal " method="get">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">订单号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="orderId" name="orderId" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">保单号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="salesDoc" name="salesDoc"  disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">客户编号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="customerId" name="customerId">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">产品编号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="productID" name="productID" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">订单状态</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="orderStatus" name="orderStatus" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">客戶姓氏</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="lastName" name="lastName" disabled="disbled">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">名字</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="firtName" name="firtName" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">保费</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="premium" name="premium" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">币别</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="currency" name="currency" disabled="disbled">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">中国手机号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="mobile" name="mobile" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">性别</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="gender" name="gender" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">保单成立日期</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="orderDate" name="orderDate" disabled="disbled">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">承保时间(始)</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="validFrom" name="validFrom" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">承保时间(止)</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="validEnd" name="validEnd" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">实际发生时间</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="happenTime" name="happenTime" disabled="disbled">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">保险公司反馈接收时间</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="returnTime" name="returnTime" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">判赔触发量</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="resultQuantity" name="resultQuantity" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">当日最终发生值</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="resultNum" name="resultNum" disabled="disbled">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">依据站别代码</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="siteCode" name="siteCode" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">计量单位</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="measurementUnit" name="measurementUnit" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">客戶反饋判賠認定值</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="resultJudgeNum" name="resultJudgeNum" disabled="disbled">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">客户反馈判赔认定说明</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="resultJudgeDesc" name="resultJudgeDesc" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">订单入系统时间</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="sysOrderDate" name="sysOrderDate" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">订单更新时间</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="orderUpdateDate" name="orderUpdateDate" disabled="disbled">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">建立记录账号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="createBy" name="createBy" disabled="disbled">
                                        </div>
                                        <label class="col-sm-2 control-label">修改记录账号</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="changeBy" name="changeBy" disabled="disbled">
                                        </div>
                                    </div>
                                </form>
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

</html>
<script>
    //$("#query").click(function () {
    $.ajax({
        url: "../orderQuery",
        //  data: $('#queryForm').serialize(),
        type: "POST",
        dataType: "json",
        success: function (JData) {
            $("#table_div").empty();
            $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th></th><th>订单号</th><th>保单号</th><th>客户产品描述</th><th>保单成立日期</th><th>承保时间（起）</th><th>承保时间（讫）</th><th>保单状态</th><th>操作</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
            $.each(JData, function (index, element) {
                $("#orderId").val(element.orderId);
                $("#salesDoc").val(element.salesDoc);
                $("#orderDesc").val(element.orderDesc);
                $("#orderDate").val(element.orderDate);
                $("#validFrom").val(element.validFrom);
                $("#validEnd").val(element.validEnd);
                $("#orderStatus").val(element.orderStatus);
                $("#customerId").val(element.customerId);
                $("#productID").val(element.productID);
                $("#lastName").val(element.lastName);
                $("#firtName").val(element.firtName);
                $("#premium").val(element.premium);
                $("#currency").val(element.currency);
                $("#mobile").val(element.mobile);
                $("#gender").val(element.gender);
                $("#happenTime").val(element.happenTime);
                $("#returnTime").val(element.returnTime);
                $("#resultQuantity").val(element.resultQuantity);
                $("#resultNum").val(element.resultNum);
                $("#siteCode").val(element.siteCode);
                $("#measurementUnit").val(element.measurementUnit);
                $("#resultJudgeNum").val(element.resultJudgeNum);
                $("#resultJudgeDesc").val(element.resultJudgeDesc);
                $("#sysOrderDate").val(element.sysOrderDate);
                $("#orderUpdateDate").val(element.orderUpdateDate);
                $("#createBy").val(element.createBy);
                $("#changeBy").val(element.changeBy);


            });


        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
        }
    });
    //  });           
</script>