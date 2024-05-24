<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">글쓰기</h2>
    <table class="table table-striped">
        <colgroup>
            <col style="width:80px">
            <col>
            <col style="width:150px">
            <col style="width:80px">
            <col style="width:250px">
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
                    <td><a href="../board/view?no=${boardDto.no}">${boardDto.subject}</a></td>
                    <td>${boardDto.userName}</td>
                    <td>${boardDto.hit}</td>
                    <td>
                        <fmt:parseDate
     value="${boardDto.regDate}" var="changeRegDate" pattern="yyyy-MM-dd" />
                <fmt:formatDate value="${changeRegDate}" pattern="yyyy년MM월dd" />
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="mt-5">
        <a href="../board/write" class="btn btn-primary">WRITE</a>
    </div>
</div>

<%@ include file="../include/footer.jsp"%>
