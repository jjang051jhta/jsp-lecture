<%@ page import="java.time.LocalDate" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-08
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LocalDate now = LocalDate.now();
    int year = now.getYear();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="isAdult.jsp" method="get">
        <h2>태어난 년도를 선택해주세요.</h2>
        <select name="age">
            <% for(int i=year;i>year - 120;i--) { %>
                <option value="<%=i%>"><%=i%></option>
            <% } %>
        </select>
        <button>전송</button>
    </form>
    <a href="isAdult.jsp?age=30">성인인증</a>
</body>
</html>
