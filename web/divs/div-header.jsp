<%@ page import="model.Admin" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: daddywolf
  Date: 16/3/8
  Time: 下午8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="informServices" class="service.informServices"></jsp:useBean>
<%
    Admin account = (Admin) session.getAttribute("admin");
    List inf = informServices.queryAllInform();
%>
<header class="am-topbar admin-header">
    <div class="am-topbar-brand">
        <strong>校园闪电侠后台管理系统</strong>
        <small>V1.0</small>
    </div>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
            data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span
            class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">

            <%--调用myjs.js文件里的showCalc方法打开计算器窗口--%>
            <li><a onclick="ShowCalc()"><span class="am-icon-calculator"></span> 计算器 </a></li>
            <li class="am-dropdown" data-am-dropdown>
                <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                    <span class="am-icon-users"> <%=account.getRealName()%> </span><%--从session里获取用户名--%>
                    <span class="am-icon-caret-down"></span>
                </a>
                <ul class="am-dropdown-content">
                    <li><a href="admin-daibanInfo.jsp"><span class="am-icon-cog"></span> 设置</a></li>
                    <li><a href="../exit.jsp"><span class="am-icon-power-off"></span> 退出</a></li>
                </ul>
            </li>
                <li><a href="../inform/allInform.jsp"><span class="am-icon-envelope-o"></span> 通知 <span
                    class="am-badge am-badge-success"><%=inf.size()%></span></a></li>
            <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span
                    class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
        </ul>
    </div>
</header>