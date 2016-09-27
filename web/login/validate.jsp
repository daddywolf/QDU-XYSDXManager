<%@ page import="model.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <jsp:include page="../import/admin.jsp"></jsp:include>
    <title>系统登录 | Login Page</title>

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
        <h1>校园闪电侠 - 管理员登陆</h1>
        <p><strong>※Be Careful Before You Do Anything!※<br/>细心工作,谨慎操作!</strong></p>
    </div>
    <hr/>
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">

        <jsp:useBean id="admin" class="model.Admin"></jsp:useBean>
        <jsp:useBean id="AdminServices" class="service.AdminServices"></jsp:useBean>
        <jsp:useBean id="md5" class="encrypt.md5"></jsp:useBean>
        <jsp:setProperty name="admin" property="*"/>

        <%
            if (AdminServices.valiUser(admin)) {
                out.println("登陆成功! 欢迎您:" + admin.getRealName() + "!<strong><a href='../admin-index.jsp'> 进入系统 </a></strong>");
                session.removeAttribute("admin");
                session.setAttribute("admin", admin);
                Admin account = (Admin) session.getAttribute("admin");
                AdminServices.login(account.getAdminid());

            } else {
                out.println("登录失败,请检查你的密码是否正确.<strong><a href='login.jsp'> 返回 </a></strong>.");
                session.removeAttribute("admin");
            }
        %>
    </div>
    <hr>
    <p class="am-padding-left" align="center">© 2016 <a href="http://www.aischool.cc">青岛柚子极客文化传媒有限公司</a>. Powered by
        Amaze UI.</p>
</div>
</div>
</body>
</html>
