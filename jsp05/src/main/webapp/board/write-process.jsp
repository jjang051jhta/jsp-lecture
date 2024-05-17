<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.jjang051.jsp05.utils.ScriptWriter" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-16
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    String userName = request.getParameter("userName");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    String password = request.getParameter("password");



    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "INSERT INTO board values(board_seq.nextval,?,?,?,?,?,1,sysdate)";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);

    jdbcConnectionPool.pstmt.setString(1,subject);
    jdbcConnectionPool.pstmt.setString(2,content);
    jdbcConnectionPool.pstmt.setString(3,userID);
    jdbcConnectionPool.pstmt.setString(4,userName);
    jdbcConnectionPool.pstmt.setString(5,password);


    int result = jdbcConnectionPool.pstmt.executeUpdate();
    if(result>0) {
        ScriptWriter.alertAndNext(response,"글이 입력되었습니다.","../board/list.jsp");
    } else {
        ScriptWriter.alertAndBack(response,"오류입니다. 잠시 후 다시 입력해주세요.");
    }
%>