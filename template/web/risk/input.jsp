<%-- 
    Document   : input
    Created on : 2015/8/13, 下午 04:32:03
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
                                <li><i class="fa fa-home"></i><a href="index.jsp">Home</a></li>
                                <li><i class="icon_documents_alt"></i>条件配置</li>
                            </ol>
                        </div>
                        <div class="panel-content ">
                            <div class="panel-heading">空间范围</div>
                            <form class="form-horizontal" method="post" id="areaForm">
                                <div class="panel-body">手动输入  

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
                                        <div class="col-sm-2">
                                            <a class="btn btn-default" href="inputMap.jsp"  id="mapsel" target="_blank">地圖選取</a>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1">
                                            <div class="radio">
                                                <input type="radio" name="inputType" id="inputType1" value="1"   >
                                                经纬海拔
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" id="longLaAl" name="longLaAl" readonly placeholder="104.11,23.56,300">
                                        </div>
                                        <label class="col-sm-1 control-label">半径(km)</label>
                                        <div class="col-sm-1">
                                            <input type="text" class="form-control"  id="siteRadiusTmp" name="siteRadiusTmp" readonly>
                                        </div>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control" placeholder="输入经纬度命名" id="surveyNameTmp" name="surveyNameTmp" readonly>
                                        </div>
                                        <div class="col-sm-3">
                                            <a class="btn btn-default"  title="確定" id="saveName" disable>確定</a>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <table class="table" id ="table1">
                                                <tr><td>经纬度名称</td><td>经度</td><td>纬度</td><td>海拔</td><td>半径(km)</td><td>操作</td><td></td></tr>
                                            </table>
                                        </div>

                                    </div>

                                </div>

                                <div class="panel-body">批量输入           
                                    <input type="hidden" name="inputForm" value="B" >
                                    <div class="form-group">
                                        <div class="col-sm-1">
                                            <div class="radio">
                                                <input type="radio" name="inputType" id="inputType" value="0" >
                                                调取站点组
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <input type="text" class="form-control"  placeholder="输入站点组名称" id="eventInput" name="eventInput" value="">  
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="siteSetManagement.jsp" target="_blank">查看列表...</a>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-1">
                                            <div class="radio">
                                                <input type="radio" name="inputType" id="inputType" value="0" >
                                                批量模板
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <a class="btn btn-default" href="download.xls" title="確定" target="_blank">下載</a>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="file" class="form-control" name="file">
                                        </div>
                                        <div class="col-sm-3">
                                            <button type="button" class="btn btn-default" id="upload" >上傳</button>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label"></label>
                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#siteModal" >站点确认</button>
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
                                                        <!--                                                        <button type="button" class="btn btn-primary" id="modelSubmit">确定</button>-->
                                                    </div>
                                                    <input type="hidden" name="inputForm" value="B" >
                                                    <div id="treeCheckbox2">
                                                    </div>
                                                    <div>
                                                        <input type="text" placeholder="输入站点组名称" id="siteName2" name="siteName2">
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal" id="modelSave2">保存</button>
                                                        <!--                                                        <button type="button" class="btn btn-primary" id="modelSubmit2">确定</button>-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                            </form>


                            <form class="form-horizontal " method="post" id="submitForm" >
                                <input type="hidden" name="inputForm" value="C" >
                                <div class="panel panel-info">
                                    <div class="panel-heading">时间范围</div>
                                    <div class="panel-content">
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">评估时间</label>
                                            <div class="col-sm-1">
                                                <select class="form-control m-bot15" id="validFromYear" name="validFromYear">
                                                </select>
                                            </div>
                                            <label class="col">年</label>
                                            <div class="col-sm-1">
                                                <select class="form-control m-bot15" id="validFromMonth" name="validFromMonth">
                                                    <% for (int i = 1; i <= 12; i++) {
                                                            out.print("<option value=" + i + ">" + i + "</option>");
                                                        }%>
                                                </select>
                                            </div>
                                            <label class="col">月</label>
                                            <div class="col-sm-1">
                                                <select class="form-control m-bot15" id="validFromDay" name="validFromDay">
                                                    <% for (int i = 1; i <= 31; i++) {
                                                            out.print("<option value=" + i + ">" + i + "</option>");
                                                        }%>
                                                </select>
                                            </div>
                                            <label class="col">日</label>
                                            <label class="col">~</label>
                                            <div class="col-sm-1">
                                                <select class="form-control m-bot15" id="validEndYear" name="validEndYear">
                                                </select>
                                            </div>
                                            <label class="col">年</label>
                                            <div class="col-sm-1">
                                                <select class="form-control m-bot15" id="validEndMonth" name="validEndMonth">
                                                    <% for (int i = 1; i <= 12; i++) {
                                                            out.print("<option value=" + i + ">" + i + "</option>");
                                                        }%>
                                                </select>
                                            </div>
                                            <label class="col">月</label>
                                            <div class="col-sm-1">
                                                <select class="form-control m-bot15" id="validEndDay" name="validEndDay">
                                                    <% for (int i = 1; i <= 31; i++) {
                                                            out.print("<option value=" + i + ">" + i + "</option>");
                                                        }%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">历史年数</label>
                                            <div class="col-sm-1">
                                                <input type="text" class="form-control" id="historyYear" name="historyYear"> 
                                            </div>
                                            <label class="col">年</label>
                                            <div class="col-sm-1">
                                                <input type="text" class="form-control" disabled="disabled"> 
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">事件时长</label>
                                            <div class="col-sm-2">
                                                <select class="form-control m-bot15" id="operationRunningDay" name="operationRunningDay">
                                                    <option value=">">></option>
                                                    <option value=">=">>=</option>
                                                    <option value="<"><</option>
                                                    <option value="<="><=</option>
                                                    <option value="=">=</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="runningDay" name="runningDay"> 
                                            </div>
                                            天
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label">阈值统计方法</label>
                                            <div class="col-sm-2">
                                                <select class="form-control m-bot15" id="statisticMethod" name="statisticMethod">
                                                    <option value="1">连续</option>
                                                    <option value="2">独立</option>
                                                </select>
                                            </div>
                                            <label class="col-sm-1">要素是否累加</label>
                                            <div class="col-sm-2">
                                                <select class="form-control" id="elementMethod" name="elementMethod">
                                                    <option value="0">不累加</option>
                                                    <option value="1">累加</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-info">
                                    <div class="panel-heading">气象要素</div>
                                    <div class="panel-content">
                                        <div class="panel-body">
                                            <div id="form_condition"></div>
                                        </div>
                                        <div class="panel-body">
                                            <textarea id="conditionArea" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label"></label>
                                    <a class="btn btn-default"  title="确定并返回" id="submitBtn">确定并返回</a>
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

    </body>
    <%@include file="../template/script.jsp" %>

    <script>
        var d = new Date();
        var count = 1;
        var conditionString = "";

        var nowYear = d.getFullYear();


        function htmlg(count) {
            var html = "<div>阈值" + count + "</div><input name=\"countNo\" type=\"hidden\" value=\"" + count + "\"><div class=\"form-group\" id=\"div_condition\"><label class=\"col-sm-1 control-label\"><input type=\"radio\" name=\"elementType" + count + "\"  value=\"0\" checked=\"checked\">数值 </label>";
            html += "  <div class=\"col-sm-1\"><select class=\"form-control m-bot15\" name=\"meteroElement" + count + "\"> </select></div>";
            html += "<div class=\"col-sm-1\"><select class=\"form-control m-bot15\" name=\"operationLB" + count + "\"><option value=\">\">></option><option value=\">=\">>=</option><option value=\"<\"><</option> <option value=\"<=\"><=</option><option value=\"=\">=</option></select> </div>";
            html += " <div class=\"col-sm-1\"><input type=\"text\" class=\"form-control\" name=\"triggerPointLB" + count + "\"></div><div class=\"col-sm-1\"> <select class=\"form-control m-bot15\"  name=\"operationUB" + count + "\"> <option value=\">\">></option><option value=\">=\">>=</option><option value=\"<\"><</option> <option value=\"<=\"><=</option> <option value=\"=\">=</option></select></div>";
            html += " <div class=\"col-sm-1\">  <input type=\"text\" class=\"form-control\"  name=\"operationUB" + count + "\"></div> <label class=\"col-sm-1 control-label\">";
            html += "<input type=\"radio\" name=\"elementType" + count + "\" value=\"1\" > 等级 </label> <div class=\"col-sm-1\"> <select class=\"form-control m-bot15\"  name=\"operationGrade" + count + "\" > <option value=\">\">></option><option value=\">=\">>=</option><option value=\"<\"><</option><option value=\"<=\"><=</option><option value=\"=\">=</option></select></div>";
            html += "<div class=\"col-sm-2\"> <select class=\"form-control m-bot15\" name=\"meteroElementGrade" + count + "\"> </select></div>";
            html += " <div class=\"col-sm-1\"> <a class=\"btn btn-default add\"  title=\"添加阈值条件\" onclick=\"add(" + count + ")\">添加阈值条件</a> </div>  </div>"
            return html;
        }

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
                $("select[name='meteroElement1']").append(meteroE);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(thrownError);
            }
        });


        /*
         * 
         * 等级
         */
        var meteroG = "";
        $.ajax({
            url: "../meteroGradeQuery",
            //   data: $('#areaForm').serialize(),
            type: "GET",
            success: function (JData) {
                $.each(JData, function (index, element) {
                    meteroG += "<option value=\"" + element.id + "\">" + element.name + "</option>";
                });
                $("select[name='meteroElementGrade1']").append(meteroG);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(xhr.status);
                alert(thrownError);
            }
        });


        $(document).ready(function () {
            $("#validFromYear").append("<option value='" + nowYear + "'>" + nowYear + "</option>")
            $("#form_condition").append(htmlg(count));
            conditionString = "阈值1"
            $("#conditionArea").val(conditionString);

            $("#inputType").click(function () {
                $("#longLaAl").prop("readonly", true);
                $("#siteRadiusTmp").prop("readonly", true);
                $("#surveyNameTmp").prop("readonly", true);
                $("#areaName").prop("readonly", false);
                $("#observeSite").attr("disabled", false);
                $("#saveName").attr("disabled", true);
                $("#mapsel").attr("disabled", false);

            });

            $("#inputType1").click(function () {
                $("#longLaAl").prop("readonly", false);
                $("#siteRadiusTmp").prop("readonly", false);
                $("#surveyNameTmp").prop("readonly", false);
                $("#areaName").prop("readonly", true);
                $("#observeSite").attr("disabled", true);
                $("#saveName").attr("disabled", false);
                $("#mapsel").attr("disabled", true);
            });

            //手动输入
            $("#saveName").click(function () {
                $.ajax({
                    url: "../riskInputSave",
                    data: $('#areaForm').serialize(),
                    type: "POST",
                    success: function (msg) {
                        var arr = $("#longLaAl").val().split(",");
                        var long = arr[0];
                        var la = arr[1];
                        var al = arr[2];
                        for (var i in arr) {
                            lng = arr[i]
                        }
                        debugger;
                        $("#table1").append("<tr><td><input size='1' class='form-control' name='surveyName' value='" +  $("#surveyNameTmp").val()  + "'></td><td><input size='1' class='form-control' name='long' value='" + long + "'></td><td><input size='1' class='form-control' name='la' value='" + la + "'></td><td><input size='1' class='form-control' name='al' value='" + al + "'></td><td><input size='1' class='form-control' name='surveyName' value='" +  $("#surveyNameTmp").val()  + "'> " + $("#siteRadiusTmp").val() + "</td><td><a href='#' onClick='deleteRow(this,1);' >刪除</a></td><td></td></tr>");
                        alert(msg);
                        //       $("#main-content").load("order/itemManager.jsp");
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });
            });

            //站點保存
            $("#modelSave").click(function () {
                $.ajax({
                    url: "../riskInputSave",
                    data: $('#batchForm').serialize(),
                    type: "POST",
                    success: function (msg) {
                        //    alert(msg);
                        $('#saveModalContent').empty();
                        $('#saveModalContent').append(msg);
                        $('#saveModal').modal('show');
                        //       $("#main-content").load("order/itemManager.jsp");
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });
            });
            $("#modelSave2").click(function () {
                $.ajax({
                    url: "../riskInputSave",
                    data: $('#batchForm').serialize(),
                    type: "POST",
                    success: function (msg) {
                        //     alert(msg);
                        $('#saveModalContent').empty();
                        $('#saveModalContent').append(msg);
                        $('#saveModal').modal('show');
                        //       $("#main-content").load("order/itemManager.jsp");
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });
            });

            $("#submitBtn").click(function () {
                $.ajax({
                    url: "../riskInputSave",
                    data: $('#submitForm').serialize(),
                    type: "POST",
                    success: function (msg) {
                        alert(msg);
                        //    $('#saveModalContent').empty();
                        //     $('#saveModalContent').append(msg);
                        //    $('#saveModal').modal('show');
                        //       $("#main-content").load("order/itemManager.jsp");
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });
            });


            //返回
            $("#siteReturn").click(function () {
                $('#saveModal').modal('hide');
                $('#siteModal').modal('show');
            });

        });

        $('#treeCheckbox').tree({
            lazyLoading: true,
            nodesLazyUrl: '../siteQuery',
            nodesInitUrl: '../siteQuery',
            collapseUiIcon: 'ui-icon-plus',
            expandUiIcon: 'ui-icon-minus',
        });

        $('#treeCheckbox2').tree({
            lazyLoading: true,
            nodesLazyUrl: '../siteAttrQuery',
            nodesInitUrl: '../siteAttrQuery',
            collapseUiIcon: 'ui-icon-plus',
            expandUiIcon: 'ui-icon-minus',
        });


        function replacePos(strObj, pos, replacetext)
        {
            var str = strObj.substr(0, pos - 1) + replacetext + strObj.substring(pos, strObj.length);
            return str;
        }

        function deleteRow(obj, index) {

            $.ajax({
                url: "../riskInputSave",
                data: {posttype: 'del', id: index, inputForm: "S"},
                type: "POST",
                success: function (msg) {
                    alert(msg);
                    //       $("#main-content").load("order/itemManager.jsp");
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            });

            $(obj).closest('tr').remove();


        }

        function add() {
            count = count + 1;
            $("#form_condition").append("<div class=\"form-group\"> <label class=\"col-sm-5 control-label\"></label><div class=\"col-sm-2\"><select  cnt=\"" + count + "\" class=\"form-control m-bot15\" name =\"condition" + count + "\"><option value=\"&\">AND</option><option value=\"|\">OR</option><</select></div></div>" + htmlg(count));
            conditionString = conditionString + "&阈值" + count;
            $("#conditionArea").val(conditionString);
            $("select[name='meteroElement" + count + "']").append(meteroE);
            $("select[name='meteroElementGrade" + count + "']").append(meteroG);
            //條件
            $("select[name^='condition" + count + "']").change(function () {
                alert($(this).attr("cnt"))
                var count1 = -1;
                var count2 = -1;
                for (i = 1; i < $(this).attr("cnt"); i = i + 1) {
                    count1 = conditionString.indexOf("&", count1 + 1);
                    count2 = conditionString.indexOf("|", count2 + 1);
                }
                if (count1 != -1) {
                    countindex = count1
                } else if (count2 != -1) {
                    countindex = count2
                }

                conditionString = replacePos(conditionString, countindex + 1, $(this).val());
                $("#conditionArea").val(conditionString);
                // alert($(this).attr("cnt"));
            });
        }


    </script>

</html>
