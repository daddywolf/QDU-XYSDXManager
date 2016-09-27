<%@ page import="model.Admin" %>
<%@ page import="model.Order" %>
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
    <script src="../assets/js/myjs.js"></script>
    <script src="../assets/js/jPages/jquery-1.8.2.min.js"></script>
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

    <title>校园闪电侠后台管理系统 | 订单列表</title>


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
<jsp:useBean id="OrderServices" class="service.OrderServices"></jsp:useBean>

<%
    //实例化daiban_account对象,从session里获取user
    Admin account = (Admin) session.getAttribute("admin");

    //查询所有带班 调用daibanServices.queryAllDaiban();方法获取数据库内所有带班信息,iter迭代输出
    List dbi = OrderServices.queryAllOrder();
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
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">订单列表</strong> /
                <small>Order List</small>
            </div>
        </div>

        <hr/>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" class="am-btn am-btn-default"><a href="javascript:newOrder()"><span
                                class="am-icon-plus"></span> 新增订单</a>
                        </button>
                        <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核
                        </button>
                    </div>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3">
                <select data-am-selected="{btnSize: 'sm',searchBox: 1}">
                    <optgroup label="按信息类型">
                        <option value="mobile">订单号为</option>
                        <option value="mobile">收货人手机号为</option>
                        <option value="receiver">收货人姓名为</option>
                        <option value="courier">快递员姓名为</option>
                    </optgroup>
                    <optgroup label="按订单状态">
                        <option value="0">未付款</option>
                        <option value="1">分配中</option>
                        <option value="2">派送中</option>
                        <option value="3">已完成</option>
                        <option value="4">已取消</option>
                        <option value="5">已删除</option>
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
                <h2 align="center">订单列表：共 <%=dbi.size()%> 个订单</h2>


                <div class="am-u-sm-12 am-scrollable-horizontal">

                    <table class="table2excel1 am-table am-table-compact am-table-bd am-text-nowrap am-table-centered am-table-striped am-table-hover admin-content-table ">
                        <thead>

                        <tr><%--表头--%>
                            <th>操作</th>
                            <th>订单号</th>
                            <th>下单用户名</th>
                            <th>快递点</th>
                            <th>取货码</th>
                            <th>快递员姓名</th>
                            <th>订单状态</th>
                            <th>下单时间</th>
                            <th>订单修改时间</th>
                            <th>订单完成时间</th>
                            <th>宿舍楼</th>
                            <th>宿舍号</th>
                            <th>收货人姓名</th>
                            <th>收货人手机号</th>
                            <th>总价</th>
                        </tr>
                        </thead>
                        <tbody id="orderlist">
                        <%
                            //迭代器迭代输出带班信息
                            while (iter.hasNext()) {
                                Order db = (Order) iter.next();
                        %>
                        <tr>
                            <td>
                                <div class="am-dropdown " data-am-dropdown>
                                    <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
                                            data-am-dropdown-toggle><span class="am-icon-phone"></span> <span
                                            class="am-icon-caret-down"></span></button>
                                    <ul class="am-dropdown-content">
                                        <li><a href="javascript:changeOrder('<%=db.getOrderid()%>')">1. 修改订单信息</a></li>
                                        <li><a href="javascript:del('<%=db.getOrderid()%>')">2. 彻底删除订单</a></li>
                                    </ul>
                                </div>
                            </td>

                            <td><%=db.getOrderid()%>
                            </td>
                            <td><%
                                if (db.getUsername() == null || db.getUsername().equals("")) {
                                    out.print("<span class=\"am-badge am-badge-warning\">未填写</span>");
                                } else {
                                    out.print(db.getUsername());
                                }
                            %>
                            </td>
                            <td>
                                <%=db.getExpressAdd()%>
                            </td>
                            <td>
                                <%=db.getGoodsCode()%>
                            </td>
                            <td><%=db.getCouriername()%>
                            </td>
                            <td>
                                <%
                                    //订单状态
                                    if (db.getStatus() == 0) {
                                %> <span
                                    class="am-badge am-badge-warning">未付款</span><%} else if (db.getStatus() == 1) {%> <span
                                    class="am-badge am-badge-primary">分配中</span><%} else if (db.getStatus() == 2) {%> <span
                                    class="am-badge am-badge-secondary">派送中</span><%} else if (db.getStatus() == 3) {%> <span
                                    class="am-badge am-badge-success">已完成</span><%} else if (db.getStatus() == 4) {%> <span
                                    class="am-badge am-badge-warning">已取消</span><%} else if (db.getStatus() == 5) {%> <span
                                    class="am-badge am-badge-danger">已删除</span><%} else {%> <span
                                    class="am-badge am-badge-danger">ERROR</span><%
                                }

                            %>
                            </td>
                            <td>
                                <%
                                    if (db.getCreateTime() == null) {
                                        out.print("无");
                                    } else {
                                        out.print(db.getCreateTime());
                                    }
                                %>
                            </td>
                            <td>
                                <%
                                    if (db.getChangeTime() == null) {
                                        out.print("无");
                                    } else {
                                        out.print(db.getChangeTime());
                                    }
                                %>
                            </td>
                            <td>
                                <%
                                    if (db.getCompleteTime() == null) {
                                        out.print("无");
                                    } else {
                                        out.print(db.getCompleteTime());
                                    }
                                %>
                            </td>
                            <td>
                                <%=db.getDormitoryBd()%>
                            </td>
                            <td>
                                <%=db.getDormitoryRm()%>
                            </td>
                            <td>
                                <%=db.getReceiver()%>
                            </td>
                            <td>
                                <%=db.getMobile()%>
                            </td>
                            <td>
                                <%=db.getTotal_fee()%>
                            </td>
                        </tr>

                        <%
                            }
                        %>
                        <tr>
                            <%--循环生成空行--%>
                            <%
                                for (int i = 1; i <= 15; i++) {
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
    function changeOrder(input) {
        var iWidth = 420;
        var iHeight = 500;
        var iTop = (window.screen.height - iHeight) / 2;
        var iLeft = (window.screen.width - iWidth) / 2;
        window.open('changeOrder.jsp?orderid=' + input, 'newwindow', "AlwaysRaised=yes,Toolbar=no,Location=no,Direction=no,Resizeable=no,Width=" + iWidth + " ,Height=" + iHeight + ",top=" + iTop + ",left=" + iLeft);
    }
</script>

<!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<%--footer引入--%>
<jsp:include page="../divs/div-footer.jsp"></jsp:include>

<script src="../assets/js/amazeui.min.js"></script>
<script src="../assets/js/app.js"></script>
</body>
</html>
