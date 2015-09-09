<%-- 
    Document   : productNew
    Created on : 2015/8/31, 上午 11:31:15
    Author     : Jean
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="wrapper">

    <div class="panel panel-info">
       <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="index.jsp">Home</a></li>
              <li><i class="icon_documents_alt"></i><a href="index.jsp?path=order/productManager.jsp">产品管理</a></li>
                <li><i class="icon_documents_alt"></i>产品新建</li>
            </ol>
        </div>
    </div>
        <div class="panel-content ">
            <div class="panel-body">
                <form id="addForm" class="form-horizontal " method="post" >
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
                                <input id="saleValidFrom" name="validFrom" type="text" value="" size="16" class="form-control">
                            </div>
                            <label class="col">至</label>
                            <div class="col-sm-2">
                                <input id="saleValidEnd" name="validEnd" type="text" value="" size="16" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">产品日有效时间</label>
                            <div class="col-sm-2">
                                <input id="saleValidFrom" name="dtimeValidFrom" type="text" value="" size="16" class="form-control">
                            </div>
                            <label class="col">至</label>
                            <div class="col-sm-2">
                                <input id="saleValidEnd" name="dtimeValidEnd" type="text" value="" size="16" class="form-control">
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
                                <a href="#" id="set">设置阈值站点参数...</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
</section>
<script>
    $(document).ready(function () {
        $('#validFrom').datepicker({
            dateFormat: 'yy/mm/dd'
        });
        $('#validEnd').datepicker({
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
        
        $("#set").click(function () {
            $("#main-content").load("order/paramSiteSet.jsp");
        });

    });

</script>