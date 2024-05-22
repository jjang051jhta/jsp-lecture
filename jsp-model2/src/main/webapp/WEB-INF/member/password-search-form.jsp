<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-22
  Time: 오후 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">비밀번호 찾기</h2>
    <%--
        servlet만들어서 비밀번호를 랜덤하게 만들어서 보내주고
        DB에다가 기존 비밀번호를 업데이트 해야함...
    --%>
    <form action="../member/password-send" method="post">
        <div class="mb-3">
            <label for="userEmail" class="form-label">USER EMAIL</label>
            <input type="email" class="form-control" id="userEmail" placeholder="새로운 비밀번호를 받을 이메일을 입력하세요." name="userEmail">
        </div>
        <button class="btn btn-primary">비밀번호 재설정</button>
    </form>
</div>
<%@ include file="../include/footer.jsp" %>
