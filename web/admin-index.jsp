<%--
  Created by IntelliJ IDEA.
  User: daddywolf
  Date: 16/2/20
  Time: 下午3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="model.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js">
<head>
    <jsp:include page="import/admin.jsp"></jsp:include>
    <title>校园闪电侠后台管理系统 | 首页</title>

</head>
<jsp:include page="import/isLogin.jsp"></jsp:include>
<%--未登录不允许访问本页面--%>

<body>
<!--[if lte IE 9]>
<div class="am-alert am-alert- " data-am-alert>
    <button type="button" class="am-close">&times;</button>
    <p align="center" class="browsehappy">你正在使用<strong>过时</strong>的浏览器，本系统暂不支持。 请 <a
            href="http://dlsw.baidu.com/sw-search-sp/soft/9d/14744/ChromeStandalone_49.0.2623.75_Setup.1457073636.exe"
            target="_blank">升级到Chrome浏览器</a></p>
</div>
<![endif]-->

<%--引入JavaBean对象--%>
<jsp:useBean id="AdminServices" class="service.AdminServices"></jsp:useBean>
<jsp:useBean id="informServices" class="service.informServices"></jsp:useBean>

<%
    //实例化daiban_account对象,从session里获取user
    Admin admin = (Admin) session.getAttribute("user");


%>

<%--header引入--%>
<jsp:include page="divs/div-header.jsp"></jsp:include>

<div class="am-cf admin-main">
    <!-- sidebar start -->
    <%--侧边栏引入--%>
    <jsp:include page="divs/div-slidebar.jsp"></jsp:include>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> /
                <small>统计</small>
            </div>
        </div>

        <hr/>

        <div class="am-alert am-alert-success" data-am-alert><%--绿色条幅--%>
            <button type="button" class="am-close ">&times;</button>
            <p align="center">耐心 . 细心 . 仔细 . 认真</p>
        </div>

        <div class="am-g am-u-sm-12">
            <div class="am-panel am-panel-default ">
                <div class="am-panel-hd am-cf l" data-am-collapse="{target: '#collapse-panel-1'}">总览<span
                        class="am-icon-chevron-down am-fr"></span></div>
                <div id="collapse-panel-1" class="am-in am-scrollable-horizonta">
                    <ul class="am-avg-sm-1 am-avg-md-4  am-padding am-text-center admin-content-list ">
                        <li><a href="admin-table.jsp" class="am-text-success"><span
                                class="am-icon-btn am-success am-icon-comments"></span><br/>今日订单<br/>1
                        </a></li>
                        <%--未实现--%>
                        <li><a href="admin-table.jsp" class="am-text-warning"><span
                                class="am-icon-btn am-warning am-icon-clock-o"></span><br/>已付款未分配订单<br/>2
                        </a><%--未实现--%>
                        </li>
                        <li><a href="admin-daibanList.jsp" class="am-text-secondary"><span
                                class="am-icon-btn am-secondary am-icon-sign-in"></span><br/>派送中订单<br/>3
                            <%--在线人数--%>
                        </a>
                        </li>
                        <li><a href="admin-daibanList.jsp" class="am-text-success"><span
                                class="am-icon-btn am-success am-icon-check"></span><br/>当前在线管理员<br/>4
                            <%--离线人数--%>
                        </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


    </div>
    <!-- content end -->

</div>

<a href="#" class="am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}">
    <span class="am-icon-btn am-icon-th-list"></span>
</a>

<%--footer引入--%>
<jsp:include page="divs/div-footer.jsp"></jsp:include>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script src="assets/js/myjs.js"></script>
<%--自己编写的js文件--%>
</body>
</html>