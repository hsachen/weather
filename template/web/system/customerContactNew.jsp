<%-- 
    Document   : customerContactNew
    Created on : 2015/10/19, 上午 09:02:58
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
                                    <li><i class="icon_documents_alt"></i><a href="personManager.jsp">用户管理</a></li>
                                    <li><i class="icon_documents_alt"></i>用户新建</li>
                                </ol>
                            </div>
                        </div>
                        <div class="panel-content ">
                            <div class="panel-body">
                                <form id="addForm" class="form-horizontal " method="post"  >
                                    <input type="hidden" class="form-control" id="postType" name="postType" value="add" >
                                    <div class="panel-heading"></div>
                                    <div class="panel-content">
                                        <div class="form-group">
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
                                                <label class="col-sm-2 control-label">用户代碼</label>
                                                <div class="col-sm-2">
                                                    <input type="text" class="form-control" id="userId" name="userId">
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">用户名</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="userId" name="userId">
                                            </div>
                                            <label class="col-sm-2 control-label">密码</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="userpwd" name="userpwd">
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">真实姓名</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="userName" name="userName">
                                            </div>
                                            <label class="col-sm-2 control-label">手机号</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="cellPhone" name="cellPhone">
                                            </div>
                                            <label class="col-sm-2 control-label">邮箱地址</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="eMail" name="eMail">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">生效日期(起)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="validFrom" name="validFrom">
                                            </div>
                                            <label class="col-sm-2 control-label">生效日期(迄)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="validEnd" name="validEnd">
                                            </div>
                                            <label class="col-sm-2 control-label">用户权限</label>
                                            <div class="col-sm-2">
                                                <select class="form-control m-bot15" id="userPrivilege" name="userPrivilege">
                                                    <option value="1">全部权限（admin才可对用户管理修改）</option>
                                                    <option value="2">全部权限（项目副总）</option>
                                                    <option value="3">全部权限（项目总监）</option>
                                                    <option value="4">全部权限（项目经理）</option>
                                                    <option value="5">普通用户（仅可查看）</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label"></label>
                                    <a class="btn btn-default"  title="保存" id="submitBtn">保存</a>
                                    <input type="reset" class="btn btn-default" value="重置">
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
            <!--main content end-->
        </section>
        <!-- container section start -->
        <%@include file="../template/script.jsp" %>

        <script>
            $(document).ready(function () {

                $('#validFrom').datepicker({
                    dateFormat: 'yy/mm/dd'
                });
                $('#validEnd').datepicker({
                    dateFormat: 'yy/mm/dd'
                });
                $("#reset").click(function () {
                    $('#addForm')[0].reset();

                });

                //保存
                $("#submitBtn").click(function () {
                    $.ajax({
                        url: "../personSave",
                        data: $('#addForm').serialize(),
                        type: "POST",
                        success: function (msg) {
                            alert(msg);
                            window.location.href = "personManager.jsp";
                            //       $("#main-content").load("order/itemManager.jsp");
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(xhr.status);
                            alert(thrownError);
                        }
                    });
                });

            });

        </script>
    </body>

</html>
