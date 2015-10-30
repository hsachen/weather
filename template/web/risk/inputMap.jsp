
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <link href="${pageContext.request.contextPath}/css/multi-select.css" rel="stylesheet">
        <style type="text/css">
            body, html{width: 100%;height: 100%;overflow: hidden;margin:0;}
            #allmap {height: 60%;overflow: hidden;}
            #result {height:40%;width:295px;top:0px;right:0px;font-size:12px;}
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
        <!--加载鼠标绘制工具-->
        <script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
        <link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
        <!--加载检索信息窗口-->
        <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
        <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />
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
        <div id="result" style="margin:auto">
            <form>

                <dl>
                    <dd>
                        <ul>
                            <li>
                                <input type="button" value="获取站點" onclick="bmap.getOverLay()"/>
                            </li>
                        </ul>
                    </dd>
                    <dd>

                </dl>
                <div class="ms-container" style="width:300px">
                    <div class="ms-selectable" >
                        <select style="height:173px;width: 133px" id='unselect' multiple='multiple' size="10" style="width: 10em;">
                            <option></option>
                        </select>
                    </div>
                    <div class="ms-selection"  style="height:173px">
                        <select style="height:173px;width: 133px"  id='select' multiple='multiple' size="10" style="width: 10em;">
                            
                        </select>
                    </div>

                </div>
                <button class="btn btn-default"  id="save">確定</button>
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
                    //实例化鼠标绘制工具
                    this.drawingManager = new BMapLib.DrawingManager(map, {
                        //isOpen: false, //是否开启绘制模式
                        enableDrawingTool: true, //是否显示工具栏
                        drawingToolOptions: {
                            anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
                            offset: new BMap.Size(5, 5), //偏离值
                            scale: 0.8, //工具栏缩放比例
                            drawingModes : [ BMAP_DRAWING_CIRCLE] 

                        },
                        circleOptions: styleOptions, //圆的样式
                        polylineOptions: styleOptions, //线的样式
                        polygonOptions: styleOptions, //多边形的样式
                        rectangleOptions: styleOptions //矩形的样式
                    });
                    //添加鼠标绘制工具监听事件，用于获取绘制结果
                    this.drawingManager.addEventListener('overlaycomplete', bmap.overlaycomplete);
                    /*加载一个已有的多边形*/
                    if (this.myOverlay) {
                        this.loadMyOverlay();
                    }
                    ;
                    map.addEventListener("rightclick", function (e) {
                        alert(e.point.lng + "," + e.point.lat);
                    });
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
                    $.ajax({
                        url: "../mapQuery?p=" + box.W,
                        //    data: {p: box.W},
                        type: "POST",
                        dataType: "json",
                        success: function (JData) {
                            $("#pre-selected-options").each(function () {
                                alert($(this).find('option').attr('selected'));

                            });
                            $("#unselect").empty();

                            $.each(JData, function (index, element) {

                                $("#unselect").append("<option value=" + element.siteId + ">" + element.siteId + "-" + element.siteName + "</option>")
                            });

                            $('#pre-selected-options').multiSelect("refresh");
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(xhr.status);
                            alert(thrownError);
                        }
                    });
                    console.log(box);
                    //    console.log(box.W);
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
        <script>
            $(document).ready(function () {
                //
                $('#unselect').change(
                        function () {
                            $(this).find('option:selected').each(
                                    function () {
                                        //   debugger;
                                        var v = $(this).val();
                                        if ($("#select option[value=" + v + "]").length == 0) {
                                            $("#select").append("<option value=" + $(this).val() + " >" + $(this).text() + "</option>")
                                            $(this).remove();
                                        } else {
                                            alert("已存在")
                                        }

                                        // $(this).find('option:selected').remove();
                                    });
                        });

                $('#select').change(
                        function () {
                            //  $('#select').empty();
                            $(this).find('option:selected').each(
                                    function () {
                                        var v = $(this).val();
                                        if ($("#unselect option[value=" + v + "]").length == 0) {
                                            $("#unselect").append("<option value=" + $(this).val() + ">" + $(this).text() + "</option>")
                                        }
                                        $(this).remove();
                                    });
                        });

                $("#save").click(function () {
                    alert("已選取")
                });
            });
        </script>
    </body>
</html>
