<%@ page import="model.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <jsp:include page="import/admin.jsp"></jsp:include>
    <title>退出 | Exit</title>
    <style>
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
<body>
<div class="header">
    <div class="am-g">
        <h1>青岛大学2016年学生带班工作系统</h1>
        <p><strong>※PLEASE DO NOT LEAK!※<br/>带班光荣,请勿泄密!</strong></p>
    </div>
    <hr/>
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">

        <jsp:useBean id="user" class="model.Admin"></jsp:useBean>
        <jsp:useBean id="AdminServices" class="service.AdminServices"></jsp:useBean>


        <%
            Admin account = (Admin) session.getAttribute("admin");
            AdminServices.logout(account.getAdminid());
            session.invalidate();//session无效,就是登出
            out.println("退出成功.请好好享受工作后的片刻宁静!<strong><a href='login.jsp'> 返回登陆 </a></strong>.");
        %>
    </div>
    <hr>
    <p>© 2016 <a href="http://www.daddywolf.cn">Daddywolf工作室</a>. Powered by Amaze UI.</p>
</div>
</div>
</body>
</html>
