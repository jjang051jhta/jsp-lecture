<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.jjang051.jsp05.utils.ScriptWriter" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-16
  Time: 오전 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql =  "delete from member where userId = ?";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    int result = pstmt.executeUpdate();
    if(result>0) {
        ScriptWriter.alertAndNext(response,userID+"님 삭제되었습니다.","../member/list-member.jsp");
    }
%>



