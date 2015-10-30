<%-- 
    Document   : customerContactEdit
    Created on : 2015/10/30, 上午 09:02:58
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
                                    <li><i class="icon_documents_alt"></i><a href="personManager.jsp">客户联系人管理</a></li>
                                    <li><i class="icon_documents_alt"></i>客户联系人新建</li>
                                </ol>
                            </div>
                        </div>
                        <div class="panel-content ">
                            <div class="panel-body">
                                <form id="addForm" class="form-horizontal " method="post"  >
                                    <input type="hidden" class="form-control" id="postType" name="postType" value="edit" >
                                    <div class="panel-heading"></div>
                                    <div class="panel-content">
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
                                            <label class="col-sm-2 control-label">客户简称</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="customerSortName" name="customerSortName">
                                            </div>
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
                                            <label class="col-sm-2 control-label">联系电话</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="contactNumber" name="contactNumber">
                                            </div>
                                            <label class="col-sm-2 control-label">发票地址</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="invoiceAddress" name="invoiceAddress">
                                            </div>
                                            <label class="col-sm-2 control-label">SFTP帐号</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="sftpAccountId" name="sftpAccountId">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">SFTP密码</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="sftpAccountPsw" name="sftpAccountPsw">
                                            </div>
                                            <label class="col-sm-2 control-label">SFTP IP(IPV4)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="sftpAccountIP4" name="sftpAccountIP4">
                                            </div>
                                            <label class="col-sm-2 control-label">SFTP IP(IPV6)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="sftpAccountIP6" name="sftpAccountIP6">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">SFTP路徑</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="sftpAccountPath" name="sftpAccountPath">
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
                $.ajax({
                    url: "../customerContactQuey",
                    //  data: $('#queryForm').serialize(),
                    type: "POST",
                    dataType: "json",
                    success: function (JData) {

                        $.each(JData, function (index, element) {
                            $("#customerIndustry").val(element.customerIndustry);
                            $("#customerCode").val(element.customerCode);
                            $("#customerName").val(element.customerName);
                            $("#customerSortName").val(element.customerSortName);
                            $("#customerAbb").val(element.customerAbb);
                            $("#contactPerson").val(element.contactPerson);
                            $("#contactNumber").val(element.contactNumber);
                            $("#invoiceAddress").val(element.invoiceAddress);
                            $("#sftpAccountId").val(element.sftpAccountId);
                            $("#sftpAccountPsw").val(element.sftpAccountPsw);
                            $("#sftpAccountIP4").val(element.sftpAccountIP4);
                            $("#sftpAccountIP6").val(element.sftpAccountIP6);
                            $("#sftpAccountPath").val(element.sftpAccountPath);

                        });


                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });

                $("#reset").click(function () {
                    $('#addForm')[0].reset();

                });

                //保存
                $("#submitBtn").click(function () {
                    $.ajax({
                        url: "../customerContactSave",
                        data: $('#addForm').serialize(),
                        type: "POST",
                        success: function (msg) {
                            alert(msg);
                            window.location.href = "customerContactManager.jsp";
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
