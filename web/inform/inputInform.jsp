<%@ page import="model.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="Inform" class="model.Inform"></jsp:useBean>
<jsp:useBean id="informServices" class="service.informServices"></jsp:useBean>
<jsp:setProperty name="Inform" property="*"></jsp:setProperty>
<%
    Admin account = (Admin) session.getAttribute("admin");
    if (informServices.insertInform(Inform, account.getRealName())) {
        out.print("true");
    } else {
        out.print("false");
    }
%>
<jsp:forward page="sendInform.jsp"></jsp:forward>
</body>
</html>
