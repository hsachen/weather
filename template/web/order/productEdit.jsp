<%-- 
    Document   : productEdit
    Created on : 2015/8/31, 上午 11:31:15
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
                <li><i class="fa fa-home"></i><a href="index.jsp">Home</a></li>
              <li><i class="icon_documents_alt"></i><a href="productManager.jsp">产品管理</a></li>
                <li><i class="icon_documents_alt"></i>产品新建</li>
            </ol>
        </div>
    </div>
        <div class="panel-content ">
            <div class="panel-body">
                <form id="addForm" class="form-horizontal " method="post" enctype="multipart/form-data" >
                    <input type="hidden" class="form-control" id="postType" name="postType" value="add" >
                    <!-------------------产品属性 --------------------->
                    <div class="panel-heading">产品属性</div>
                    <div class="panel-content">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">项目编号</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="projectCode" name="projectCode">
                            </div>
                            <label class="col-sm-2 control-label">客户编号</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="customerId" name="customerId">
                            </div>
                            <label class="col-sm-2 control-label">产品状态</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="productStatus" name="productStatus">
                                    <option value="0">关闭</option>
                                    <option value="1">可用</option>
                                    <option value="2">待系统建议观测站</option>
                                    <option value="3">系统建议观测站(错误)</option>
                                    <option value="4">待专员确认气象阀值站</option>
                                    <option value="5">待计算概率</option>
                                    <option value="6">待客户接收确认</option>
                                    <option value="7">暂时关闭</option>
                                    <option value="9">结帐中  </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">产品名称关键字</label>
                            <div class="col-sm-2">
                                <input id="CstpoductDec" name="CstpoductDec" type="text"   class="form-control">
                            </div> 
                            <label class="col-sm-2 control-label">承保基础时间</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="productStatus" name="productStatus">
                                    <option value="01">活动期间</option>
                                    <option value="02">自然日</option>
                                    <option value="03">自然周</option>
                                    <option value="04">自然月</option>
                                    <option value="05">节气</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">产品可销售期</label>
                            <div class="col-sm-2">
                                <input id="saleValidFrom" name="saleValidFrom" type="text" value="" size="16" class="form-control">
                            </div>
                            <label class="col">至</label>
                            <div class="col-sm-2">
                                <input id="saleValidEnd" name="saleValidEnd" type="text" value="" size="16" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">产品有效时间</label>
                            <div class="col-sm-2">
                                <input id="validFrom" name="validFrom" type="text" value="" size="16" class="form-control">
                            </div>
                            <label class="col">至</label>
                            <div class="col-sm-2">
                                <input id="validEnd" name="validEnd" type="text" value="" size="16" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">产品日有效时间</label>
                            <div class="col-sm-2">
                                <input id="dtimeValidFrom" name="dtimeValidFrom" type="text" value="" size="16" class="form-control">
                            </div>
                            <label class="col">至</label>
                            <div class="col-sm-2">
                                <input id="dtimeValidEnd" name="dtimeValidEnd" type="text" value="" size="16" class="form-control">
                            </div>
                        </div>
                    </div>

                    <!-------------------阈值站点设置 --------------------->
                    <div class="panel-heading">阈值站点设置</div>
                    <div class="panel-content">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">活动代码</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="eventId" name="eventId"  placeholder="输入指数评估时的活动代码">
                            </div>
                            <div class="col-sm-2">
                                <a href="paramSiteSet.jsp" id="set">设置阈值站点参数...</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-heading">产品批量新增</div>
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
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#siteModal" >上传</button>
                        </div>
                    </div>
                    </div>
                    <div class="form-group">
                    <label class="col-sm-5 control-label"></label>
                    <a class="btn btn-default"  title="保存" id="submitBtn">保存</a>
                    <input type="reset" class="btn btn-default" value="重置">
                </div>
                </form>
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
         $('#saleValidFrom').datepicker({
            dateFormat: 'yy/mm/dd'
        });
        $('#saleValidEnd').datepicker({
            dateFormat: 'yy/mm/dd'
        }); 
        $('#dtimeValidFrom').datepicker({
            dateFormat: 'yy/mm/dd'
        });
        $('#dtimeValidEnd').datepicker({
            dateFormat: 'yy/mm/dd'
        });
        $(".clink").click(function () {
            $("#main-content").load($(this).attr("folder"));
        });
        $("#judgeSyncTime").datetimepicker({
            dateFormat: 'yy/mm/dd',
            showSecond: true,
            timeFormat: 'HH:mm:ss'
        });

        $("#judgeSyncDayTime").timepicker({
            showSecond: true,
            timeFormat: 'HH:mm:ss'
        });


        $("#reset").click(function () {
            $('#addForm')[0].reset();

        });
        
    });

</script>
    </body>
  
</html>

