<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-27
  Time: 오전 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">글 목록</h2>
    <table class="table table-striped">
        <colgroup>
            <col>
            <col>
            <col>
            <col>
        </colgroup>

        <tbody>
             <tr>
                <th>SUBJECT</th>
                <td colspan="3">${boardDto.subject}</td>
            </tr>
             <tr>
                 <th>WRITER</th>
                 <td colspan="3">${boardDto.userName}</td>
             </tr>
             <tr>
                 <th>REGDATE</th>
                 <td>${boardDto.regDate}</td>
                 <th>HIT</th>
                 <td>${boardDto.hit}</td>
             </tr>
             <tr>
                 <th>CONTENT</th>
                 <td colspan="3" class="content">${boardDto.content}</td>
             </tr>
        </tbody>
    </table>
    <div class="mt-5">
        <a href="../board/write" class="btn btn-primary">WRITE</a>
        <a href="../board/reply?regroup=${boardDto.regroup}&relevel=${boardDto.relevel}&restep=${boardDto.restep}" class="btn btn-primary">REPLY</a>
        <a href="../board/delete?no=${boardDto.no}" class="btn btn-primary">DELETE</a>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>
