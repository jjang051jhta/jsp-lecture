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
    String userEmail = "";
    String birth = "";
    String address = "";
    int postCode=0;
    int no = 0;
    if(rs.next()) {
        no =  rs.getInt("no");
        userName =  rs.getString("userName");
        userEmail =  rs.getString("email");
        birth =  rs.getString("birth");
        postCode = rs.getInt("postcode");
        address = rs.getString("address")+" "+rs.getString("address_detail");

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
            <td>${userId}</td>
        </tr>
        <tr>
            <th scope="row">name</th>
            <td>${userName}</td>
        </tr>
        <tr>
            <th scope="row">email</th>
            <td><%=userEmail%></td>
        </tr>
        <tr>
            <th scope="row">postcode</th>
            <td><%=postCode%></td>
        </tr>
        <tr>
            <th scope="row">address</th>
            <td><%=address%></td>
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