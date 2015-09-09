<%-- 
    Document   : itemNew
    Created on : 2015/8/20, 下午 03:08:06
    Author     : Jeam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="wrapper">     
    <div class="panel panel-info">
        <div class="panel-heading"><span style="font-size:36px;">项目管理</span><span style="font-size:24px;">&nbsp; 项目新建</span></div>
        <div class="panel-content ">
            <div class="panel-body">           
                <form id="addForm" class="form-horizontal " method="post" >
                     <input type="hidden" class="form-control" id="postType" name="postType" value="add" >
                    <div class="form-group">
                        <label class="col-sm-1 control-label">项目编号</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="projectCode" name="projectCode">
                        </div>
                        <label class="col-sm-1 control-label">试算产品代码</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="cstEstProductId" name="cstEstProductId">
                        </div>
                        <label class="col-sm-1 control-label">客户编号</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="customerId" name="customerId">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">项目名称</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="projectName" name="projectName">
                        </div>
                        <label class="col-sm-1 control-label">试算活动代码</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="cstEventId" name="cstEventId">
                        </div>
                        <label class="col-sm-1 control-label">项目开始时间</label>
                        <div class="col-sm-2">
                            <input id="validFrom" name="validFrom" type="text" value="" size="16" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-1 control-label">项目状态</label>
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
                        <label class="col-sm-1 control-label">保险代码</label>
                        <div class="col-sm-2">
                            <input id="insuranceID" name="insuranceID" type="text"   class="form-control">
                        </div>
                        <label class="col-sm-1 control-label">项目结束时间</label>
                        <div class="col-sm-2">
                            <input id="validEnd" name="validEnd" type="text" value="" size="16" class="form-control">
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-sm-1 control-label">承保基础时间</label>
                        <div class="col-sm-2">
                            <select class="form-control m-bot15" id="insuranceBaseTime" name="insuranceBaseTime">
                                <option value="01">活动期间</option>
                                <option value="02">自然日</option>
                                <option value="03">自然周</option>
                                <option value="04">自然月</option>
                                <option value="05">节气</option>
                            </select>
                        </div>
                        <label class="col-sm-1 control-label">币别</label>
                        <div class="col-sm-2">
                            <select class="form-control m-bot15" id="currency" name="currency">
                                <option value="RMB">人民币:RMB</option>
                                <option value="HKD">港币:HKD</option>
                                <option value="TWD">新台币:TWD</option>
                                <option value="JPY">日元:JPY</option>
                                <option value="USD">美元:USD</option>
                            </select>
                        </div>
                        <label class="col-sm-1 control-label">客户联系人</label>
                        <div class="col-sm-2">
                            <input id="contactPerson" name="contactPerson" type="text" value="" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">  
                        <label class="col-sm-1 control-label">联系人邮箱</label>
                        <div class="col-sm-2">
                            <input id="invoiceAddress" name="invoiceAddress" type="text" value="" class="form-control">
                        </div>
                        <label class="col-sm-1 control-label">联系人电话</label>
                        <div class="col-sm-2">
                            <input id="contactNumber" name="contactNumber" type="text" value="" class="form-control">
                        </div>
                        <label class="col-sm-1 control-label">同步是否加密</label>
                        <div class="col-sm-2">
                            <select class="form-control m-bot15" id="security" name="security">
                                <option value="0">需要加密</option>
                                <option value="1">不需加密</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">  
                        <label class="col-sm-1 control-label">加密脚本</label>
                        <div class="col-sm-5">
                            <input id="encryption" name="encryption" type="text" value="" class="form-control">
                        </div>

                    </div>
                    <div class="form-group">  
                        <label class="col-sm-1 control-label">解密脚本</label>
                        <div class="col-sm-5">
                            <input id="decryption" name="decryption" type="text" value="" class="form-control">
                        </div>
                    </div>

                    <!---------------------产品-------------------------->
                    <div class="panel-heading">产品同步属性</div>
                    <div class="panel-content">
                        <div class="form-group">
                            <label class="col-sm-1 control-label">产品同步方式</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="prodSyncMethod" name="prodSyncMethod">
                                    <option value="0">OFF LINE</option>
                                    <option value="1">API</option>
                                    <option value="2">FTP</option>
                                    <option value="3">SFTP</option>
                                </select>
                            </div>
                            <label class="col-sm-1 control-label">产品同步属性</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="prodSyncProperty" name="prodSyncProperty">
                                    <option value="0">上线前一次完成</option>
                                    <option value="R">实时</option>
                                    <option value="D">每日</option>
                                    <option value="W">每周</option>
                                    <option value="M">每月</option>
                                    <option value="A">指定时间</option>
                                </select>
                            </div>
                            <label class="col-sm-1 control-label">指定整点同步</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="prodSyncOnTime" name="prodSyncOnTime">
                                    <% for (int i = 1; i <= 24; i++) {
                                            out.print("<option value=" + i + ">" + i + "</option>");
                                        }%>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">  
                            <label class="col-sm-1 control-label">同步FTP地址</label>
                            <div class="col-sm-2">
                                <input id="prodFtpAddress" name="prodFtpAddress" type="text" value="" class="form-control">
                            </div>
                            <label class="col-sm-1 control-label">FTP用户名</label>
                            <div class="col-sm-2">
                                <input id="prodFtpName" name="prodFtpName" type="text" value="" class="form-control">
                            </div>
                            <label class="col-sm-1 control-label">FTP密码</label>
                            <div class="col-sm-2">
                                <input id="prodFtpPassword" name="prodFtpPassword" type="text" value="" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">  
                            <label class="col-sm-1 control-label">FTP端口</label>
                            <div class="col-sm-2">
                                <input id="prodFtpPort" name="prodFtpPort" type="text" value="" class="form-control">
                            </div>
                            <label class="col-sm-1 control-label">产品同步路径</label>
                            <div class="col-sm-2">
                                <input id="prodSyncPath" name="prodSyncPath" type="text" value="" class="form-control">
                            </div>
                        </div>
                    </div>
                    <!---------------------保單-------------------------->
                    <div class="panel-heading">保单同步属性</div>
                    <div class="panel-content">
                        <div class="form-group">
                            <label class="col-sm-1 control-label">保单同步方式</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="soSyncMethod" name="soSyncMethod">
                                    <option value="0">OFF LINE</option>
                                    <option value="1">API</option>
                                    <option value="2">FTP</option>
                                    <option value="3">SFTP</option>
                                </select>
                            </div>
                            <label class="col-sm-1 control-label">保单同步属性</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="soSyncProperty" name="soSyncProperty">
                                    <option value="0">上线前一次完成</option>
                                    <option value="R">实时</option>
                                    <option value="D">每日</option>
                                    <option value="W">每周</option>
                                    <option value="M">每月</option>
                                    <option value="A">指定时间</option>
                                </select>
                            </div>
                            <label class="col-sm-1 control-label">保单整点同步</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="sodSyncOnTime" name="sodSyncOnTime">
                                    <% for (int i = 1; i <= 24; i++) {
                                            out.print("<option value=" + i + ">" + i + "</option>");
                                        }%>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">  
                            <label class="col-sm-1 control-label">同步FTP地址</label>
                            <div class="col-sm-2">
                                <input id="soFtpAddress" name="soFtpAddress" type="text" value="" class="form-control">
                            </div>
                            <label class="col-sm-1 control-label">FTP用户名</label>
                            <div class="col-sm-2">
                                <input id="soFtpName" name="soFtpName" type="text" value="" class="form-control">
                            </div>
                            <label class="col-sm-1 control-label">FTP密码</label>
                            <div class="col-sm-2">
                                <input id="soFtpPassword" name="soFtpPassword" type="text" value="" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">  
                            <label class="col-sm-1 control-label">FTP端口</label>
                            <div class="col-sm-2">
                                <input id="soFtpPort" name="soFtpPort" type="text" value="" class="form-control">
                            </div>
                            <label class="col-sm-1 control-label">产品同步路径</label>
                            <div class="col-sm-2">
                                <input id="soSyncPath" name="soSyncPath" type="text" value="" class="form-control">
                            </div>
                        </div>
                    </div>

                    <!---------------------判赔-------------------------->
                    <div class="panel-heading">判赔同步属性</div>
                    <div class="panel-content">
                        <div class="form-group">
                            <label class="col-sm-1 control-label">判赔同步方式</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="judgeSyncMethod" name="judgeSyncMethod">
                                    <option value="0">OFF LINE</option>
                                    <option value="1">API</option>
                                    <option value="2">FTP</option>
                                    <option value="3">SFTP</option>
                                </select>
                            </div>
                            <label class="col-sm-1 control-label">指定周几同步</label>
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
                            <label class="col-sm-1 control-label">每日同步时间</label>
                            <div class="col-sm-2">
                                <input type="text" id="judgeSyncDayTime" name="judgeSyncDayTime" class="form-control" placeholder="HH:MM:SS" >
                            </div>

                        </div>
                        <div class="form-group">  
                            <label class="col-sm-1 control-label">判赔同步属性</label>
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
                            <label class="col-sm-1 control-label">指定哪日同步</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="judgeSynDay" name="judgeSynDay">
                                    <% for (int i = 1; i <= 31; i++) {
                                            out.print("<option value='" + i + "'>" + i + "</option>");
                                        }
                                        out.print("<option value='99'>每月最后一日</option>");
                                    %>
                                </select>
                            </div>
                            <label class="col-sm-1 control-label">指定同步时间</label>
                            <div class="col-sm-2">
                                <input type="text" id="judgeSyncTime" name="judgeSyncTime" class="form-control" placeholder="YYYY/MM/DD HH:MM:SS">
                            </div>

                        </div>
                        <div class="form-group">  

                            <label class="col-sm-1 control-label">指定整点同步</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="judgeSyncOnTime" name="judgeSyncOnTime">
                                    <% for (int i = 1; i <= 24; i++) {
                                            out.print("<option value=" + i + ">" + i + "</option>");
                                        }%>
                                </select>
                            </div>
                            <label class="col-sm-1 control-label">判赔同步内容</label>
                            <div class="col-sm-2">
                                <select class="form-control m-bot15" id="judgeSyncDetail" name="judgeSyncDetail">
                                    <option value="Q">仅满足阀值保单</option>
                                    <option value="A">判赔时间内所有保单</option>
                                </select>
                            </div>
                            <label class="col-sm-1 control-label">同步FTP地址</label>
                            <div class="col-sm-2">
                                <input id="judgeFtpAddress" name="judgeFtpAddress" type="text" value="" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">  
                            <label class="col-sm-1 control-label">产品同步路径</label>
                            <div class="col-sm-2">
                                <input id="judgeSyncPath" name="judgeSyncPath" type="text" value="" class="form-control">
                            </div>

                            <label class="col-sm-1 control-label">FTP用户名</label>
                            <div class="col-sm-2">
                                <input id="judgeFtpName" name="judgeFtpName" type="text" value="" class="form-control">
                            </div>
                            <label class="col-sm-1 control-label">FTP密码</label>
                            <div class="col-sm-2">
                                <input id="judgeFtpPassword" name="judgeFtpPassword" type="text" value="" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">               
                            <label class="col-sm-1 control-label">FTP端口</label>
                            <div class="col-sm-2">
                                <input id="judgeFtpPort" name="judgeFtpPort" type="text" value="" class="form-control">
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <div class="form-group">
                <label class="col-sm-5 control-label"></label>
                <a class="btn btn-default" href="#" title="保存" id="add">保存</a>
                <a class="btn btn-default" title="重置" id="reset">重置</a>
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
        
        $("#add").click(function () {
            $.ajax({
                url: "itemSave",
                data: $('#addForm').serialize(),
                type: "POST",
                success: function (msg) {
                    alert(msg);
                      $("#main-content").load("order/itemManager.jsp");
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            });
        });

    });

</script>