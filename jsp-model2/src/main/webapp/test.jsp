<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-21
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int num = 10;
    pageContext.setAttribute("keyNum","pageContext");
    request.setAttribute("keyNum","request");
    session.setAttribute("keyNum","session");
    application.setAttribute("keyNum","application");
    //RequestDispatcher dispatcher = request.getRequestDispatcher("request.jsp");
    //dispatcher.forward(request,response);



%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1><%=num%></h1>
    <h1>${pageScope.keyNum}</h1>
    <h1>${requestScope.keyNum}</h1>
    <h1>${sessionScope.keyNum}</h1>
    <h1>${applicationScope.keyNum}</h1>
    <a href="request.jsp">request</a>
</body>
</html>
