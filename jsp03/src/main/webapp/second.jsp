<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-09
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>나는 second.jsp이지만 주소는 pageContext.jsp 입니다.</h3>
<h1><%=pageContext.getAttribute("pageContextString") %></h1>
<h1><%=request.getAttribute("requestString") %></h1>
<h1><%=session.getAttribute("sessionString") %></h1>
<h1><%=session.getAttribute("sessionPerson") %></h1>


</body>
</html>
