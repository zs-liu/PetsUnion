<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="">
    <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragrma","no-cache");
response.setDateHeader("Expires",0);
%>

<head>
</head>

<body>
    <%
    session.invalidate();
    %>
    <jsp:forward page="index.jsp"/>
</body>
</html>