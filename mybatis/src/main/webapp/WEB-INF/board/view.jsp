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
            <col style="width:15%">
            <col style="width:35%">
            <col style="width:15%">
            <col style="width:35%">
        </colgroup>

        <tbody>
            <tr>
                <td>SUBJECT</td>
                <td colspan="3">${boardDto.subject}</td>
            </tr>
            <tr>
                <td>WRITER</td>
                <td colspan="3">${boardDto.userName}</td>
            </tr>
            <tr>
                <td>DATE</td>
                <td>${boardDto.regDate}</td>
                <td>VIEW</td>
                <td>${boardDto.hit}</td>

            </tr>
            <tr>
                <td>CONTENT</td>
                <td colspan="3">${boardDto.content}</td>
            </tr>
        </tbody>
    </table>
    <div class="mt-5 mb-5">
        <a href="../board/reply" class="btn btn-danger">REPLY</a>
        <a href="../board/delete?no=${boardDto.no}" class="btn btn-danger">DELETE</a>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>


