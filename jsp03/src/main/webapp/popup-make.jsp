<%@ page import="com.jjang051.jsp03.util.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-09
  Time: 오전 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String today = request.getParameter("today");
    System.out.println("today==="+today);
    if(today!=null && today.equals("one")) {
//        Cookie cookie = new Cookie("oneDayCookie","off");
//        cookie.setMaxAge(5);
//        cookie.setPath("/");
//        response.addCookie(cookie);
        CookieManager.createCookie(response,"oneDayCookie","off",60*60*24);
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
