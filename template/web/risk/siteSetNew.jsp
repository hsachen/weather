<%-- 
    Document   : siteSetManagement
    Created on : 2015/9/8, 下午 02:14:10
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
                        <div class="col-lg-12">
                            <ol class="breadcrumb">
                                <li><i class="fa fa-home"></i><a href="../index.jsp">Home</a></li>
                                <li><i class="icon_documents_alt"></i><a href="siteSetManagement.jsp">站點組列表</a></li>
                                <li><i class="icon_documents_alt"></i>新建站點組</li>
                            </ol>
                        </div>
                        <div class="panel-heading"></div>

                        <div class="panel-content ">
                            <div class="panel-body">     
                                <div class="panel-body">手动输入  
                                <form class="form-horizontal" method="post" id="areaForm">
                                    <input type="hidden" name="inputForm" value="S" >
                                    <div class="form-group">
                                        <div class="col-sm-1">
                                            <div class="radio">
                                                <input type="radio" name="inputType" id="inputType" value="0" checked="checked">
                                                行政区域
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="areaName" name="areaName">
                                        </div>
                                        <label class="col-sm-1 control-label">观测站点关系</label>
                                        <div class="col-sm-3">
                                            <select class="form-control m-bot15" id="observeSite" name="observeSite">
                                                <option value="1">单一站点</option>
                                                <option value="2">多站点代表</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1">
                                            <div class="radio">
                                                <input type="radio" name="inputType" id="inputType1" value="1" >
                                                经纬海拔
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="longLaAl" name="longLaAl" readonly>
                                        </div>
                                        <label class="col-sm-1 control-label">半径(km)</label>
                                        <div class="col-sm-1">
                                            <input type="text" class="form-control"  id="siteRadius" name="siteRadius" readonly>
                                        </div>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" placeholder="输入经纬度命名" id="surveyName" name="surveyName" readonly>
                                        </div>
                                        <div class="col-sm-3">
                                            <a class="btn btn-default"  title="確定" id="saveName">確定</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
         <div class="panel-body">批量输入           
                                <form class="form-horizontal " method="post" enctype="multipart/form-data" id="batchForm">
                                    <input type="hidden" name="inputForm" value="B" >
                                    
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">批量模板</label>
                                        <div class="col-sm-3">
                                            <a class="btn btn-default" href="download.xls" title="確定" target="_blank">下載</a>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="file" class="form-control" name="file">
                                        </div>
                                        <div class="col-sm-3">
                                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#siteModal" >站点确认</button>
                                        </div>
                                    </div>

                                    <div class="modal fade" id="siteModal" tabindex="-1" role="dialog" aria-labelledby="">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="exampleModalLabel">请确认站点</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="hidden" name="inputForm" value="B" >
                                                    <div id="treeCheckbox">
                                                    </div>
                                                    <div>
                                                        <input type="text" placeholder="输入站点组名称" id="siteName" name="siteName">
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal" id="modelSave">保存</button>
                                                        <button type="button" class="btn btn-primary" id="modelSubmit">确定</button>
                                                    </div>
                                                    <input type="hidden" name="inputForm" value="B" >
                                                    <div id="treeCheckbox2">
                                                    </div>
                                                    <div>
                                                        <input type="text" placeholder="输入站点组名称" id="siteName2" name="siteName2">
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal" id="modelSave2">保存</button>
                                                        <button type="button" class="btn btn-primary" id="modelSubmit2">确定</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"  id="saveModal" aria-labelledby="saveModal">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">
                                            <div class="modal-body" id="saveModalContent">
                                            </div>
                                            <div class="modal-footer">
                                                <a href="index.jsp?path=order/siteList.jsp" class="btn btn-default" target="_blank">查看</a>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
                                                <button type="button" class="btn btn-default" id="siteReturn" data-dismiss="modal">返回</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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

        
        });




    </script>