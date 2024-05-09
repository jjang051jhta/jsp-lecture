<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-09
  Time: 오전 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>서버에 저장 request, session</h2>
    <h2>클라이언트에 저장 cookie</h2>
    <%
        Cookie cookies[] = request.getCookies();
        for(int i=0;i<cookies.length;i++) {
            out.println(cookies[i].getName()+":"+cookies[i].getValue());
        }
    %>
</body>
</html>
