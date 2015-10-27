<%-- 
    Document   : meteroNew
    Created on : 2015/10/16, 下午 02:59:49
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
                                    <li><i class="icon_documents_alt"></i><a href="meteroManager.jsp">天气要素</a></li>
                                    <li><i class="icon_documents_alt"></i>天气要素等级新建</li>
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
                                            <label class="col-sm-2 control-label">天气要素代码</label>
                                            <div class="col-sm-2">
                                                <select class="form-control m-bot15" id="metetoElementId" name="metetoElementId">
                                                </select>
                                                <a class="btn btn-default" href="meteroElementManager.jsp" target="_bank">編輯</a>
                                            </div>
                                            <label class="col-sm-2 control-label">天气要素等级标准</label>
                                            <div class="col-sm-2">
                                                <select class="form-control m-bot15" id="standardVersion" name="standardVersion">
                                                    <option value="GB">国标</option>
                                                    <option value="ISO">国际标准</option>
                                                    <option value="DB">地方标准;省市地</option>
                                                    <option value="HB">行标</option>
                                                </select>
                                            </div>
                                            <label class="col-sm-2 control-label">天气要素等级代码</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="metetoElementGrade" name="metetoElementGrade">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">等级衡量时间</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="timeBase" name="timeBase">
                                            </div>
                                            <label class="col-sm-2 control-label">等级衡量时间单位</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="timeBaseUnit" name="timeBaseUnit">
                                            </div>
                                            <label class="col-sm-2 control-label">操作符(下限)</label>
                                            <div class="col-sm-2">
                                                <select class="form-control m-bot15" id="operationLB" name="operationLB">
                                                    <option value=">">></option>
                                                    <option value=">=">>=</option>
                                                    <option value="<"><</option>
                                                    <option value="<="><=</option>
                                                    <option value="=">=</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">触发条件(下限)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="triggerPointLB" name="triggerPointLB">
                                            </div>
                                            <label class="col-sm-2 control-label">操作符(上限)</label>
                                            <div class="col-sm-2">
                                                <select class="form-control m-bot15" id="operationUB" name="operationUB">
                                                    <option value=">">></option>
                                                    <option value=">=">>=</option>
                                                    <option value="<"><</option>
                                                    <option value="<="><=</option>
                                                    <option value="=">=</option>
                                                </select>
                                            </div>
                                            <label class="col-sm-2 control-label">触发条件(上限)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="triggerPointUB" name="triggerPointUB">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">衡量基础单位</label>
                                            <div class="col-sm-2">
                                                <select class="form-control m-bot15" id="measureUnit" name="measureUnit">
                                                    <option value="1">mm</option>
                                                    <option value="2">cm</option>
                                                    <option value="3">C(摄氏度)</option>
                                                    <option value="4">mm3</option>
                                                    <option value="5">cm3</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <form id="uploadForm" class="form-horizontal " method="post" enctype="multipart/form-data" >
                                    <input type="hidden" class="form-control" id="postType" name="postType" value="upload" >
                                    <div class="panel-heading">批量新增</div>
                                    <div class="panel-content">
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
                /*
                 * 
                 * 数值要素
                 */
                var meteroE = "";
                $.ajax({
                    url: "../meteroElementQuery",
                    //   data: $('#areaForm').serialize(),
                    type: "GET",
                    success: function (JData) {
                        $.each(JData, function (index, element) {
                            meteroE += "<option value=\"" + element.id + "\">" + element.name + "</option>";
                        });
                        $("select[name='metetoElementId']").append(meteroE);
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
                        url: "../meteroSave",
                        data: $('#addForm').serialize(),
                        type: "POST",
                        success: function (msg) {
                            alert(msg);
                            window.location.href = "meteroManager.jsp";
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
