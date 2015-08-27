<%-- 
    Document   : taskList
    Created on : 2015/8/17, 下午 04:28:40
    Author     : Jean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="wrapper">     
    <div class="panel panel-info">
        <div class="panel-heading">空间范围</div>
        <div class="panel-content ">
            <div class="panel-body">           
                <form class="form-horizontal " method="get">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">产品代码</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control">
                        </div>
                        <label class="col-sm-2 control-label">产品名称</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">活动代码</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control">
                        </div>
                        <label class="col-sm-2 control-label">活动名称</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">任务提交时间</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control"> 
                        </div> 
                           <label class="col-sm-1 control-label">至</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control"> 
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-sm-5 control-label"></label>
                        <a class="btn btn-default" href="" title="查询">查询</a>
                        <a class="btn btn-default" href="" title="重置">重置</a>
                    </div>
                </form>
            </div>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>产品代码</th>
                    <th>产品名称</th>
                    <th>活动代码</th>
                    <th>活动名称</th>
                    <th>任务编号</th>
                    <th>任务状态</th>
                    <th>任务提交时间</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>test_01</td>
                    <td>测试</td>
                    <td>2000255002</td>
                    <td>测试雨01</td>
                    <td>200025500201</td>
                    <td>成功</td>
                    <td>2015-07-09 22:00:00</td>
                    <td>
                        <div class="btn-group">
                            <a class="btn btn-primary" href="#"><i class="icon_book"></i></a>
                            <a class="btn btn-success" href="#"><i class="icon_pencil-edit"></i></a>
                        </div>
                    </td>
                </tr>

            </tbody>

        </table>
        <div>
            <ul class="pagination pagination">
                <li><a href="#">«</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">»</a></li>
            </ul>
        </div>
    </div>

</section>