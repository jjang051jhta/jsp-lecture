<%@ page import="org.mindrot.jbcrypt.BCrypt" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-21
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //같은 비밀번호라고 하더라도 다르게 만들어주는 역할  (레인보우 테이블)
    String salt = BCrypt.gensalt();
    String hashPW = BCrypt.hashpw("1234",salt);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1><%=salt%></h1>
    <h1><%=hashPW%></h1>
</body>
</html>
