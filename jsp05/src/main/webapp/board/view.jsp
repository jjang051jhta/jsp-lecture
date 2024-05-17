<%@ page import="com.jjang051.jsp05.connect.JDBCConnect" %>
<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-17
  Time: 오전 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%
    // front에서 변수 전달하고 서버에서 받아서 db처리
    int no = 0;
    String strNo = request.getParameter("no");
    if (strNo != null) {
        no = Integer.parseInt(request.getParameter("no"));
    }

    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    boolean isUpdate = true;
    String visitedCookieValue = CookieManager.readCookie(request, "visitedCookie");
    if (visitedCookieValue.isBlank()) {
        CookieManager.createCookie(response, "visitedCookie", strNo, 60 * 60 * 24);
    } else {
        // 13/12/3/1/2 한번 방문했음
        if(visitedCookieValue.contains(strNo)) {
            isUpdate=false;
        } else {
            isUpdate=true;
            CookieManager.deleteCookie(response,"visitedCookie");
            CookieManager.createCookie(response,"visitedCookie",
                    visitedCookieValue+"/"+strNo,60*60*24);
        }
    }

    if (isUpdate) {
        String updateSql = "update board set hit = hit + 1 where no = ?";
        jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(updateSql);
        jdbcConnectionPool.pstmt.setInt(1, no);
        jdbcConnectionPool.pstmt.executeUpdate();
    }

    String sql = "select * from board where no = ?";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setInt(1, no);
    jdbcConnectionPool.rs = jdbcConnectionPool.pstmt.executeQuery();


%>
<div class="container">
    <h2 class="mt-5 mb-5">VIEW</h2>
    <table class="table table-striped">
        <tbody>
        <% if (jdbcConnectionPool.rs.next()) { %>
        <tr>
            <td>제목</td>
            <td colspan="3"><%=jdbcConnectionPool.rs.getString("subject")%>
            </td>
        </tr>
        <tr>
            <td>글쓴이</td>
            <td colspan="3"><%=jdbcConnectionPool.rs.getString("username")%>
            </td>
        </tr>
        <tr>
            <td>날짜</td>
            <td><%=jdbcConnectionPool.rs.getString("regdate")%>
            </td>
            <td>조회수</td>
            <td><%=jdbcConnectionPool.rs.getInt("hit")%>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" class="content">
                <%=jdbcConnectionPool.rs.getString("content")%>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <div class="mt-5 mb-5">
        <a href="../board/write.jsp" class="btn btn-primary">WRITE</a>
        <a href="../board/list.jsp" class="btn btn-primary mx-2">LIST</a>
    </div>
    <% jdbcConnectionPool.close(); %>
</div>
<%@ include file="../include/footer.jsp" %>
