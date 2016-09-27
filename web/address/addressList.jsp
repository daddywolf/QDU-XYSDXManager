<%@ page import="model.Address" %>
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
    <title>校园闪电侠后台管理系统 | 收货地址列表</title>

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
<jsp:useBean id="AddressServices" class="service.AddressServices"></jsp:useBean>

<%
    //实例化daiban_account对象,从session里获取user
    Admin account = (Admin) session.getAttribute("admin");

    //查询所有带班 调用daibanServices.queryAllDaiban();方法获取数据库内所有带班信息,iter迭代输出
    List dbi = AddressServices.queryAllAddress();
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
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">收货地址列表</strong> /
                <small>Address List</small>
            </div>
        </div>

        <hr/>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" class="am-btn am-btn-default"><a href="javascript:newOrder()"><span
                                class="am-icon-plus"></span> 新增收货地址</a>
                        </button>
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核
                        </button>
                    </div>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3">
                <select data-am-selected="{btnSize: 'sm',searchBox: 1}">
                    <optgroup label="按信息类型">
                        <option value="userid">地址ID为</option>
                        <option value="mobile">收货人手机号为</option>
                        <option value="realname">收货人真实姓名为</option>
                    </optgroup>
                </select>
            </div>
            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-input-group am-input-group-sm">
                    <input type="text" class="am-form-field">
          <span class="am-input-group-btn">
            <button class="am-btn am-btn-default" type="button">搜索</button>
          </span>
                </div>
            </div>
        </div>
        <br/>
        <div class="am-g am-u-sm-12" class="am-pre-scrollable ">
            <div class="am-g ">
                <h2 align="center">收货地址列表：共 <%=dbi.size()%> 个收货地址</h2>


                <div class="am-u-sm-12 am-scrollable-horizontal">

                    <table class="table2excel am-table am-table-compact am-table-bd am-text-nowrap am-table-centered am-table-striped am-table-hover admin-content-table ">
                        <thead>

                        <tr><%--表头--%>
                            <th>操作</th>
                            <th>地址ID</th>
                            <th>用户名</th>
                            <th>收件人</th>
                            <th>收件人手机号</th>
                            <th>宿舍楼</th>
                            <th>宿舍号</th>
                        </tr>
                        </thead>
                        <tbody id="orderlist">
                        <%
                            //迭代器迭代输出带班信息
                            while (iter.hasNext()) {
                                Address db = (Address) iter.next();
                        %>
                        <tr>
                            <td>
                                <div class="am-dropdown " data-am-dropdown>
                                    <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
                                            data-am-dropdown-toggle><span class="am-icon-phone"></span> <span
                                            class="am-icon-caret-down"></span></button>
                                    <ul class="am-dropdown-content">
                                        <li><a href="#">1. 修改地址信息</a></li>
                                        <li><a href="javascript:del('<%=db.getUserid()%>')">2. 彻底删除地址</a></li>
                                        <li><a href="tel:<%=db.getMobile()%>">3. 拨打电话</a></li>
                                        <li><a href="sms:<%=db.getMobile()%>">4. 发送短信</a></li>
                                    </ul>
                                </div>
                            </td>

                            <td><%=db.getAddressid()%>
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
                                    if (db.getReceiver() == null || db.getReceiver().equals("")) {
                                        out.print("<span class=\"am-badge am-badge-warning\">未填写</span>");
                                    } else {
                                        out.print(db.getReceiver());
                                    }
                                %>
                            </td>
                            <td>
                                <%
                                    if (db.getMobile() == null || db.getMobile().equals("")) {
                                        out.print("<span class=\"am-badge am-badge-warning\">未填写</span>");
                                    } else {
                                        out.print(db.getMobile());
                                    }
                                %>
                            </td>
                            <td>
                                <%
                                    if (db.getDormitoryBd() == null || db.getDormitoryBd().equals("")) {
                                        out.print("<span class=\"am-badge am-badge-warning\">未填写</span>");
                                    } else {
                                        out.print(db.getDormitoryBd());
                                    }
                                %>
                            </td>
                            <td>
                                <%
                                    if (db.getDormitoryRm() == null || db.getDormitoryRm().equals("")) {
                                        out.print("<span class=\"am-badge am-badge-warning\">未填写</span>");
                                    } else {
                                        out.print(db.getDormitoryRm());
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
