
<%@page import="tw.com.model.entity.AccountTbl"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin - Bootstrap Admin Template</title>

        <!-- Bootstrap Core CSS -->
        <link href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/custom-sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/lib/DataTables-1.10.7/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <%@include file="navbar.jsp" %>
                <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                帳號管理 <small>Statistics Overview</small>
                            </h1>
                            <ol class="breadcrumb">
                                <li class="active">
                                    <i class="fa fa-dashboard"></i> 帳號管理
                                </li>
                            </ol>
                            <table id="acc_tbl" class="display" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>帳號群組</th>
                                        <th>用戶帳號</th>
                                        <th>用戶名稱</th>
                                        <th>戶籍地址</th>
                                        <th>生效日期(起)</th>
                                        <th>生效日期(迄)</th>
                                        <th>認證狀態</th>
                                        <th>修改</th>
                                        <th>刪除</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <%
                                        @SuppressWarnings(  "unchecked")
                                        List<AccountTbl> accountList = (List<AccountTbl>) request.getAttribute("accountList");
                                        for (AccountTbl account : accountList) {
                                            out.write("<tr>");
                                            out.write("<td>" + account.getAccountGroup() + "</td>");
                                            out.write("<td>" + account.getUserId() + "</td>");
                                            out.write("<td>" + account.getUserName() + "</td>");
                                            out.write("<td>" + account.getEmailAddress() + "</td>");
                                            out.write("<td>" + account.getValidFrom() + "</td>");
                                            out.write("<td>" + account.getValidEnd() + "</td>");
                                            out.write("<td>" + account.getStatus() + "</td>");
                                            out.write("<td><a class=\"glyphicon glyphicon-pencil\" href=\"\"></a></td>");
                                            out.write("<td><a class=\"glyphicon glyphicon-trash\" href=\"\"></a></td>");
                                            out.write("</tr>");
                                        }
                                    %>
                                </tbody>

                                <tfoot>
                                </tfoot>

                            </table>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <button type="button"  data-toggle="modal" data-target="#acc_modal">
                                新增
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="acc_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">新增</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Recipient:</label>
                                <input type="text" class="form-control" id="recipient-name">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="control-label">Message:</label>
                                <textarea class="form-control" id="message-text"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Send message</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/jquery-1.11.3.min.js" type="text/javascript"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/lib/DataTables-1.10.7/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#acc_tbl').DataTable();
            });
        </script>
    </body>
</html>
