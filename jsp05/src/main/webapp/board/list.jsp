<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-16
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "select * from board  order by regdate desc";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.rs = jdbcConnectionPool.pstmt.executeQuery();
%>


<div class="container">
    <h2 class="mt-5 mb-5">LIST</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>no</th>
            <th>subject</th>
            <th>name</th>
            <th>hit</th>
            <th>date</th>
        </tr>
        </thead>
        <tbody>
        <% while (jdbcConnectionPool.rs.next()) { %>
        <tr>
            <%--form a ajax--%>
            <td><%=jdbcConnectionPool.rs.getInt("no")%></td>
            <td><a href="../board/view.jsp?no=<%=jdbcConnectionPool.rs.getInt("no")%>"><%=jdbcConnectionPool.rs.getString("subject")%></a></td>
            <td><%=jdbcConnectionPool.rs.getString("username")%></td>
            <td><%=jdbcConnectionPool.rs.getInt("hit")%></td>
            <td><%=jdbcConnectionPool.rs.getString("regdate")%></td>
        </tr>
        <%
            }
            jdbcConnectionPool.close();
        %>
        </tbody>
    </table>
    <div class="mt-5 mb-5"><a href="../board/write.jsp" class="btn btn-primary">WRITE</a></div>
</div>
<%@ include file="../include/footer.jsp" %>