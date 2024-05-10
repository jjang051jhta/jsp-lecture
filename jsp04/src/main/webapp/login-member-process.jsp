<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-10
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn =
    DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jhta051","1234");
    String sql = "select * from member where userId = ? and userPw = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    pstmt.setString(2,userPW);
    ResultSet rs = pstmt.executeQuery();
    if(rs.next()) {
        //로그인 됐음
        String userId = rs.getString("userid");
        String userName = rs.getString("username");
        //System.out.println(userId+"=="+userName);
        session.setAttribute("userId",userId);
        session.setAttribute("userName",userName);
        response.sendRedirect("index.jsp");
    }

%>


<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
