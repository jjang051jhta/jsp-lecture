<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-08
  Time: 오후 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>구구단을 선택하시면 출력해 드립니다.</h1>
    <form action="gugudan-result.jsp" method="get">
    <%-- gugudan-result.jsp?gugudan=3--%>
        <select name="gugudan">
            <% for(int i=2;i<20;i++){ %>
                <option value="<%=i%>"><%=i%>단</option>
            <% } %>
        </select>
        <button>전송</button>
    </form>
    <form action="gugudan-result" method="get">
        <%-- gugudan-result.jsp?gugudan=3--%>
        <select name="gugudan">
            <% for(int i=2;i<20;i++){ %>
            <option value="<%=i%>"><%=i%>단</option>
            <% } %>
        </select>
        <button>전송</button>
    </form>
</body>
</html>
