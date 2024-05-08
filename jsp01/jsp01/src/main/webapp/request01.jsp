<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-08
  Time: 오전 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>request</h1>
    <!-- a태그로 넘기는 방식은 무조건 get -->
    <a href="request_main.jsp?name=장성호&age=30">request_main.jsp</a>
    <form method="post" action="request_main.jsp">
        <input type="text" name="name" id="name"> <br>
        <input type="number" name="age"> <br>
        <button type="submit">전송04</button>
    </form>
    <form method="get" action="request_main02.jsp">
        <input type="text" name="userID" value="jjang051"> <br>
        <input type="password" name="userPW" value="1234"> <br>
        <label><input type="radio" name="gender" value="male"><span>남자</span></label>
        <label><input type="radio" name="gender" value="female"><span>여자</span></label><br>
        <select name="month">
            <option value="1">01</option>
            <option value="2">02</option>
            <option value="3">03</option>
            <option value="4">04</option>
            <option value="5">05</option>
            <option value="6">06</option>
            <option value="7">07</option>
            <option value="8">08</option>
            <option value="9">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
        </select>
        <br>
        <label><input type="checkbox" name="hobby" value="movie"><span>영화보기</span></label>
        <label><input type="checkbox" name="hobby" value="fishing"><span>낚시</span></label>
        <label><input type="checkbox" name="hobby" value="go"><span>바둑</span></label>
        <label><input type="checkbox" name="hobby" value="tennis"><span>테니스</span></label>
        <br>
        <textarea name="content"></textarea>
        <button type="submit">전송</button>
    </form>
    <form action="login.jsp" method="post">
        <input type="text" placeholder="user id" name="userID02"> <br>
        <input type="password" placeholder="user pw"  name="userPW02"> <br>
        <button>LOGIN</button>
    </form>
</body>
</html>
