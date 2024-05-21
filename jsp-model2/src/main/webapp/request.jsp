<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-21
  Time: 오후 4:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>${pageScope.keyNum}</h1>
    <h1>${requestScope.keyNum}</h1>
    <h1>${sessionScope.keyNum}</h1>
    <h1>${applicationScope.keyNum}</h1>
</body>
</html>
