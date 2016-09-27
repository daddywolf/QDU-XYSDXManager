<%@ page import="model.Admin" %>
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
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <meta charset="utf-8">
    <%--设置jsp字符集--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--自动调节屏幕内容--%>
    <meta name="renderer" content="webkit">
    <%--360浏览器兼容方案,默认webkit内核--%>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="icon" type="image/png" href="../assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/i/app-icon72x72@2x.png">
    <%--iOS主屏幕图标--%>
    <link rel="stylesheet" href="../assets/css/amazeui.min.css"/>
    <%--引入css样式--%>
    <link rel="stylesheet" href="../assets/css/admin.css">
    <%--引入css样式--%>

    <script src="../assets/js/myjs.js"></script>
    <title>校园闪电侠后台管理系统 | 订单列表</title>

    <script src="../assets/js/jPages/jquery-1.8.2.min.js"></script>

</head>
<jsp:include page="../import/isLogin.jsp"></jsp:include>
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

<%
    //实例化daiban_account对象,从session里获取user
    Admin account = (Admin) session.getAttribute("admin");

    List dbi = AdminServices.queryAllAdmin();
    Iterator iter = dbi.iterator();
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
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">管理员列表</strong> /
                <small>Administrator List</small>
            </div>
        </div>

        <hr/>


        <br/>
        <div class="am-g am-u-sm-12" class="am-pre-scrollable ">
            <div class="am-g ">
                <h2 align="center">管理员列表：共 <%=dbi.size()%> 个管理员</h2>


                <div class="am-u-sm-12 am-scrollable-horizontal">

                    <table class="table2excel am-table am-table-compact am-table-bd am-text-nowrap am-table-centered am-table-striped am-table-hover admin-content-table ">
                        <thead>

                        <tr><%--表头--%>
                            <th>操作</th>
                            <th>管理员ID</th>
                            <th>手机号</th>
                            <th>用户名</th>
                            <th>真实姓名</th>
                            <th>性别</th>
                            <th>在线状态</th>
                        </tr>
                        </thead>
                        <tbody id="orderlist">
                        <%
                            //迭代器迭代输出带班信息
                            while (iter.hasNext()) {
                                Admin db = (Admin) iter.next();
                        %>
                        <tr>
                            <td>
                                <div class="am-dropdown " data-am-dropdown>
                                    <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
                                            data-am-dropdown-toggle><span class="am-icon-phone"></span> <span
                                            class="am-icon-caret-down"></span></button>
                                    <ul class="am-dropdown-content">
                                        <li><a href="tel:<%=db.getMobile()%>">1. 拨打电话</a></li>
                                        <li><a href="sms:<%=db.getMobile()%>">2. 发送短信</a></li>
                                    </ul>
                                </div>
                            </td>

                            <td><%=db.getAdminid()%>
                            </td>
                            <td><%=db.getMobile()%>
                            </td>
                            <td>
                                <%
                                    if (db.getUsername() == null || db.getUsername().equals("")) {
                                        out.print("<span class=\"am-badge am-badge-warning\">未填写</span>");
                                    } else {
                                        out.print(db.getUsername());
                                    }
                                %>
                            </td>
                            <td>
                                <%
                                    if (db.getRealName() == null || db.getRealName().equals("")) {
                                        out.print("<span class=\"am-badge am-badge-warning\">未填写</span>");
                                    } else {
                                        out.print(db.getRealName());
                                    }
                                %>
                            </td>
                            <td>
                                <%
                                    if (db.getGender() == 1) {
                                        out.print("男");
                                    } else if (db.getGender() == 2) {
                                        out.print("女");
                                    } else {
                                        out.print("<span class=\"am-badge am-badge-warning\">未填写</span>");
                                    }
                                %>
                            </td>
                            <td>
                                <%
                                    //在线状态
                                    if (db.getStatus() == 1) {
                                %> <span
                                    class="am-badge am-badge-success">在线</span><%} else if (db.getStatus() == 0) {%> <span
                                    class="am-badge am-badge-default">离线</span><%} else if (db.getStatus() == -1) {%> <span
                                    class="am-badge am-badge-warning">停用</span><%} else {%> <span
                                    class="am-badge am-badge-danger">ERROR</span><%
                                }
                            %>
                            </td>
                        </tr>

                        <%
                            }
                        %>

                        <tr>
                            <%--循环生成空行--%>
                            <%
                                for (int i = 1; i <= 7; i++) {
                            %>
                            <td>&nbsp;</td>
                            <%
                                }%>
                        </tr>
                        </tbody>
                    </table>


                </div>
            </div>

        </div>
    </div>
</div>

</div>
<script>
    function del(input) {
        alert(input);
        $.post("/DeleteOrder",
                {
                    orderid: input,
                },
                function (data) {
                    if (data == "1") {
                        alert("删除成功");

                    } else if (data == "0") {
                        alert("删除失败！");
                    } else {
                        alert("你在逗我");
                    }
                    setTimeout(function () {
                        location.href = "orderList.jsp";
                    }, 0);
                });
    }
    ;
</script>

<!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<%--footer引入--%>
<jsp:include page="../divs/div-footer.jsp"></jsp:include>

<script src="../assets/js/amazeui.min.js"></script>
<script src="../assets/js/myjs.js"></script>
<script src="../assets/js/app.js"></script>
</body>
</html>
