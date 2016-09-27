<%--
  Created by IntelliJ IDEA.
  User: daddywolf
  Date: 16/3/29
  Time: 上午4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加订单</title>
</head>
<% //设置编码格式
    request.setCharacterEncoding("UTF-8");
%>
<body>
<jsp:useBean id="OrderServices" class="service.OrderServices"></jsp:useBean>
<jsp:useBean id="Order" class="model.Order"></jsp:useBean>
<jsp:setProperty name="Order" property="*"/>
<jsp:include page="../import/isLogin.jsp"></jsp:include>
<%
    if (OrderServices.newOrder(Order)) {
%>
<script>alert("添加订单成功!");
window.opener = null;
window.open('', '_self');
window.close();</script>
<%
} else {
%>
<script>alert("添加订单失败!");
window.opener = null;
window.open('', '_self');
window.close();</script>
<%
    }

%>
</body>
</html>
