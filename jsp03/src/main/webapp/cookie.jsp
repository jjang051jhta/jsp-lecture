<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-09
  Time: 오전 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>쿠키 cookie</h1>
    <%
        Cookie cookie = new Cookie("myCookie","오감자");
        cookie.setMaxAge(1000*60*24);
        response.addCookie(cookie);
    %>
</body>
</html>
