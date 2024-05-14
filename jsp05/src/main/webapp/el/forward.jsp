<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-14
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>${pageScope.scope}</p>
    <p>${requestScope.scope}</p>
    <p>${sessionScope.scope}</p>
    <p>${applicationScope.scope}</p>
    <hr>
    <p>${scope}</p>
</body>
</html>
