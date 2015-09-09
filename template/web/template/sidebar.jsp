<%-- 
    Document   : sidebar
    Created on : 2015/8/14, 上午 09:29:55
    Author     : Z00907
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <div id="sidebar"  class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu">                
                        <li class="sub-menu">
                            <a href="javascript:;" class="m1">
                                <i class="icon_drive_alt"></i>
                                <span>主数据管理</span>
                                <span class="menu-arrow arrow_carrot-right"></span>
                            </a>
                            <ul class="sub">
                                <li><a class="" href="#">行政区</a></li>                          
                                <li><a class="" href="#" folder="risk/input.jsp">观测站</a></li>
                                <li><a class="" href="#">天气要素</a></li>
                            </ul>
                        </li>       
                        <li class="sub-menu">
                            <a href="javascript:;" class="">
                                <i class="icon_genius"></i>
                                <span>天气指数评估</span>
                                <span class="menu-arrow arrow_carrot-right"></span>
                            </a>
                            <ul class="sub">
                                <li><a class="clink" href="#" folder="risk/input.jsp">条件配置</a></li>
                                <li><a class="clink" href="#">任务列表</a></li>
                                <li><a class="clink" href="#">站点组管理</a></li>
                            </ul>
                        </li>

                        <li class="sub-menu">
                            <a href="javascript:;" class="">
                                <i class="icon_documents_alt"></i>
                                <span>保险产品</span>
                                <span class="menu-arrow arrow_carrot-right"></span>
                            </a>
                            <ul class="sub">                          
                                <li><a class="clink" href="#" folder="order/itemManager.jsp">项目管理</a></li>
                                <li><a  href="${pageContext.request.contextPath}/order/productManager.jsp" >产品管理</a></li>
                                <li><a class="clink" href="#">系统监控</a></li>
                            </ul>
                        </li>

                        <li>
                            <a class="" href="#">
                                <i class="icon_cone"></i>
                                <span>站点地图</span>
                            </a>
                        </li>

                        <li class="sub-menu">
                            <a href="javascript:;" class="">
                                <i class="icon_cogs"></i>
                                <span>系统管理</span>
                                <span class="menu-arrow arrow_carrot-right"></span>
                            </a>
                            <ul class="sub">                          
                                <li><a class="" href="#">用户管理</a></li>
                                <li><a class="" href="#">客户联系人管理</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- sidebar menu end-->
                </div>
            