<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">비밀번호 재설정</h2>
    <form action="../member/password-change-process" method="post">
        <div class="mb-3">
            <label for="oldPW" class="form-label">기본 비밀번호</label>
            <input type="password" class="form-control" id="oldPW" placeholder="기존 비밀번호를 입력하세요" name="oldPW">
        </div>
        <div class="mb-3">
            <label for="newPW" class="form-label">새 비밀번호</label>
            <input type="password" class="form-control" id="newPW" placeholder="기존 비밀번호를 입력하세요" name="newPW">
        </div>
        <div class="mb-3">
            <label for="password03" class="form-label">새 비밀번호 확인</label>
            <input type="password" class="form-control" id="password03" placeholder="기존 비밀번호를 입력하세요">
        </div>
        <input type="hidden" name="userID" value="${sessionMemberDto.userID}">
        <button class="btn btn-primary">비밀번호 재설정</button>
    </form>
</div>
<%@ include file="../include/footer.jsp" %>
