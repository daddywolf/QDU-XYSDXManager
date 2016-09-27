<%@ page import="model.Inform" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: daddywolf
  Date: 16/3/8
  Time: 下午8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="AdminServices" class="service.AdminServices"></jsp:useBean>
<jsp:useBean id="informServices" class="service.informServices"></jsp:useBean>
<%
    List inf = informServices.queryAllInform();
    Iterator it = inf.iterator();
%>
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
        <ul class="am-list admin-sidebar-list">
            <li><a href="../admin-index.jsp"><span class="am-icon-home"></span> 首页 </a></li>
            <li><a href="../admin/adminList.jsp"><span class="am-icon-graduation-cap"></span> 管理员列表 </a></li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-users"></span>
                    用户信息管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav">
                    <li><a href="../user/userList.jsp"><span class="am-icon-pencil"></span> 用户管理 </a></li>
                    <li><a href="../admin-table.jsp"><span class="am-icon-user-plus"></span> 手动添加新用户 </a></li>
                </ul>
            </li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-motorcycle"></span>
                    快递员信息管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav1">
                    <li><a href="../courier/courierList.jsp"><span class="am-icon-pencil"></span> 快递员管理 </a></li>
                    <li><a href="../admin-table.jsp"><span class="am-icon-user-plus"></span> 手动添加快递员 </a></li>
                </ul>
            </li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-file-text-o"></span>
                    订单信息管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav2">
                    <li><a href="../order/orderList.jsp"><span class="am-icon-pencil"></span> 订单管理 </a></li>
                    <li><a href="../order/neworder.jsp"><span class="am-icon-user-plus"></span> 手动添加新订单 </a></li>
                </ul>
            </li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav3'}"><span class="am-icon-map-pin"></span>
                    收货地址管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav3">
                    <li><a href="../address/addressList.jsp"><span class="am-icon-pencil"></span> 收货地址管理 </a></li>
                    <li><a href="../address/newaddress.jsp"><span class="am-icon-user-plus"></span> 手动添加新收货地址 </a></li>
                </ul>
            </li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav4'}"><span class="am-icon-map"></span>
                    广告信息管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav4">
                    <li><a href="../admin-table.jsp"><span class="am-icon-pencil"></span> 广告管理 </a></li>
                    <li><a href="../admin-table.jsp"><span class="am-icon-youtube-play"></span> 发送新广告 </a></li>
                </ul>
            </li>
            <li><a href="../feedback/feedbackList.jsp"><span class="am-icon-thumbs-down"></span> 反馈信息管理 </a></li>
            <li><a href="../inform/sendInform.jsp"><span class="am-icon-twitch"></span> 发送通知 </a></li>
        </ul>

        <div class="am-scrollable-vertical">
            <%
                //迭代输出通知
                while (it.hasNext()) {
                    Inform inf2 = (Inform) it.next();
            %>
            <div class="am-panel am-panel-default admin-sidebar-panel">
                <div class="am-panel-bd">
                    <p><span class="am-icon-bookmark"></span> <%=inf2.getTitle()%><%--标题--%>
                    </p>
                    <p><%=inf2.getContent()%><%--内容--%>
                    </p>
                    <hr/>
                    <p class="am-text-default am-text-right"><%=inf2.getPublisher()%><%--发送者--%>
                    </p>
                    <p class="am-text-sm am-text-right"><%=inf2.getTime()%><%--发送时间--%>
                    </p>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</div>