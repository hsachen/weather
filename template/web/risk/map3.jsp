
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
        <style type="text/css">
            body, html{width: 100%;height: 100%;overflow: hidden;margin:0;}
            #allmap {height: 60%;overflow: hidden;}
            #result {height:40%;width:40%;top:0px;right:0px;font-size:12px;}
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
        <div id="allmap" style="overflow:hidden;zoom:1;position:relative;"> 
            <div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>

            <div id="panelWrap" style="width:0px;position:absolute;top:0px;right:0px;height:100%;overflow:auto;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;">
                <div style="width:20px;height:200px;margin:-100px 0 0 -10px;color:#999;position:absolute;opacity:0.5;top:50%;left:50%;" id="showOverlayInfo"></div>
                <div id="panel" style="position:absolute;"></div>
            </div>
        </div>
        <div id="result" >
            <form>
                <div class="zTreeDemoBackground left" width="30%" style="float:left">
                    <ul id="treeDemo" class="ztree"></ul>
                    <button class="btn btn-default"  id="save">確定</button>
                </div>
                <div width="70%" style="float:right">
                    <table class="table">
                        <tr>
                            <th></th>
                            <th>区域编码</th>
                            <th>城市名称</th>
                            <th>所属站点组</th>
                            <th>活动代码</th>
                            <th>日期</th>
                            <th>概率</th>
                            <th>详情</th>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="checkbox" value="1"></td>
                            <td></td>
                            <td></td>
                            <td>e</td>
                            <td>r</td>
                            <td>e</td>
                            <td>a</td>
                            <td>详情</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="checkbox" value="2"></td>
                            <td></td>
                            <td></td>
                            <td>e</td>
                            <td>r</td>
                            <td>e</td>
                            <td>a</td>
                            <td>s</td>
                        </tr>
                    </table>
                </div>
            </form> </div>
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


                },
                loadMyOverlay: function () {
                    var map = this.map;
                    this.clearAll();
                    map.centerAndZoom(this.point, 11);
                    myPolygon = new BMap.Polygon(this.myOverlay, this.styleOptions);
                    this.myPolygon = myPolygon;
                    try {
                        myPolygon.enableEditing();
                    } catch (e) {
                    }
                    ;
                    myPolygon.addEventListener("lineupdate", function (e) {
                        bmap.showLatLon(e.currentTarget.W);
                    });
                    map.addOverlay(myPolygon);
                },
                showLatLon: function (a) {
                    var len = a.length;
                    var s = '';
                    var arr = [];
                    for (var i = 0; i < len - 1; i++) {
                        arr.push([a[i].lng, a[i].lat]);
                        s += '<li>' + a[i].lng + ',' + a[i].lat + '<span class="red" title="删除" onclick="bmap.delPoint(' + i + ')">X</span></li>';
                    }
                    this.overlaysCache = arr;
                    $("panelWrap").innerHTML = '<ul>' + s + '</ul>';
                },
                delPoint: function (i) {
                    if (this.overlaysCache.length <= 3) {
                        alert('不能再删除, 请保留3个以上的点.');
                        return;
                    }
                    this.overlaysCache.splice(i, 1);
                    var a = this.overlaysCache;
                    var newOverlay = [];
                    for (var i in a) {
                        newOverlay.push(new BMap.Point(a[i][0], a[i][1]));
                    }
                    this.myOverlay = newOverlay;
                    this.loadMyOverlay();
                },
                /**
                 *回调获得覆盖物信息
                 */
                overlaycomplete: function (e) {
                    bmap.overlays.push(e.overlay);
                    e.overlay.enableEditing();
                    e.overlay.addEventListener("lineupdate", function (e) {
                        bmap.showLatLon(e.currentTarget.W);
                    });
                },
                /**
                 * 清除覆盖物
                 */
                clearAll: function () {
                    var map = this.map;
                    var overlays = this.overlays;
                    for (var i = 0; i < overlays.length; i++) {
                        map.removeOverlay(overlays[i]);
                    }
                    this.overlays.length = 0
                    map.removeOverlay(this.myPolygon);
                    this.myPolygon = '';
                },
                /**
                 *取覆盖物的经纬度
                 */
                getOverLay: function () {
                    var box = this.myPolygon ? this.myPolygon : this.overlays[this.overlays.length - 1];

                    console.log(box.W);
                },
                getCount: function () {
                    var n = 0;
                    if (this.myPolygon) {
                        n++;
                    }
                    ;
                    if (this.overlays) {
                        n = n + this.overlays.length;
                    }
                    ;
                    console.log(n);
                }
            };

            //加载一个已有的多边形
            bmap.myOverlay = [
            ];
            bmap.init();
            bmap.clearAll()

        </script>
        <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.multi-select.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.min.js"></script>
        <script>
            function myOnClick(event, treeId, treeNode) {
                alert(treeNode.tId + ", " + treeNode.name);
            }
            ;
            var setting = {
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    onClick: myOnClick
                }
            };

            var zNodes = [
                {id: 1, pId: 0, name: "父节点1 - 展开", open: true},
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

                $.fn.zTree.init($("#treeDemo"), setting, zNodes);

                $('input[name=checkbox]').click(function () {
                    var map = new BMap.Map("allmap");
                    var point = new BMap.Point(116.404, 39.915);
                    map.centerAndZoom(point, 15);
                    var bounds = map.getBounds();
                    var sw = bounds.getSouthWest();
                    var ne = bounds.getNorthEast();
                    var lngSpan = Math.abs(sw.lng - ne.lng);
                    var latSpan = Math.abs(ne.lat - sw.lat);
                    $.ajax({
                        url: "../getCoordinate?id=" + $(this).val(),
                        type: "POST",
                        dataType: "json",
                        success: function (msg) {
//                            for (var i = 0; i < 4; i++) {
//                                var point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7));
//                                alert(point)
//                                var marker = new BMap.Marker(new BMap.Point(point));
//                                map.addOverlay(marker);
//                            }

                            var marker = new BMap.Marker(new BMap.Point(msg[0].x, msg[0].y));
                            map.addOverlay(marker);            //增加点
                            //

//                            var marker = new BMap.Marker(new BMap.Point(msg[1].x, msg[1].y));
//                            map.addOverlay(marker);            //增加点
                            //     alert(msg);

                            //       $("#main-content").load("order/itemManager.jsp");
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(xhr.status);
                            alert(thrownError);
                        }
                    });
                });

                $("#save").click(function () {
                    alert("已選取")
                });
            });
        </script>
    </body>
</html>
