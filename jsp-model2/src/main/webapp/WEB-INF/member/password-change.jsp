<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">비밀번호 재설정</h2>
    <form action="../member/password-change" method="post" id="password-change-form">
        <div class="mb-3">
            <label for="oldPW" class="form-label">기존 비밀번호</label>
            <input type="password" class="form-control" id="oldPW" placeholder="기존 비밀번호를 입력하세요" name="oldPW">
        </div>
        <div class="mb-3">
            <label for="newPW" class="form-label">새 비밀번호</label>
            <input type="password" class="form-control" id="newPW" placeholder="새로운 비밀번호를 입력하세요" name="newPW">
        </div>
        <div class="mb-3">
            <label for="newPWConfirm" class="form-label">새 비밀번호 확인</label>
            <input type="password" class="form-control" id="newPWConfirm" placeholder="새로운 비밀번호를 한번더 입력하세요">
            <div class="invalid-feedback">글자 작게 나옴</div>
        </div>
        <input type="hidden" name="userID" value="${sessionMemberDto.userID}">
        <button class="btn btn-primary" id="btn-send" type="button">비밀번호 재설정</button>
    </form>
</div>
<script>
    let isPasswordValid=false;
    $("#newPWConfirm").on("keyup",function(){
        if($("#newPW").val()!=$(this).val()) {
            //console.log("다릅니다");
            $(".invalid-feedback").show();
            $(".invalid-feedback").text("password가 같지 않습니다.");
            isPasswordValid=false;
        } else {
            console.log("같습니다");
            $(".invalid-feedback").hide();
            $(".invalid-feedback").text("");
            isPasswordValid=true;
        }
    });

    $("#btn-send").on("click",function() {
        if(isPasswordValid) {
            $("#password-change-form").submit();
        } else {
           alert("새로운 비밀번호가 맞지 않습니다.");
           return false;
        }
    })
</script>
<%@ include file="../include/footer.jsp" %>
