<%@ page import="com.jjang051.jsp04.utils.CookieManager" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<h2>id : <a href="info.jsp"><%= session.getAttribute("userId") %></a></h2>
<%--    <h2>name : <%= session.getAttribute("userName") %></h2>--%>
    <a href="insert-member.jsp">회원가입</a>
    <a href="login.jsp">로그인</a>
    <a href="logout.jsp">로그아웃</a>

</body>
</html>