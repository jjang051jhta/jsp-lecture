<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-08
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        out.println("이름 : "+name+"<br>");
        out.println("나이 : "+age+"<br>");

    %>
</body>
</html>
