<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.jjang051.jsp05.dto.BoardDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-16
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<%
    //model2  jsp에서 java code 빼기...
    int intPage = 1;
    String strNo = request.getParameter("page");
    if(strNo!=null) {
        intPage = Integer.parseInt(request.getParameter("page"));
    }
    int perPage = 10;
    int start = (intPage - 1)*perPage+1;
    int end = start+perPage;

    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    //String sql = "select * from board where no between 1 and 10 order by regdate desc";
    String sql = "SELECT * FROM " +
            "(SELECT rownum AS num , b.* from" +
                "(SELECT * FROM board ORDER BY no DESC) b" +
            ") WHERE num BETWEEN ? AND ?";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setInt(1,start);
    jdbcConnectionPool.pstmt.setInt(2,end);

    jdbcConnectionPool.rs = jdbcConnectionPool.pstmt.executeQuery();
    List<BoardDto> boardDtoList = new ArrayList<>();
    while (jdbcConnectionPool.rs.next()) {
        BoardDto boardDto = new BoardDto();
        boardDto.setNo(jdbcConnectionPool.rs.getInt("no"));
        boardDto.setSubject(jdbcConnectionPool.rs.getString("subject"));
        boardDto.setContent(jdbcConnectionPool.rs.getString("content"));
        boardDto.setUserID(jdbcConnectionPool.rs.getString("userid"));
        boardDto.setUserName(jdbcConnectionPool.rs.getString("username"));
        boardDto.setPassword(jdbcConnectionPool.rs.getString("password"));
        boardDto.setRegDate(jdbcConnectionPool.rs.getString("regdate"));
        boardDto.setHit(jdbcConnectionPool.rs.getInt("hit"));
        boardDtoList.add(boardDto);
    }
    request.setAttribute("boardDtoList",boardDtoList);
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
        <%--<% while (jdbcConnectionPool.rs.next()) { %>
        <tr>
            &lt;%&ndash;form a ajax&ndash;%&gt;
            <td><%=jdbcConnectionPool.rs.getInt("no")%></td>
            <td><a href="../board/view.jsp?no=<%=jdbcConnectionPool.rs.getInt("no")%>"><%=jdbcConnectionPool.rs.getString("subject")%></a></td>
            <td><%=jdbcConnectionPool.rs.getString("username")%></td>
            <td><%=jdbcConnectionPool.rs.getInt("hit")%></td>
            <td><%=jdbcConnectionPool.rs.getString("regdate")%></td>
        </tr>
        <%
            }
            jdbcConnectionPool.close();
        %>--%>
        <c:forEach var="boardDto" items="${boardDtoList}" begin="0" end="9" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>
                    <a href="../board/view.jsp?no=${boardDto.no}">
                        ${boardDto.subject}
                    </a>
                </td>
                <td>${boardDto.userName}</td>
                <td>${boardDto.hit}</td>
                <td>${boardDto.regDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <c:forEach var="boardDto"  begin="0" end="9" varStatus="loop">
                <c:choose>
                    <c:when test="${param.page == loop.count}">
                        <li class="page-item active"><span class="page-link" >${loop.count}</span></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link"
                               href="../board/list.jsp?page=${loop.count}">${loop.count}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </nav>
    <% jdbcConnectionPool.close(); %>
    <div class="mt-5 mb-5"><a href="../board/write.jsp" class="btn btn-primary">WRITE</a></div>
</div>
<%@ include file="../include/footer.jsp" %>