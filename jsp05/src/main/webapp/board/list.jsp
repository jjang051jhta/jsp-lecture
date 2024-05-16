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
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
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
        <% while (rs.next()) { %>
        <tr>
            <td><%=rs.getInt("no")%></td>
            <td><a href="../board/view.jsp"><%=rs.getString("subject")%></a></td>
            <td><%=rs.getString("username")%></td>
            <td><%=rs.getInt("hit")%></td>
            <td><%=rs.getString("regdate")%></td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <div class="mt-5 mb-5"><a href="../board/write.jsp" class="btn btn-primary">WRITE</a></div>
</div>
<%@ include file="../include/footer.jsp" %>