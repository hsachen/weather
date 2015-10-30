<%-- 
    Document   : customerContactManager
    Created on : 2015/10/16, 下午 04:52:14
    Author     : Z00907
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
                                    <li><i class="icon_documents_alt"></i>客户联系人管理</li>
                                </ol>
                            </div>
                        </div>
                        <div class="panel-heading"></div>
                        <!--        <div class="panel-heading"><span style="font-size:36px;">产品管理</span><span style="font-size:24px;">&nbsp;调取活动代码</span></div>-->
                        <div class="panel-content ">
                            <div class="panel-body">           
                                <form id="queryForm" class="form-horizontal " method="post">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">客户分类代码</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="customerIndustry" name="customerIndustry">
                                                <option value=""></option>
                                                <option value="I">保险公司</option>
                                                <option value="C">谘询公司</option>
                                                <option value="G">政府</option>
                                                <option value="E">科研教育</option>
                                                <option value="X">气象局</option>
                                                <option value="N">NGO</option>
                                                <option value="B">商业公司</option>
                                                <option value="P">个人</option>

                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">客户代码</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="customerCode" name="customerCode">
                                        </div>
                                        <label class="col-sm-2 control-label">客户名称</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="customerName" name="customerName">
                                        </div>
                                        
                                    </div>
                                    <div class="form-group">
                                               <label class="col-sm-2 control-label">客户英文简称</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="customerAbb" name="customerAbb">
                                        </div>
                                        <label class="col-sm-2 control-label">联系人</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="contactPerson" name="contactPerson">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"></label>
                                        <a class="btn btn-default"  title="查询" id="query">查询</a>
                                        <input type="reset" class="btn btn-default" value="重置">
                                    </div>
                                </form>
                                <div class="form-group">
                                    <a class="btn btn-default" href="personNew.jsp">新建</a>
                                    <button class="btn btn-default"  id="del">刪除</button>
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
                    url: "../customerContactQuey",
                    data: $('#queryForm').serialize(),
                    type: "POST",
                    dataType: "json",
                    success: function (JData) {

                        $("#table_div").empty();
                        $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th></th><th>客户分类代码</th><th>客户代码</th><th>客户名称</th><th>客户英文简称</th><th>联系人</th><th>操作</th> </tr></thead><tfoot></tfoot><tbody></tbody></table>");
                        $.each(JData, function (index, element) {
                            $("#detailTable > tbody ").append("<tr role=\"row\" ><td><input type=\"checkbox\" name=\"checkbox\" value=" + index + " ></td><td>" + element.customerIndustry + "</td><td>" + element.customerCode + "</td><td>" + element.customerName + "</td><td>" + element.customerAbb + "</td><td>" + element.contactPerson + "</td><td><select inx=\"" + index + "\" class=\"form-control m-bot15\" id=\"operation\" name=\"operation\"> <option value=\"\">--</option><option value=\"E\">編輯</option>-</option></option><option value=\"V\">查看</option>-</option></select></td></tr>");
                        });
                        $('#detailTable').DataTable({
                            columnDefs: [
                                {orderable: false, targets: 0}
                            ],
                            //     bFilter: false
                        });

                        $("#operation").change(function () {
                            if ($(this).val() === "E") {
                                window.location.href = "customerContactEdit.jsp?key=" + $(this).attr("inx");
                            } else if ($(this).val() === "V") {
                                window.location.href = "customerContactView.jsp?key=" + $(this).attr("inx");
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


            $("#del").click(function () {

                var chkBoxArray = [];
                $('input[name="checkbox"]:checked').each(function () {
                    chkBoxArray.push($(this).val());
                });
                var data = 'checkbox="' + chkBoxArray + '"&postType=del';
                $.ajax({
                    url: "../personSave",
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
