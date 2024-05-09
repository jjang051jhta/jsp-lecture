<%@ page import="com.jjang051.jsp03.util.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-09
  Time: 오후 3:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    String saveID = request.getParameter("saveID");
    System.out.println(saveID);
    // 쿠키설정해서 saveID에다가 값을 설정해두면 된다.
    if(userID.equals("jjang051") && userPW.equals("1234")){
        session.setAttribute("sessionUserID",userID);
        //로그인 성공
        if(saveID!=null && saveID.equals("yes")) {
            CookieManager.createCookie(response,"memoID",userID,60*60*24*365);
            response.sendRedirect("index.jsp");
            //index에 dkdl
        } else {
            CookieManager.deleteCookie(response,"memoID");
        }
    } else {
        response.sendRedirect("login.jsp");
    }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
