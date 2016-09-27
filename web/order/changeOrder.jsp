<%@ page import="model.Order" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: daddywolf
  Date: 16/3/28
  Time: 上午9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--
  Created by IntelliJ IDEA.
  User: 姜志鹏
  Date: 2016/4/8
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="utf-8">
    <%--设置jsp字符集--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="这是一个 index 页面">
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

    <title>修改订单信息</title>

    <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
</head>
<jsp:useBean id="OrderServices" class="service.OrderServices"></jsp:useBean>
<jsp:include page="../import/isLogin.jsp"></jsp:include>
<%
    String orderid = request.getParameter("orderid");
    System.out.println(orderid);

    List order = OrderServices.queryOrder(orderid);
    Iterator it = order.iterator();
%>
<body>


<div class="am-cf admin-main">
    <div class="am-panel am-panel-default">
        <div class="am-panel-bd">
            <p align="center"><strong>修改订单信息</strong></p>
            <div class="am-btn-group am-btn-group-xs"><%--弹窗--%>

                <%--doc-modal-1--%>
                <div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
                    <div class="am-modal-dialog">
                        <div class="am-modal-hd">查询用户ID
                            <a href="javascript: void(0)" onclick="document.getElementById('idnumber1').value=''"
                               class="am-close am-close-spin"
                               data-am-modal-close>&times;</a><%--关闭按钮--%>
                        </div>
                        <div class="am-modal-bd">
                            <form class="am-form" data-am-validator>
                                <label>请输入用户真实姓名或手机号</label><%--调用的方法在页面底部的javascript--%>
                                <input type="text" placeholder="点击文本框可清空"
                                       onclick="document.getElementById('idnumber1').value=''" maxlength="11"
                                       id="idnumber1"><br/>
                                <span id="showStu"></span>
                                <div class="am-cf" align="center">
                                    <input type="button" value="查 询" id="querybtn1"
                                           class="am-btn am-btn-primary am-btn-sm">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <%--doc-modal-2--%>
                <div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-2">
                    <div class="am-modal-dialog">
                        <div class="am-modal-hd">查询快递员ID
                            <a href="javascript: void(0)" onclick="document.getElementById('idnumber2').value=''"
                               class="am-close am-close-spin"
                               data-am-modal-close>&times;</a><%--关闭按钮--%>
                        </div>
                        <div class="am-modal-bd">
                            <form class="am-form" data-am-validator>
                                <label>请输入快递员真实姓名或手机号</label><%--调用的方法在页面底部的javascript--%>
                                <input type="text" placeholder="点击文本框可清空"
                                       onclick="document.getElementById('idnumber2').value=''" maxlength="11"
                                       id="idnumber2"><br/>
                                <span id="showStu"></span>
                                <div class="am-cf" align="center">
                                    <input type="button" value="查 询" id="querybtn2"
                                           class="am-btn am-btn-primary am-btn-sm">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <form class="am-form am-form-horizontal" action="#" method="post" data-am-validator>

                <%
                    if (it.hasNext()) {
                        Order db = (Order) it.next();
                %>
                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">订单号</label>
                    <div class="am-u-sm-9">
                        <input type="text" name="orderid" id="orderid" readonly placeholder="自动生成,不可手工填写"
                               value="<%=orderid%>">
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label"><a
                            data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 300, height: 250}">用户ID</a></label>
                    <div class="am-u-sm-9">
                        <input type="tel" name="userid" id="userid" required placeholder="请查询后填写"
                               value="<%=db.getUserid()%>">
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">快递点</label>
                    <div class="am-u-sm-9">
                        <input type="text" name="expressAdd" id="expressAdd" required placeholder="请严格按照格式输入"
                               value="<%=db.getExpressAdd()%>">
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">取货码</label>
                    <div class="am-u-sm-9">
                        <input type="tel" name="goodsCode" id="goodsCode" required placeholder="一般为数字,请仔细填写"
                               value="<%=db.getGoodsCode()%>">
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">备注</label>
                    <div class="am-u-sm-9">
                        <input type="text" name="others" id="others" placeholder="可不填" value="<%=db.getOthers()%>">
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label"><a
                            data-am-modal="{target: '#doc-modal-2', closeViaDimmer: 0, width: 300, height: 250}">快递员ID</a></label>
                    <div class="am-u-sm-9">
                        <input type="tel" name="courierid" id="courierid" placeholder='请查询后填写,不填即为"未分配"'
                               value="<%=db.getCourierid()%>">
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">订单状态</label>
                    <div class="am-u-sm-9">
                        <input type="radio" name="status" id="0"
                               value="0" <%if (db.getStatus()==0){out.print("checked");}%>>未分配&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="status" id="1"
                               value="1" <%if (db.getStatus()==1){out.print("checked");}%>>分配中&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="status" id="2"
                               value="2" <%if (db.getStatus()==2){out.print("checked");}%>>派送中&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="status" id="3"
                               value="3" <%if (db.getStatus()==3){out.print("checked");}%>>已完成&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="status" id="4"
                               value="4" <%if (db.getStatus()==4){out.print("checked");}%>>已取消&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="status" id="5"
                               value="5" <%if (db.getStatus()==5){out.print("checked");}%>>已删除&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">宿舍楼</label>
                    <div class="am-u-sm-9">
                        <input type="tel" name="dormitoryBd" id="dormitoryBd" placeholder="请严格按照格式输入"
                               value="<%=db.getDormitoryBd()%>">
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">宿舍号</label>
                    <div class="am-u-sm-9">
                        <input type="tel" name="dormitoryRm" id="dormitoryRm" placeholder="一般为数字,请仔细填写"
                               value="<%=db.getDormitoryRm()%>">
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">收货人姓名</label>
                    <div class="am-u-sm-9">
                        <input type="tel" name="receiver" id="receiver" placeholder="请仔细填写"
                               value="<%=db.getReceiver()%>">
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">收货人手机号</label>
                    <div class="am-u-sm-9">
                        <input type="tel" name="mobile" id="mobile" maxlength="11" minlength="11"
                               value="<%=db.getMobile()%>"
                               placeholder="11位数字,请仔细填写">
                    </div>
                </div>

                <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label">总金额</label>
                    <div class="am-u-sm-9">
                        <input type="tel" name="total_fee" id="total_fee" placeholder="以分为单位,1元请输入100,2元请输入200"
                               value="<%=db.getTotal_fee()%>">
                    </div>
                </div>

                <%
                    }
                %>

                <div class="am-form-group">
                    <div class="am-u-sm-9 am-u-sm-push-3">
                        <button type="submit" class="am-btn am-btn-primary">保存修改</button>
                        <button type="reset" class="am-btn am-btn-default am-fr">重 置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
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
