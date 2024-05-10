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
    <h2>id : <%= session.getAttribute("userId") %></h2>
    <h2>name : <%= session.getAttribute("userName") %></h2>
    <a href="logout.jsp">로그아웃</a>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>