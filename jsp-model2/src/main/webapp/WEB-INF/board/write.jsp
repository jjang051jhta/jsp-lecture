<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">글쓰기</h2>
    <form action="../board/write" method="post">
        <input type="hidden" name="userID" value="${sessionMemberDto.userID}">
        <div class="mb-3">
            <label for="userName" class="form-label">USER NAME</label>
            <input type="text" class="form-control" id="userName" placeholder="user name" name="userName">
        </div>
        <div class="mb-3">
            <label for="subject" class="form-label">SUBJECT</label>
            <input type="text" class="form-control" id="subject" placeholder="제목을 쓰세요" name="subject">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">PASSWORD</label>
            <input type="password" class="form-control" id="password" placeholder="password" name="password">
        </div>

        <div class="mb-3">
            <label for="content" class="form-label">CONTENT</label>
            <textarea name="content" id="content" placeholder="내용을 입력하세요." rows="8" class="form-control"></textarea>
        </div>
        <div>
            <button class="btn btn-primary" id="btn-sign">CONFIRM</button>
            <button class="btn btn-secondary" type="reset">RESET</button>
        </div>
    </form>
</div>
<script src="/js/ckeditor.js"></script>
<script>
    ClassicEditor
        .create( document.querySelector( "#content" ) )
        .catch( error => {
            console.error( error );
        } );
</script>
<%@ include file="../include/footer.jsp"%>
