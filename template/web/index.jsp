<%-- 
    Document   : index
    Created on : 2015/8/13, 下午 04:32:03
    Author     : Jean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String path = request.getParameter("path");
%>
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

        <%@include file="template/style.jsp" %>

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
                <%@include file="template/header.jsp" %>
            </header>      
            <!--header end-->

            <aside>
                <%@include file="template/sidebar.jsp" %>
            </aside>
            <!--sidebar end-->
            <!--main content start-->
            <section id="main-content">
            </section>
            <!--main content end-->
        </section>
        <!-- container section start -->

    </body>
    <%@include file="template/script.jsp" %>
    <script>

        //knob
        $(function () {
            $(".knob").knob({
                'draw': function () {
                    $(this.i).val(this.cv + '%')
                }
            })
        });

        //carousel
        $(document).ready(function () {
            $("#owl-slider").owlCarousel({
                navigation: true,
                slideSpeed: 300,
                paginationSpeed: 400,
                singleItem: true

            });


            var path = "<%=path%>";
            if (path != "null") {
                $("#main-content").load(path);
            }
            $(".clink").click(function () {
                $("#main-content").empty();
                $("#main-content").load($(this).attr("folder"));
            });

        });

        //custom select box

  

    </script>

</html>
