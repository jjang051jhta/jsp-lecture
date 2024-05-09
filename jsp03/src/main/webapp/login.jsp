<%@ page import="com.jjang051.jsp03.util.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-09
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String memoID = CookieManager.readCookie(request,"memoID");
    String isChecked = "";
    if(!memoID.equals("")) {
       isChecked="checked";
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>로그인</h2>
    <form action="login-process.jsp" method="post">
        <div>
            <label>
                <span>아이디</span>
                <input type="text" name="userID" value="<%=memoID%>" placeholder="user id">
            </label>
            <label>
                <span>아이디 저장</span>
                <input type="checkbox" name="saveID" value="yes" <%=isChecked%>>
            </label>
        </div>
        <div>
            <label>
                <span>패스워드</span>
                <input type="password" name="userPW">
            </label>
        </div>
        <button>로그인</button>
    </form>
</body>
</html>
