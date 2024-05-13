<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.jjang051.jsp05.utils.CookieManager" %>
<%@ page import="com.jjang051.jsp05.connect.JDBCConnect" %>
<%@ page import="com.jjang051.jsp05.utils.ScriptWriter" %>
<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-10
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //db연결 조회해서 resultset에 값 담아서 아래쪽에 뿌리기...
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    System.out.println(userID+"==="+userPW);

    //JDBCConnect jdbcConnect = new JDBCConnect();
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql =  "delete from member where userId = ? and userPw = ?";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    pstmt.setString(2,userPW);

    int result = pstmt.executeUpdate();
    // 행에 영향을 미친 갯수 0이면 하나도 실행이 안돼다.
    // 0보다 크면 쿼리가 실행이 되어서 table에 영향을 미쳤다.
    if(result>0) {
        session.invalidate();
        CookieManager.deleteCookie(response,"loggedID");
        ScriptWriter.alertAndNext(response,"회원탈퇴되었습니다.","index.jsp");
        //out.println("<script>alert("+result+");location.href=\"index.jsp\";</script>");

    }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
