<%@ page import="model.Admin" %>
<%@ page import="model.Inform" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: daddywolf
  Date: 16/2/20
  Time: 下午3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html class="no-js">
<head>
    <jsp:include page="../import/admin.jsp"></jsp:include>
    <title>青岛大学2016年带班管理系统 | 个人设置</title>

</head>
<jsp:include page="../import/isLogin.jsp"></jsp:include>
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
<jsp:useBean id="informServices" class="service.informServices"></jsp:useBean>

<%
    //实例化daiban_account对象,从session里获取user
    Admin account = (Admin) session.getAttribute("user");
    //通知    调用informServices.queryAllInform();方法获取的list赋值给inf,迭代器it迭代输出
    List inf = informServices.queryAllInform();
    Iterator it = inf.iterator();
%>

<%--header引入--%>
<jsp:include page="../divs/div-header.jsp"></jsp:include>

<div class="am-cf admin-main">
    <!-- sidebar start -->
    <%--侧边栏引入--%>
    <jsp:include page="../divs/div-slidebar.jsp"></jsp:include>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">查看所有通知</strong> /
                <small>Query All Inform</small>
            </div>
        </div>
        <hr/>
        <div class="am-g am-u-sm-12">
            <div class="am-panel am-panel-default">
                <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-3'}">全部通知:共 <%=inf.size()%>
                    条通知<span
                            class="am-icon-chevron-down am-fr"></span></div>
                <div class="am-panel-bd am-collapse am-in am-cf " id="collapse-panel-3">
                    <ul class="am-comments-list admin-content-comment">
                        <li class="am-comment">
                            <%
                                //迭代输出通知
                                while (it.hasNext()) {
                                    Inform inf2 = (Inform) it.next();
                            %>
                            <a href="#"><img
                                    src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/96/h/96"
                                    alt="" class="am-comment-avatar" width="48" height="48"></a>
                            <div class="am-comment-main">
                                <header class="am-comment-hd">
                                    <div class="am-comment-meta"><strong><%=inf2.getTitle()%>
                                    </strong> 由 <a href="#" class="am-comment-author"><%=inf2.getPublisher()%>
                                    </a> 发送于
                                        <time><strong><%=inf2.getTime()%>
                                        </strong></time>
                                    </div>
                                </header>
                                <div class="am-comment-bd"><p><%=inf2.getContent()%>
                                </p>
                                </div>
                            </div>
                            <br/>
                            <%
                                }
                            %>
                        </li>
                    </ul>
                    <ul class="am-pagination am-fr admin-content-pagination"><%--分页导航--%>
                        <li class="am-disabled"><a href="#">&laquo;</a></li>
                        <li class="am-active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<%--footer引入--%>
<jsp:include page="../divs/div-footer.jsp"></jsp:include>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="../assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="../assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="../assets/js/amazeui.min.js"></script>
<script src="../assets/js/myjs.js"></script>
<script src="../assets/js/app.js"></script>
</body>
</html>
