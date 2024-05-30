<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-30
  Time: 오전 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
    <div class="container">
        <h2 class="mt-5 mb-5">LIST</h2>
        <table class="table table-striped">
            <colgroup>
                <col style="width:80px">
                <col>
                <col style="width:150px">
                <col style="width:80px">
                <col style="width:150px">
            </colgroup>
            <thead>
            <tr>
                <th>NO</th>
                <th>SUBJECT</th>
                <th>WRITER</th>
                <th>HIT</th>
                <th>DATE</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${boardList}" var="boardDto" varStatus="loop">
                <tr>
                    <td>${loop.count}</td>
                    <td>${boardDto.subject}</td>
                    <td>${boardDto.userName}</td>
                    <td>${boardDto.hit}</td>
                    <td>${boardDto.regDate}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
<%@ include file="../include/footer.jsp" %>


