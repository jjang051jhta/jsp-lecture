<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.jjang051.jsp05.connect.JDBCConnect" %>
<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%
    //db연결 조회해서 resultset에 값 담아서 아래쪽에 뿌리기...
    String userId = (String)session.getAttribute("userId");
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql =  "select * from member where userId = ?";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,userId);
    ResultSet rs = pstmt.executeQuery();
    String userName="";
    String birth = "";
    int no = 0;
    if(rs.next()) {
        no =  rs.getInt("no");
        userName =  rs.getString("userName");
        birth =  rs.getString("birth");
    }

%>
<div class="container">
<table class="table table-striped">
    <tbody>
        <tr>
            <th scope="row">no</th>
            <td><%=no%></td>
        </tr>
        <tr>
            <th scope="row">id</th>
            <td><%=userId%></td>
        </tr>
        <tr>
            <th scope="row">name</th>
            <td><%=userName%></td>
        </tr>
        <tr>
            <th scope="row">birth</th>
            <td><%=birth%></td>
        </tr>
    </tbody>
</table>
    <a href="delete-member.jsp" class="btn btn-danger">회원탈퇴</a>
</div>
<%@ include file="../include/footer.jsp" %>