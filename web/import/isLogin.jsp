<%@ page import="model.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--判断是否已登录——从session里取值,若空,返回index--%>
<%
    Admin user = (Admin) session.getAttribute("admin");
    if (user == null) {
%>
<jsp:forward page="../login/login.jsp"></jsp:forward>
<%
    }
%>
