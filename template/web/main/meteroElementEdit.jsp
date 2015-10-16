<%-- 
    Document   : meteroElementEdit
    Created on : 2015/10/16, 下午 03:23:19
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
                        <div class="row">
                            <div class="col-lg-12">
                                <ol class="breadcrumb">
                                    <li><i class="fa fa-home"></i><a href="../index.jsp">Home</a></li>
                                    <li><i class="icon_documents_alt"></i><a href="meteroManager.jsp">天气要素</a></li>
                                    <li><i class="icon_documents_alt"></i>天气要素編輯</li>
                                </ol>
                            </div>
                        </div>
                        <div class="panel-content ">
                            <div class="panel-body">
                                <form id="addForm" class="form-horizontal " method="post"  >
                                    <input type="hidden" class="form-control" id="postType" name="postType" value="edit" >
                                    <div class="panel-heading"></div>
                                    <div class="panel-content">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">天气要素代码</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="metetoElementId" name="metetoElementId">
                                            </div>
                                            <label class="col-sm-2 control-label">天气要素描述(中文)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="metetoElementCN" name="metetoElementCN">
                                            </div>
                                            <label class="col-sm-2 control-label">天气要素描述(英文)</label>
                                            <div class="col-sm-2">
                                                <input type="text" class="form-control" id="metetoElementEN" name="metetoElementEN">
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label"></label>
                                    <a class="btn btn-default"  title="保存" id="submitBtn">保存</a>
                                    <input type="reset" class="btn btn-default" value="重置">
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
            <!--main content end-->
        </section>
        <!-- container section start -->
        <%@include file="../template/script.jsp" %>

        <script>
            $(document).ready(function () {
                
                 $.ajax({
                    url: "../meteroMainEleQuery",
                    //  data: $('#queryForm').serialize(),
                    type: "POST",
                    dataType: "json",
                    success: function (JData) {

                        $.each(JData, function (index, element) {
                            $("#metetoElementId").val(element.metetoElementId);
                            $("#metetoElementCN").val(element.metetoElementCN);
                            $("#metetoElementEN").val(element.metetoElementEN);
  
                        });


                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });
                
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
                        $("select[name='metetoElementId']").append(meteroE);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    }
                });

                //保存
                $("#submitBtn").click(function () {
                    $.ajax({
                        url: "../meteroMainEleSave",
                        data: $('#addForm').serialize(),
                        type: "POST",
                        success: function (msg) {
                            alert(msg);
                            window.location.href = "meteroElementManager.jsp";
                            //       $("#main-content").load("order/itemManager.jsp");
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(xhr.status);
                            alert(thrownError);
                        }
                    });
                });

            });

        </script>
    </body>

</html>
