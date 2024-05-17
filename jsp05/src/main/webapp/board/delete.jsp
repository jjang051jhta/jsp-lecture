<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="com.jjang051.jsp05.utils.ScriptWriter" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-17
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int no =  Integer.parseInt(request.getParameter("no"));
    String sql = "delete from board where no = ?";
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setInt(1, no);
    int result = jdbcConnectionPool.pstmt.executeUpdate();
    if(result>0) {
        ScriptWriter.alertAndNext(response,no+"글이 삭제되었습니다.","../board/list.jsp");
    } else {
        ScriptWriter.alertAndBack
                (response,"알 수 없는 에러가 발생되었습니다. 다시 시도해 주세요.");
    }
    jdbcConnectionPool.close();
%>