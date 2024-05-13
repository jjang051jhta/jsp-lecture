<%@ page import="com.jjang051.jsp05.utils.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-10
  Time: 오전 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String loggedID = CookieManager.readCookie(request,"loggedID");
    String isChecked ="";
    if(!loggedID.equals("")) {
        isChecked="checked";
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>로그인</h2>
<form action="login-member-process.jsp" method="post">
    <div>
        <label>
            <span>아이디</span>
            <input type="text" placeholder="아이디 입력" name="userID"
                   value="<%=loggedID%>">
        </label>
    </div>
    <div>
        <label>
            <span>비밀번호</span>
            <input type="password" placeholder="비밀번호" name="userPW">
        </label>
    </div>
    <div>
        <label>
            <span>아이디 저장</span>
            <input type="checkbox" name="saveID" value="yes" <%=isChecked%>>
        </label>
    </div>

    <button>로그인</button>
    <button type="reset">취소</button>
</form>
</body>
</html>
