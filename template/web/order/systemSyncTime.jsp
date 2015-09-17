<%-- 
    Document   : systemSyncTime
    Created on : 2015/8/20, 上午 10:39:10
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
                                    <li><i class="icon_documents_alt"></i><a href="systemSync.jsp">同步监控</a></li>
                                    <li><i class="icon_documents_alt"></i>同步时间设定</li>
                                </ol>
                            </div>
                        </div>
                        <form id="formSet">
                            <div class="panel-content ">
                                <div class="panel-heading">产品同步属性</div>
                                <div class="panel-body">           
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">产品同步方式</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="productSyncMethod" name="productSyncMethod">
                                                <option value="0">OFF LINE</option>
                                                <option value="1">API</option>
                                                <option value="2">FTP</option>
                                                <option value="3">SFTP</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">产品同步属性</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="productSyncProperty" name="productSyncProperty">
                                                <option value="0">上线前一次完成</option>
                                                <option value="R">实时</option>
                                                <option value="D">每日</option>
                                                <option value="W">每周</option>
                                                <option value="M">每月</option>
                                                <option value="A">指定时间</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">指定整点同步</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="productSyncOnTime" name="productSyncOnTime">
                                                <% for (int i = 1; i <= 24; i++) {
                                                        out.print("<option value=" + i + ">" + i + "</option>");
                                                    }%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-content ">
                                <div class="panel-heading">保单同步属性</div>
                                <div class="panel-body"> 
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">保单同步方式</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="orderSyncMethod" name="orderSyncMethod">
                                                <option value="0">OFF LINE</option>
                                                <option value="1">API</option>
                                                <option value="2">FTP</option>
                                                <option value="3">SFTP</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">保单同步属性</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="orderSyncProperty" name="orderSyncProperty">
                                                <option value="0">上线前一次完成</option>
                                                <option value="R">实时</option>
                                                <option value="D">每日</option>
                                                <option value="W">每周</option>
                                                <option value="M">每月</option>
                                                <option value="A">指定时间</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">保单整点同步</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="orderSyncOnTime" name="orderSyncOnTime">
                                                <% for (int i = 1; i <= 24; i++) {
                                                        out.print("<option value=" + i + ">" + i + "</option>");
                                                    }%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-content ">
                                <div class="panel-heading">判赔同步属性</div>
                                <div class="panel-body">           
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">判赔同步方式</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="judgeSyncMethod" name="judgeSyncMethod">
                                                <option value="0">OFF LINE</option>
                                                <option value="1">API</option>
                                                <option value="2">FTP</option>
                                                <option value="3">SFTP</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">指定周几同步</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="judgeSyncWeek" name="judgeSyncWeek">
                                                <option value="0">周日</option>
                                                <option value="1">周一</option>
                                                <option value="2">周二</option>
                                                <option value="3">周三</option>
                                                <option value="4">周四</option>
                                                <option value="5">周五</option>
                                                <option value="6">周六</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">每日同步时间</label>
                                        <div class="col-sm-2">
                                            <input type="text" id="judgeSyncDayTime" name="judgeSyncDayTime" class="form-control" placeholder="HH:MM:SS" >
                                        </div>
                                    </div>
                                    <div class="form-group-">  
                                        <label class="col-sm-2 control-label">判赔同步属性</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="judgeSyncProperty" name="judgeSyncProperty">
                                                <option value="01">实时</option>
                                                <option value="02">每小时</option>
                                                <option value="03">每日(自然日)</option>
                                                <option value="04">每周(自然周)</option>
                                                <option value="05">每月(自然月)</option>
                                                <option value="06">节气</option>                                   
                                                <option value="99">指定时间</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">指定哪日同步</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="judgeSynDay" name="judgeSynDay">
                                                <% for (int i = 1; i <= 31; i++) {
                                                        out.print("<option value='" + i + "'>" + i + "</option>");
                                                    }
                                                    out.print("<option value='99'>每月最后一日</option>");
                                                %>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">指定同步时间</label>
                                        <div class="col-sm-2">
                                            <input type="text" id="judgeSyncTime" name="judgeSyncTime" class="form-control" placeholder="YYYY/MM/DD HH:MM:SS">
                                        </div>
                                    </div>
                                    <div class="form-group">  

                                        <label class="col-sm-2 control-label">指定整点同步</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="judgeSyncOnTime" name="judgeSyncOnTime">
                                                <% for (int i = 1; i <= 24; i++) {
                                                        out.print("<option value=" + i + ">" + i + "</option>");
                                                    }%>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">判赔同步内容</label>
                                        <div class="col-sm-2">
                                            <select class="form-control m-bot15" id="judgeSyncDetail" name="judgeSyncDetail">
                                                <option value="Q">仅满足阀值保单</option>
                                                <option value="A">判赔时间内所有保单</option>
                                            </select>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>

            </section>
            <!--main content end-->
        </section>
        <!-- container section start -->

    </body>
    <%@include file="../template/script.jsp" %>
    <script>


    </script>

</html>
