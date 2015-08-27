<%-- 
    Document   : input
    Created on : 2015/8/13, 下午 04:32:03
    Author     : Jean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    $(document).ready(function () {
        $("#save1").click(function () {
            alert("命名保存成功");
        });

    });
    
    function add(){
            $("#form_condition").append(" <div class=\"form-group\" id=\"div_condition\">");
            $("#form_condition").append($("#div_condition").html());
            $("#form_condition").append("</div>");
    }

</script>
<section class="wrapper">     
    <div class="panel panel-info">
        <div class="panel-heading">空间范围</div>
        <div class="panel-content ">
            <div class="panel-body">手动输入           
                <form class="form-horizontal " method="get">
                    <div class="form-group">
                        <div class="col-sm-1">
                            <div class="radio">
                                    <input type="radio" name="inputType" id="inputType" value="0" checked="checked">
                                    行政区域
                            </div>
                        </div>
                        <div class="col-sm-2">
                                <input type="text" class="form-control">
                        </div>
                        <label class="col-sm-1 control-label">观测站点关系</label>
                        <div class="col-sm-3">
                            <select class="form-control m-bot15">
                                <option value="1">单一站点</option>
                                <option value="2">多站点代表</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-1">
                            <div class="radio">
                                    <input type="radio" name="inputType" id="inputType" value="1" checked="checked">
                                    经纬海拔
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <input type="text" class="form-control">
                        </div>
                        <label class="col-sm-1 control-label">半径(km)</label>
                        <div class="col-sm-1">
                            <input type="text" class="form-control">
                        </div>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" placeholder="输入经纬度命名">
                        </div>
                        <div class="col-sm-3">
                            <a class="btn btn-default"  title="確定" id="save1">確定</a>
                        </div>
                    </div>
                </form>
            </div>

            <div class="panel-body">批量输入           
                <form class="form-horizontal " method="post" enctype="multipart/form-data" >
                    <div class="form-group">
                       <div class="col-sm-1">
                            <div class="radio">
                                   <label>调取已有活动</label>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <input type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">批量模板</label>
                        <div class="col-sm-3">
                            <a class="btn btn-default" href="" title="確定">下載</a>
                        </div>
                        <div class="col-sm-3">
                            <input type="file" class="form-control">
                        </div>
                        <div class="col-sm-3">
                            <a class="btn btn-default" title="站点确认">站点确认</a>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>          
    <div class="panel panel-success">
        <div class="panel-heading">时间范围</div>
        <div class="panel-content">
            <form class="form-horizontal " method="post" enctype="multipart/form-data" >
                <div class="form-group">
                    <label class="col-sm-1 control-label">评估时间</label>
                    <div class="col-sm-2">
                        <select class="form-control m-bot15">
                            <option value="2015">2015</option>
                            <option value="2016">2016</option>
                        </select>

                    </div>
                    <label class="col">年</label>
                    <div class="col-sm-1">
                        <select class="form-control m-bot15">
                            <% for (int i = 1; i <= 12; i++) {
                                    out.print("<option value=" + i + ">" + i + "</option>");
                                }%>
                        </select>
                    </div>
                    <label class="col">月</label>
                    <div class="col-sm-1">
                        <select class="form-control m-bot15">
                            <% for (int i = 1; i <= 31; i++) {
                                    out.print("<option value=" + i + ">" + i + "</option>");
                                }%>
                        </select>
                    </div>
                    <label class="col">日</label>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label">历史年数</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control">
                    </div>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label">事件时长</label>
                    <div class="col-sm-2">
                        <select class="form-control m-bot15">
                            <option value=">">></option>
                            <option value=">=">>=</option>
                            <option value="<"><</option>
                            <option value="<="><=</option>
                            <option value="=">=</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <input type="text" class="form-control"> 
                    </div>
                    天
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label">阈值统计方法</label>
                    <div class="col-sm-2">
                        <select class="form-control m-bot15">
                            <option value="1">连续</option>
                            <option value="2">独立</option>
                        </select>
                    </div>
                    <label class="col-sm-1">要素是否累加</label>
                    <div class="col-sm-2">
                        <select class="form-control">
                            <option value="0">不累加</option>
                            <option value="1">累加</option>
                        </select>
                    </div>
                </div>
            </form></div>
    </div>
    <div class="panel panel-warning">
        <div class="panel-heading">气象要素</div>
        <div class="panel-content">
            <div class="panel-body">
                <form class="form-horizontal " method="get" id="form_condition">
                    <div class="form-group" id="div_condition">
                                <label class="col-sm-1 control-label">
                                    <input type="radio" name="inputType"  value="0" checked="checked">
                                    数值
                                </label>
                        <div class="col-sm-1">
                            <select class="form-control m-bot15">
                                <option value="1">最高温度</option>
                                <option value="2">平均温度</option>
                                <option value="3">最低温度</option>
                                <option value="4">降水</option>
                            </select>
                        </div>
                        <div class="col-sm-1">
                            <select class="form-control m-bot15">
                                <option value=">">></option>
                                <option value=">=">>=</option>
                                <option value="<"><</option>
                                <option value="<="><=</option>
                                <option value="=">=</option>
                            </select>
                        </div>
                        <div class="col-sm-1">
                            <input type="text" class="form-control"> 
                        </div>
                        <div class="col-sm-1">
                            <select class="form-control m-bot15">
                                <option value=">">></option>
                                <option value=">=">>=</option>
                                <option value="<"><</option>
                                <option value="<="><=</option>
                                <option value="=">=</option>
                            </select>
                        </div>
                        <div class="col-sm-1">
                            <input type="text" class="form-control"> 
                        </div>
                        <div class="col-sm-1">
                                 <label class="col-sm-1 control-label">
                                    <input type="radio" name="inputType" value="1" >
                                    等级
                                </label>
                        </div>
                        <div class="col-sm-1">
                            <select class="form-control m-bot15">
                                <option value=">">></option>
                                <option value=">=">>=</option>
                                <option value="<"><</option>
                                <option value="<="><=</option>
                                <option value="=">=</option>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <select class="form-control m-bot15">
                                <option value="1">高温蓝色预警</option>
                                <option value="2">高温黄色预警</option>
                                <option value="3">高温橙色预警</option>
                                <option value="4">高温红色预警</option>
                            </select>
                        </div>
                        <div class="col-sm-1">
                            <a class="btn btn-default add"  title="添加阈值条件" onclick="add()">添加阈值条件</a>
                        </div>   
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>