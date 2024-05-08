<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-08
  Time: 오전 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String userID = request.getParameter("userID");
        String userPW = request.getParameter("userPW");
        String gender = request.getParameter("gender");
        int month = Integer.parseInt(request.getParameter("month"));
        //checkbox는 배열로 받는다.
        String hobby[] = request.getParameterValues("hobby");
        String content = request.getParameter("content").replace("\r\n","<br>");

        String strHobby="";
        for(int i=0;i<hobby.length;i++) {
            strHobby+=hobby[i]+"/";
        }
        out.println(userID);
        out.println("<br>");
        out.println(userPW);
        out.println("<br>");
        out.println(gender);
        out.println("<br>");
        out.println(month);
        out.println("<br>");
        out.println(strHobby);
    %>
    <ul>
        <li><%= userID %></li>
        <li><%= userPW %></li>
        <li><%= gender %></li>
        <li><%= month %></li>
        <li><%= strHobby %></li>
        <li><%= content %></li>
    </ul>
    <hr>
    <ul>
        <li><%= request.getMethod()  %></li>
        <li><%= request.getQueryString()  %></li>
        <li><%= request.getRequestURI()  %></li>

    </ul>
</body>
</html>
