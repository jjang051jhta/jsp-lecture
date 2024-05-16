<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "select * from member";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
%>
<div class="container">
    <h2 class="mt-5 mb-5">MEMBER LIST</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>no</th>
            <th>id</th>
            <th>name</th>
            <th>email</th>
            <th></th>
        </tr>
        </thead>
        <tbody>

            <%
                while(rs.next()) {
                    out.println("<tr>");
                    out.println("<td>"+rs.getInt("no")+"</td>");
                    out.println("<td>"+rs.getString("userid")+"</td>");
                    out.println("<td>"+rs.getString("username")+"</td>");
                    out.println("<td>"+rs.getString("email")+"</td>");
                    out.println("<td><a href=\"../member/admin-delete-member-process.jsp?userID="+rs.getString("userid")+"\" class=\"btn btn-danger\">DEL</a></td>");
                    out.println("</tr>");
                }
            %>
        </tbody>
    </table>
</div>
<%@ include file="../include/footer.jsp" %>
