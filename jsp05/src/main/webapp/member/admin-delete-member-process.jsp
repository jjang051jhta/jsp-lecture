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
    //DAO(Database Access Object)  / DTO (Databse Transfer Object)
    // history.back()을 하면 refresh가 같이 발생을 함,,,, 크롬도 막힌거 같음...
    String userID = request.getParameter("userID");
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql =  "delete from member where userId = ?";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setString(1,userID);
    int result = jdbcConnectionPool.pstmt.executeUpdate();
    if(result>0) {
        //ScriptWriter.alertAndNext(response,userID+"님 삭제되었습니다.","../member/list-member.jsp");
        ScriptWriter.alertAndBack(response,userID+"님 삭제되었습니다.");
    }
    jdbcConnectionPool.close();
%>




