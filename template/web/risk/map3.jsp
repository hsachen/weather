
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
            body, html{width: 100%;height: 100%;overflow: auto;margin:0;}
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
                <button  type="button" class="btn btn-success"  title="基礎圖層" id="query" style="margin-left:20px">基礎圖層</button>
                <button  type="button" class="btn btn-success"  title="評估展示" id="query1" style="margin-left:20px">評估展示</button>
                <button  type="button" class="btn btn-success"  title="預測判賠" id="query2" style="margin-left:20px">預測判賠</button>
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
        <script src="${pageContext.request.contextPath}/lib/DataTables1.10.8/extensions/Select/js/dataTables.select.min.js" type="text/javascript"></script>
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
                           var t = $('#detailTable').DataTable();


                           $.each(JData, function (index, element) {
                               t.row.add([
                                   "<input type=\"checkbox\" name=\"checkbox\" value=" + index + " >",
                                   treeNode.id,
                                   element.areaCode,
                                   element.cityCN,
                                   element.siteCode,
                                   element.activityCode,
                                   element.date,
                                   element.probability,
                                   element.probability
                               ]).draw(false);
                               //  $("#detailTable > tbody ").append("<tr role=\"row\" ><td><input type=\"checkbox\" name=\"checkbox\" value=" + index + " ></td><td>" + element.areaCode + "</td><td>" + element.cityCN + "</td><td>" + element.siteCode + "</td><td>" + element.activityCode + "</td><td>" + element.date + "</td><td>" + element.probability + "</td><td>" + element.logUser + "</td></tr>");
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
               } else {
                   //取消選取
                   var table = $('#detailTable').DataTable();
                   table.column(1)
                           .data()
                           .each(function (value, index) {
                               if (treeNode.id == value) {
                                   table.rows(':eq(' + index + ')', {page: 'current'}).select();
                                   //  console.log('Data in index: ' + index + ' is: ' + value);
                               }
                           });

                   table.rows('.selected').remove().draw(false);
               }
           }



           function myOnClick1(event, treeId, treeNode) {
               $.ajax({
                   url: "../getMapSite?id=" + treeNode.id,
                   type: "POST",
                   dataType: "json",
                   success: function (JData) {
                       var t = $('#detailTable').DataTable();
                       t.clear().draw();

                       $.each(JData, function (index, element) {
                           t.row.add([
                               "<input type=\"checkbox\" name=\"checkbox\" value=" + index + " >",
                               element.areaCode,
                               element.cityCN,
                               element.siteCode,
                               element.activityCode,
                               element.date,
                               element.probability,
                               element.probability
                           ]).draw(false);
                           //  $("#detailTable > tbody ").append("<tr role=\"row\" ><td><input type=\"checkbox\" name=\"checkbox\" value=" + index + " ></td><td>" + element.areaCode + "</td><td>" + element.cityCN + "</td><td>" + element.siteCode + "</td><td>" + element.activityCode + "</td><td>" + element.date + "</td><td>" + element.probability + "</td><td>" + element.logUser + "</td></tr>");
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
               async: {
                   enable: true,
                   url: "../map3Data",
                   dataType: "json",
                   autoParam: ["id", "name=n", "level=lv"],
                   dataFilter: filter
               },
               callback: {
                   onClick: myOnClick1
               }
           };

           function filter(treeId, parentNode, childNodes) {
               debugger;
               if (!childNodes)
                   return null;
               for (var i = 0, l = childNodes.length; i < l; i++) {
                   //  childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
               }
               return childNodes;
           }


           $(document).ready(function () {


               $("#query").click(function () {
                   map.clearOverlays();
                   $("#table_div").empty();
                   $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th><input type=\"checkbox\" id=\"selectAll\"  ></th><th>treenode</th><th>区域编码</th><th>城市名称</th><th>站點號</th><th>數據長度</th><th>站點狀態</th><th>實況準時率</th><th>數據完整度</th></tr></thead><tfoot></tfoot><tbody></tbody></table>");
                   var t = $('#detailTable').DataTable({
                       columnDefs: [
                           {orderable: false, targets: 0}
                       ],
                       language: {
                           url: '../lib/DataTables1.10.8/Chinese.json'
                       },
                       bLengthChange: false

                               //     bFilter: false
                   });
                   t.on('draw', function () {
                       debugger;
                       // Update state of "Select all" control
                       updateDataTableSelectAllCtrl(t);
                   });
                   $("#selectAll").click(function () {
                       updateDataTableSelectAllCtrl(t);
                       if ($(this).hasClass('allChecked')) {
                           $('input[type="checkbox"]', '#detailTable').prop('checked', false);
                       } else {
                           $('input[type="checkbox"]', '#detailTable').prop('checked', true);
                       }
                       $(this).toggleClass('allChecked');

                   });
                   var treeNodes;
                   //  $.fn.zTree.init($("#treeDemo"), setting1, zNodes1);
                   $(function () {
                       $.ajax({
                           async: false,
                           cache: false,
                           type: 'POST',
                           dataType: "json",
                           url: "map3.json", //请求的action路径  
                           error: function () {//请求失败处理函数  
                               alert('请求失败');
                           },
                           success: function (data) { //请求成功后处理函数。    
                               //   alert(data);
                               treeNodes = data;   //把后台封装好的简单Json格式赋给treeNodes  
                           }
                       });
                       $.fn.zTree.init($("#treeDemo"), setting, treeNodes);
                   });

               });

               $("#query1").click(function () {
                   map.clearOverlays();
                   var treeNodes;
                   $("#table_div").empty();
                   $("#table_div").append("<table id=\"detailTable\" class=\"display\" cellspacing=\"0\" width=\"100%\"><thead><tr><th><input type=\"checkbox\" id=\"selectAll\"  ></th><th>区域编码</th><th>省份</th><th>城市名称</th><th>所属站点组</th><th>活动代码</th><th>概率</th><th>详情</th></tr></thead><tfoot></tfoot><tbody></tbody></table>");
                   var t = $('#detailTable').DataTable({
                       columnDefs: [
                           {orderable: false, targets: 0}
                       ],
                       language: {
                           url: '../lib/DataTables1.10.8/Chinese.json'
                       },
                       bLengthChange: false
                               //     bFilter: false
                   });
                   t.on('draw', function () {
                       debugger;
                       // Update state of "Select all" control
                       updateDataTableSelectAllCtrl(t);
                   });
                   $("#selectAll").click(function () {
                       updateDataTableSelectAllCtrl(t);
                       if ($(this).hasClass('allChecked')) {
                           $('input[type="checkbox"]', '#detailTable').prop('checked', false);
                       } else {
                           $('input[type="checkbox"]', '#detailTable').prop('checked', true);
                       }
                       $(this).toggleClass('allChecked');

                   });
                   $(function () {
                       $.ajax({
                           async: true,
                           cache: false,
                           type: 'POST',
                           dataType: "json",
                           url: "map3.json", //请求的action路径  
                           error: function () {//请求失败处理函数  
                               alert('请求失败');
                           },
                           success: function (data) { //请求成功后处理函数。    
                               //   alert(data);
                               treeNodes = data;   //把后台封装好的简单Json格式赋给treeNodes  
                           }
                       });
                       $.fn.zTree.init($("#treeDemo"), setting1);
                       // zTree = $("#treeDemo").zTree(setting, treeNodes);
                   });
               });

               $("#query2").click(function () {
                   map.clearOverlays();
                   var treeNodes;
                   //  $.fn.zTree.init($("#treeDemo"), setting1, zNodes1);
                   $(function () {
                       /* $.ajax({
                        async: false,
                        cache: false,
                        type: 'POST',
                        dataType: "json",
                        url: "map3.json", //请求的action路径  
                        error: function () {//请求失败处理函数  
                        alert('请求失败');
                        },
                        success: function (data) { //请求成功后处理函数。    
                        //   alert(data);
                        treeNodes = data;   //把后台封装好的简单Json格式赋给treeNodes  
                        }
                        });*/
                       $.fn.zTree.init($("#treeDemo"), setting1, treeNodes);
                       //  zTree = $("#treeDemo").zTree(setting, treeNodes);
                   });
               })


               $("#save").click(function () {
                   alert("已選取")
               });
           });
           function updateDataTableSelectAllCtrl(table) {
               var $table = table.table().node();
               var $chkbox_all = $('tbody input[type="checkbox"]', $table);
               var $chkbox_checked = $('tbody input[type="checkbox"]:checked', $table);
               var chkbox_select_all = $('thead input[id="selectAll"]', $table).get(0);

               // If none of the checkboxes are checked
               debugger;
               if ($chkbox_checked.length === 0) {
                   chkbox_select_all.checked = false;

                   // If all of the checkboxes are checked
               } else if ($chkbox_checked.length === $chkbox_all.length) {
                   chkbox_select_all.checked = true;


                   // If some of the checkboxes are checked
               }
           }
        </script>
    </body>
</html>
