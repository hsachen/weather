<%-- 
    Document   : oederEdit
    Created on : 2015/10/19, 上午 10:15:04
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
                                    <li><i class="icon_documents_alt"></i>保单编辑</li>
                                </ol>
                            </div>
                        </div>
                        <div class="panel-content ">
                            <div class="panel-body">
                                 <form id="editForm" class="form-horizontal " method="get">
                                          <input type="hidden" class="form-control" id="postType" name="postType" value="edit" >
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">项目代码</label>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="itemCode" name="项目代码">
                                        </div>
                                        <label class="col-sm-2 control-label">客户代码</label>
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
                                        <label class="col-sm-2 control-label">承保开始时间</label>
                                        <div class="col-sm-2">
                                            <input id="validFrom" name="validFrom" type="text" value="" size="16" class="form-control">
                                        </div>
                                        <label  class="col-sm-2 control-label" >承保终止时间</label>
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
                    url: "../systemProMakeQuery",
                    //  data: $('#queryForm').serialize(),
                    type: "POST",
                    dataType: "json",
                    success: function (JData) {

                        $.each(JData, function (index, element) {
                            $("#itemCode").val(element.itemCode);
                            $("#customerId").val(element.customerId);
                            $("#salesDoc").val(element.salesDoc);
                            $("#orderId").val(element.orderId);
                            $("#productCode").val(element.productCode);
                            $("#validFrom").val(element.validFrom);
                            $("#validEnd").val(element.validEnd);
                            $("#premium").val(element.premium);

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
                        url: "../orderSave",
                        data: $('#editForm').serialize(),
                        type: "POST",
                        success: function (msg) {
                            alert(msg);
                            window.location.href = "orderNew.jsp";
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