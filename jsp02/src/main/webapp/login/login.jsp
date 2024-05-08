<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-08
  Time: 오후 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
    <form action="/jsp02_war_exploded/login-process" method="post">
        <div><input type="text" name="userID"></div>
        <div><input type="password" name="userPW"></div>
        <button>로그인</button>
    </form>
</body>
</html>
