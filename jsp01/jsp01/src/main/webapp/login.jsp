<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-08
  Time: 오후 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID02");
    String userPW = request.getParameter("userPW02");
    if(userID.equals("jjang051") && userPW.equals("1234")) {
        response.sendRedirect("login_success.jsp");
    } else {
        //아닐때 자바스크립트 띄우고 뒤로 보내기...
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
