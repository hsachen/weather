
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <link href="${pageContext.request.contextPath}/css/multi-select.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/zTreeStyle.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <!-- bootstrap theme -->                   
        <link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/lib/DataTables1.10.8/media/css/jquery.dataTables.min.css" rel="stylesheet">


        <style type="text/css">
            body, html{width: 100%;height: 100%;overflow: hidden;margin:0;}
            #allmap {height: 60%;overflow: hidden;}
            #result {height:40%;width:60%;top:0px;right:0px;font-size:12px;}
            dl,dt,dd,ul,li{
                margin:0;
                padding:0;
                list-style:none;
            }
            p{font-size:12px;}
            dt{
                font-size:14px;
                font-family:"微软雅黑";
                font-weight:bold;
                border-bottom:1px dotted #000;
                padding:5px 0 5px 5px;
                margin:5px 0;
            }
            dd{
                padding:5px 0 0 5px;
            }
            li{
                line-height:28px;
            }
            .red{color: red;}
        </style>
        <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/ui-lightness/jquery-ui.min.css" type="text/css" />
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=5E5EE28a7615536d1ffe2ce2a3667859"></script>

        <title>百度地图绘制多边型带编辑功能</title>
    </head>
    <body>
        <div id="allmap" style="height: 70%;width: 70%;overflow:hidden;zoom:1;position:relative;float:left"> 
            <div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>

            <div id="panelWrap" style="width:0px;position:absolute;top:0px;right:0px;height:100%;overflow:auto;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;">
                <div style="width:20px;height:200px;margin:-100px 0 0 -10px;color:#999;position:absolute;opacity:0.5;top:50%;left:50%;" id="showOverlayInfo"></div>
                <div id="panel" style="position:absolute;"></div>
            </div>

        </div>

        <div id="result"  style="width: 30%;float:right">
            <div style="left: 1px">
                <a class="btn btn-success"  title="基礎圖層" id="query" style="margin-left:20px">基礎圖層</a>
                <a class="btn btn-success"  title="評估展示" id="query1" style="margin-left:20px">評估展示</a>
                <a class="btn btn-success"  title="預測判賠" id="query2" style="margin-left:20px">預測判賠</a>
            </div>
            <form>
                <div class="zTreeDemoBackground left" width="30%" >
                    <ul id="treeDemo" class="ztree"></ul>
                </div>
            </form>
        </div>
        <div style="height: 30%;width: 70%;"> 
            <table id="table_div" class="display" cellspacing="0" width="100%">
            </table>
        </div>

        <script type="text/javascript">
            /**
             * Author: mobai
             * http://mobai.blog.51cto.com/
             * 转载请注明出处
             */
            function $(id) {
                return document.getElementById(id);
            }
            var bmap = {
                status: false,
                map: '',
                point: '',
                overlays: [],
                overlaysCache: [],
                myPolygon: '',
                myOverlay: [],
                drawingManager: '',
                styleOptions: {
                    strokeColor: "red", //边线颜色。
                    fillColor: "red", //填充颜色。当参数为空时，圆形将没有填充效果。
                    strokeWeight: 3, //边线的宽度，以像素为单位。
                    strokeOpacity: 0.8, //边线透明度，取值范围0 - 1。
                    fillOpacity: 0.3, //填充的透明度，取值范围0 - 1。
                    strokeStyle: 'solid'    //边线的样式，solid或dashed。
                },
                /**
                 * 实例化
                 */
                init: function () {
                    if (this.status) {
                        return;
                    }
                    this.status = true;
                    this.map = new BMap.Map('map');
                    this.point = new BMap.Point(116.307852, 40.057031);
                    var map = this.map;
                    var styleOptions = this.styleOptions;
                    map.centerAndZoom(this.point, 16);
                    map.enableScrollWheelZoom();

                }
            };


        </script>
        <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.multi-select.js"></script>
        <script src="${pageContext.request.contextPath}/js/ztree/jquery.ztree.core-3.5.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/ztree/jquery.ztree.excheck-3.5.js"></script>
        <script src="${pageContext.request.contextPath}/lib/DataTables1.10.8/media/js/jquery.dataTables.min.js"></script>
        <script>

            var map = new BMap.Map("allmap");
            var point = new BMap.Point(116.404, 39.915);
            var ln;

            map.centerAndZoom(point, 15);


            function myOnCheck(event, treeId, treeNode) {
                //alert(treeNode.id + ", " + treeNode.name + "," + treeNode.checked);
                if (treeNode.checked) {
                    $.ajax({
                        url: "../getMapSite?id=" + treeNode.id,
                        type: "POST",
                        dataType: "json",
                        success: function (JData) {
                            //$("#table_div").empty();
if ($("#detailTable").length < 0) {

}
                            $.each(JData, function (index, element) {
                                $("#detailTable > tbody ").append("<tr role=\"row\" ><td><input type=\"checkbox\" name=\"checkbox\" value=" + index + " ></td><td>" + element.areaCode + "</td><td>" + element.cityCN + "</td><td>" + element.siteCode + "</td><td>" + element.activityCode + "</td><td>" + element.date + "</td><td>" + element.probability + "</td><td>" + element.logUser + "</td></tr>");
                            });

                            $('input[name=checkbox]').click(function () {
                                var a = $(this).attr('checked');
                                $.ajax({
                                    url: "../getCoordinate?id=" + $(this).val(),
                                    type: "POST",
                                    dataType: "json",
                                    success: function (msg) {
                                        for (var i = 0; i < msg.length; i++) {
                                            var point = new BMap.Point(msg[i].x, msg[i].y);
                                            debugger;
                                            if (a == "checked") {
                                                var marker = new BMap.Marker(point);
                                                map.addOverlay(marker);
                                            } else {
                                                var allOverlay = map.getOverlays();
                                                for (var j = 0; j < allOverlay.length; j++) {
                                                    debugger;
                                                    if (allOverlay[j].point != null) {
                                                        if (allOverlay[j].point.lat == msg[i].y && allOverlay[j].point.lng == msg[i].x) {
                                                            map.removeOverlay(allOverlay[j]);
                                                        }
                                                    }
                                                }
                                                //   map.clearOverlays();       
                                                //    removeMarker(point)
                                            }

                                        }
                                    },
                                    error: function (xhr, ajaxOptions, thrownError) {
                                        alert(xhr.status);
                                        alert(thrownError);
                                    }
                                });
                            });
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(xhr.status);
                            alert(thrownError);
                        }
                    });
                }
            }



            function myOnClick1(event, treeId, treeNode) {

                $.ajax({
                    url: "../getMapSite?id=" + treeNode.id,
                    type: "POST",
                    dataType: "json",
                    success: function (JData) {
                        $("#table_div").empty();
                        $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th></th><th>区域编码</th><th>城市名称</th><th>所属站点组</th><th>活动代码</th><th>日期</th><th>概率</th><th>详情</th></tr></thead><tfoot></tfoot><tbody></tbody></table>");
                        $.each(JData, function (index, element) {
                            $("#detailTable > tbody ").append("<tr role=\"row\" ><td><input type=\"checkbox\" name=\"checkbox\" value=" + index + " ></td><td>" + element.areaCode + "</td><td>" + element.cityCN + "</td><td>" + element.siteCode + "</td><td>" + element.activityCode + "</td><td>" + element.date + "</td><td>" + element.probability + "</td><td>" + element.logUser + "</td></tr>");
                        });
                        $('#detailTable').DataTable({
                            columnDefs: [
                                {orderable: false, targets: 0}
                            ],
                            //     bFilter: false
                        });

                        $('input[name=checkbox]').click(function () {
                            var a = $(this).attr('checked');
                            $.ajax({
                                url: "../getCoordinate?id=" + $(this).val(),
                                type: "POST",
                                dataType: "json",
                                success: function (msg) {
                                    for (var i = 0; i < msg.length; i++) {
                                        var point = new BMap.Point(msg[i].x, msg[i].y);
                                        debugger;
                                        if (a == "checked") {
                                            var marker = new BMap.Marker(point);
                                            map.addOverlay(marker);
                                        } else {
                                            var allOverlay = map.getOverlays();
                                            for (var j = 0; j < allOverlay.length; j++) {
                                                debugger;
                                                if (allOverlay[j].point != null) {
                                                    if (allOverlay[j].point.lat == msg[i].y && allOverlay[j].point.lng == msg[i].x) {
                                                        map.removeOverlay(allOverlay[j]);
                                                    }
                                                }
                                            }
                                            //   map.clearOverlays();       
                                            //    removeMarker(point)
                                        }

                                    }
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    alert(xhr.status);
                                    alert(thrownError);
                                }
                            });
                        });
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });
            }

            var setting = {
                check: {
                    enable: true, //设置zTree的节点上是否显示checkbox/radio框，默认值: false
                    chkboxType: {"Y": "ps", "N": "ps"}
                },
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    onCheck: myOnCheck
                }
            };

            var setting1 = {
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    onClick: myOnClick1
                }
            };


            var zNodes1 = [
                {id: 1, pId: 0, name: "父节点1 - 展开", open: true, checked: true},
                {id: 11, pId: 1, name: "父节点11 - 折叠"},
                {id: 111, pId: 11, name: "叶子节点111"},
                {id: 112, pId: 11, name: "叶子节点112"},
                {id: 113, pId: 11, name: "叶子节点113"},
                {id: 114, pId: 11, name: "叶子节点114"},
                {id: 12, pId: 1, name: "父节点12 - 折叠"},
                {id: 121, pId: 12, name: "叶子节点121"},
                {id: 122, pId: 12, name: "叶子节点122"},
                {id: 123, pId: 12, name: "叶子节点123"},
                {id: 124, pId: 12, name: "叶子节点124"},
                {id: 13, pId: 1, name: "父节点13 - 没有子节点", isParent: true},
                {id: 2, pId: 0, name: "父节点2 - 折叠"},
                {id: 21, pId: 2, name: "父节点21 - 展开", open: true},
                {id: 211, pId: 21, name: "叶子节点211"},
                {id: 212, pId: 21, name: "叶子节点212"},
                {id: 213, pId: 21, name: "叶子节点213"},
                {id: 214, pId: 21, name: "叶子节点214"},
                {id: 22, pId: 2, name: "父节点22 - 折叠"},
                {id: 221, pId: 22, name: "叶子节点221"},
                {id: 222, pId: 22, name: "叶子节点222"},
                {id: 223, pId: 22, name: "叶子节点223"},
                {id: 224, pId: 22, name: "叶子节点224"},
                {id: 23, pId: 2, name: "父节点23 - 折叠"},
                {id: 231, pId: 23, name: "叶子节点231"},
                {id: 232, pId: 23, name: "叶子节点232"},
                {id: 233, pId: 23, name: "叶子节点233"},
                {id: 234, pId: 23, name: "叶子节点234"},
                {id: 3, pId: 0, name: "父节点3 - 没有子节点", isParent: true}
            ];

            $(document).ready(function () {

                $("#query").click(function () {
                    $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th></th><th>区域编码</th><th>城市名称</th><th>站點號</th><th>數據長度</th><th>站點狀態</th><th>實況準時率</th><th>數據完整度</th></tr></thead><tfoot></tfoot><tbody></tbody></table>");
                    $('#detailTable').DataTable({
                        columnDefs: [
                            {orderable: false, targets: 0}
                        ],
                        //     bFilter: false
                    });
                    $.fn.zTree.init($("#treeDemo"), setting, zNodes1);




                })

                $("#query1").click(function () {
                    $.fn.zTree.init($("#treeDemo"), setting1, zNodes1);
                })


                $("#save").click(function () {
                    alert("已選取")
                });
            });
        </script>
    </body>
</html>
