<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-10
  Time: 오전 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //동적 로딩
    Class.forName("oracle.jdbc.OracleDriver");
    //오라클 드라이버 로딩해서 연결
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jhta051","1234");
    //conn.setAutoCommit(false);
    System.out.println("db 연결");
    String sql = "insert into member values('jjang052','1234','장동건')";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    int result = pstmt.executeUpdate();
    System.out.println(result);
    //


%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>db연결</h1>
</body>
</html>
