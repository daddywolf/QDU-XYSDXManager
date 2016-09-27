<%@ page import="model.Admin" %><%--
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
    <title>校园闪电侠后台管理系统 | 发送通知</title>

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

<jsp:useBean id="informServices" class="service.informServices"></jsp:useBean>

<%
    Admin account = (Admin) session.getAttribute("admin");
//    out.print(account.getStuID());
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
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">发送通知</strong> /
                <small>Send Inform</small>
            </div>
        </div>

        <hr/>

        <div class="am-alert am-alert-warning " data-am-alert>
            <button type="button" class="am-close">&times;</button>
            <p align="center">注意:发送通知前请确认通知内容准确无误.删除通知请联系<a href="tel:17753270103">卢老板</a>.</p>
        </div>

        <div class="am-g" class="am-pre-scrollable">

            <div class="am-u-md-12 am-u-md-pull-12">
                <form class="am-form am-form-horizontal" action="inputInform.jsp"
                      name="inform"><%--目前是get方式提交表单,有风险,改!--%>

                    <div class="am-form-group">
                        <label for="publisher" class="am-u-sm-3 am-form-label">姓名*</label>
                        <div class="am-u-sm-9">
                            <input type="text" id="publisher" name="publisher" placeholder="请在此处填写发送人姓名"
                                   value="<%=account.getRealName()%>" readonly required><%--这个地方有点小bug,容易造成csrf攻击--%>
                        </div>
                    </div>

                    <div class="am-form-group ">
                        <label for="title" class="am-u-sm-3 am-form-label">标题*</label>
                        <div class="am-u-sm-9">
                            <input type="text" id="title" name="title" placeholder="请在此处填写通知标题" required>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="content" class="am-u-sm-3 am-form-label">内容*</label>
                        <div class="am-u-sm-9">
                            <textarea class="" rows="10" id="content" name="content" id="content"
                                      placeholder="请在此处填写通知内容" required></textarea><%--xssBug已经修复--%>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <button type="submit" class="am-btn am-btn-primary">发送通知</button>
                            <button type="reset" class="am-btn am-btn-default am-fr">重 置</button>
                        </div>
                    </div>
                </form>
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
