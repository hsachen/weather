<%-- 
    Document   : itemManager
    Created on : 2015/8/20, 上午 10:39:10
    Author     : Jean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="wrapper">     
    <div class="panel panel-info">
        <div class="panel-heading"><span style="font-size:36px;">项目管理</span><span style="font-size:24px;">&nbsp; 项目报表</span></div>
        <div class="panel-content ">
            <div class="panel-body">           
                <form id="queryForm" class="form-horizontal " method="get">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">项目编号</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="projectCode" name="projectCode">
                        </div>
                        <label class="col-sm-2 control-label">项目开始时间</label>
                        <div class="col-sm-2">
                            <input id="validFrom" name="validFrom" type="text" value="" size="16" class="form-control">
                        </div>
                        <label class="col">至</label>
                        <div class="col-sm-2">
                            <input id="validFrom1" name="validFrom1" type="text" value="" size="16" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户编号</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="customerId" name="customerId">
                        </div>
                        <label class="col-sm-2 control-label">项目结束时间</label>
                        <div class="col-sm-2">
                            <input id="validEnd" name="validEnd" type="text" value="" size="16" class="form-control">
                        </div>
                        <label class="col">至</label>
                        <div class="col-sm-2">
                            <input id="validEnd1" name="validEnd1" type="text" value="" size="16" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">项目状态</label>
                        <div class="col-sm-2">
                            <select class="form-control m-bot15" id="projectStatus" name="projectStatus">
                                <option value="0">结项</option>
                                <option value="I">IT项目对接确认</option>
                                <option value="P">保险项目经理确认</option>
                                <option value="D">保险项目总监确认</option>
                                <option value="V">保险项目副总确认</option>
                                <option value="1">启用</option>
                                <option value="2">暂停</option>
                                <option value="3">结算</option>
                            </select>
                        </div>
                        <label class="col-sm-2 control-label">项目名称关键字</label>
                        <div class="col-sm-2">
                            <input id="projectName" name="projectName" type="text"   class="form-control">
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label"></label>
                        <a class="btn btn-default"  title="查询" id="query">查询</a>
                        <input type="reset" class="btn btn-default" value="重置">
                    </div>
                </form>
                <div class="form-group">
                    <button class="btn btn-default clink" href="#" id="new" folder="order/itemNew.jsp">新建</button>
                    <button class="btn btn-default"  id="del">刪除</button>
                    <button class="btn btn-default" id="download">下载csv文件</button>
                </div>
                <div>
                    <table id="example" class="display" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="checkboxall" name="checkboxall" ></th>
                                <th>项目编号</th>
                                <th>客户编号</th>
                                <th>项目有效日（起）</th>
                                <th>项目有效日（讫）</th>
                                <th>项目状态</th>
                                <th>修改时间</th>
                                <th>修改人</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tfoot>
                        </tfoot>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" name="checkbox" ></td>
                                <td>Tiger Nixon</td>
                                <td>System Architect</td>
                                <td>Edinburgh</td>
                                <td>61</td>
                                <td>2011/04/25</td>
                                <td>$320,800</td>
                                <td>$320,800</td>
                                <td><select class="form-control m-bot15" id="operation" name="operation">
                                        <option value="">--</option>
                                        <option value="E">編輯</option>
                                        <option value="V">查看</option>
                                        <option value="C">審核</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $(document).ready(function () {
        $('#validFrom').datepicker({
            dateFormat: 'yy/mm/dd'
        });
        $('#validFrom1').datepicker({
            dateFormat: 'yy/mm/dd'
        });

        $('#validEnd').datepicker({
            dateFormat: 'yy/mm/dd'
        });
        $('#validEnd1').datepicker({
            dateFormat: 'yy/mm/dd'
        });
        $('#example').DataTable({
            columnDefs: [
                {orderable: false, targets: 0}
            ]
        });
        $(".clink").click(function () {
            $("#main-content").load($(this).attr("folder"));
        });

        $("#query").click(function () {
            $.ajax({
                url: "itemQuery",
                data: $('#queryForm').serialize(),
                type: "POST",
                dataType: "json",
                success: function (msg) {
                    alert(msg);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            });
        });

        $("#operation").change(function () {
            if ($(this).val() === "E") {
                $("#main-content").load("order/itemEdit.jsp");
            } else if ($(this).val() === "C") {
                $("#main-content").load("order/itemCheck.jsp");
            } else if ($(this).val() === "V") {
                $("#main-content").load("order/itemView.jsp");
            }
        });

    });




</script>