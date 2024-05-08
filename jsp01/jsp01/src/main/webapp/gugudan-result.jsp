<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-08
  Time: 오후 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int dan =
Integer.parseInt(request.getParameter("gugudan"));
%>
<html>
<head>
    <title><%=dan%>을 출력합니다.</title>
</head>
<body>
    <h2><%=dan%>단</h2>
    <%-- taglib--%>
<ul>
    <% for(int i=1;i<10;i++) { %>
        <li><%=dan%>x<%=i%>=<%=dan*i%></li>
    <% } %>
</ul>
</body>
</html>
