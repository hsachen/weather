<%-- 
    Document   : map
    Created on : 2015/9/30, 下午 10:28:21
    Author     : Jean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=PiGMtv3G6le78v4C7ttOKSyo"></script>
 </head>

 <body>
    <h2>拉框搜索餐馆</h2>
    <div style="width:520px;height:340px;border:1px solid gray" id="container">
    </div>
    <input type="button" value="开启" onclick="pullBox.open();" />
    <input type="button" value="关闭" onclick="pullBox.close();" />
    <div id="result" style="width:520px;"></div>
    <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInRectangle/1.2/src/SearchInRectangle_min.js"></script>
   
    <script type="text/javascript">
        var map = new BMap.Map("container");
        map.centerAndZoom(new BMap.Point(105.000, 38.000), 5); 
        var keyword = "餐馆" ;
        var pullBox = new BMapLib.SearchInRectangle(map,keyword,{
            renderOptions:{
                map: map,
                strokeWeight: 2,
                strokeColor: "red",
                opacity: 0.7,                
                followText: "拖拽鼠标搜索"+ keyword +"",
                autoClose: false,
                autoViewport: false,
                panel: "result",
                selectFirstResult: true
            }
        }); 
        pullBox.setFillColor("white");
        pullBox.setLineStyle("dashed");
    
    
    </script>
 </body>
</html>
