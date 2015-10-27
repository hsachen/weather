<%-- 
    Document   : adminNew
    Created on : 2015/10/16, 上午 10:04:05
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
                                    <li><i class="icon_documents_alt"></i><a href="adminMain.jsp">行政区</a></li>
                                    <li><i class="icon_documents_alt"></i>行政区新建</li>
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
                                            <label class="col-sm-2 control-label">行政区域代码</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="areaCode1" name="areaCode1">
                                            </div>
                                            <label class="col-sm-2 control-label">行政区域代码2</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="areaCode2" name="areaCode2">
                                            </div>
                                            <label class="col-sm-2 control-label">国名(中文)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="countryCN" name="countryCN">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">国名(英文)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="countryEN" name="countryEN">
                                            </div>
                                            <label class="col-sm-2 control-label">F_area_code</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="fAreaCode" name="fAreaCode">
                                            </div>
                                            <label class="col-sm-2 control-label">省名(中文)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="provinceCN" name="provinceCN">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">省名(英文)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="provinceEN" name="provinceEN">
                                            </div>
                                            <label class="col-sm-2 control-label">邮政编码</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="postCode" name="postCode">
                                            </div>
                                            <label class="col-sm-2 control-label">中国天气网区域代码</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="areaCode" name="areaCode">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">城市名称(中文)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="ciryCN" name="ciryCN">
                                            </div>
                                            <label class="col-sm-2 control-label">城市名称(英文)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="ciryEN" name="ciryEN">
                                            </div>
                                            <label class="col-sm-2 control-label">实况观测站代码</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="observeSiteId" name="observeSiteId">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">预报站代码</label>
                                            <div class="col-sm-2">
                                                <input id="forecastSiteId" name="forecastSiteId" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">预报替代站代码</label>
                                            <div class="col-sm-2">
                                                <input id="forecastASiteId" name="forecastASiteId" type="text" value="" class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">雷达站代码</label>
                                            <div class="col-sm-2">
                                                <input id="radarId" name="radarId" type="text" value=""  class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">经度(行政区代表经度)</label>
                                            <div class="col-sm-2">
                                                <input id="longitude" name="longitude" type="text" value=""  class="form-control">
                                            </div>
                                            <label class="col-sm-2 control-label">纬度(行政区代表纬度)</label>
                                            <div class="col-sm-2">
                                                <input id="latitude" name="latitude" type="text" value="" class="form-control" >
                                            </div>
                                            <label class="col-sm-2 control-label">海拔高度(行政区代表海拔高度)</label>
                                            <div class="col-sm-2">
                                                <input id="altitude" name="altitude" type="text" value="" class="form-control">
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


                $("#reset").click(function () {
                    $('#addForm')[0].reset();

                });

                //保存
                $("#submitBtn").click(function () {
                    $.ajax({
                        url: "../adminSave",
                        data: $('#addForm').serialize(),
                        type: "POST",
                        success: function (msg) {
                            alert(msg);
                            window.location.href = "adminView.jsp";
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
