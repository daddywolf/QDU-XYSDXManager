<%--
  Created by IntelliJ IDEA.
  User: daddywolf
  Date: 16/2/20
  Time: 上午10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <jsp:include page="../import/admin.jsp"></jsp:include>
    <title>系统登录 | Login Page</title>


    <style><%--定义CSS文件中没有的一些样式--%>
    .header {
        text-align: center;
    }

    .header h1 {
        font-size: 200%;
        color: #333;
        margin-top: 30px;
    }

    .header p {
        font-size: 14px;
        text-align: center;
    }

    p {
        font-size: 14px;
        text-align: center;
    }
    </style>
</head>
<jsp:include page="../import/jump.jsp"></jsp:include>
<body>

<!--[if lte IE 9]>
<div class="am-alert am-alert- " data-am-alert>
    <button type="button" class="am-close">&times;</button>
    <p align="center" class="browsehappy">你正在使用<strong>过时</strong>的浏览器，本系统暂不支持。 请 <a
            href="http://dlsw.baidu.com/sw-search-sp/soft/9d/14744/ChromeStandalone_49.0.2623.75_Setup.1457073636.exe"
            target="_blank">升级到Chrome浏览器</a></p>
</div>
<![endif]-->

<div class="header"> <%--显示在页面上方--%>
    <div class="am-g">
        <h1>校园闪电侠 - 管理员登陆</h1>
        <p><strong>※Be Careful Before You Do Anything!※<br/>细心工作,谨慎操作!</strong></p>
    </div>
    <hr/>
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">

        <div class="am-alert am-alert-success " data-am-alert>  <%--绿色条幅--%>
            <button type="button" class="am-close">&times;</button>
            <p align="center">系统正在测试当中.如果出现异常请<strong><a href="tel:18561538355"> 联系管理员 </a></strong>！</p>
        </div>

        <%--表单,用于接收用户名和密码  开启表单验证  强制接收字符集为UTF-8   POST提交到validate.jsp--%>
        <form class="am-form" action="validate.jsp" name="login" accept-charset="utf-8" method="post" data-am-validator>
            <label for="mobile"></label>
            <div class="am-input-group">
                <span class="am-input-group-label"><i class="am-icon-user am-icon-fw"></i></span>
                <input type="tel" name="mobile" maxlength="11" minlength="11" id="mobile"
                       class="am-form-field">
            </div>
            <label for="password"></label> <%--密码 类型password 最小长度6--%>
            <div class="am-input-group">
                <span class="am-input-group-label"><i class="am-icon-lock am-icon-fw"></i></span>
                <input type="password" name="password" minlength="6" id="password" class="am-form-field">
            </div>


            <br/>
            <div class="am-cf" align="right"><%--右对齐--%> <%--提交按钮及联系管理员超链接--%>
                <input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
                <a href="tel:17753270103"><span class="am-icon-phone"></span> 联系卢老板</a>
            </div>
        </form>
        <hr>
        <%--尾部--%>
        <p class="am-padding-left" align="center">© 2016 <a href="http://www.aischool.cc">青岛柚子极客文化传媒有限公司</a>. Powered by
            Amaze UI.</p>
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
<script src="../assets/js/app.js"></script>
</body>
</html>
