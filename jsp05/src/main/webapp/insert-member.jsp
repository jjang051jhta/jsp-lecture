<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="include/header.jsp" %>
    <h2>회원가입</h2>
    <form action="insert-member-process.jsp" method="post">
        <div>
            <label>
                <span>아이디</span>
                <input type="text" placeholder="아이디 입력" name="userID">
            </label>
        </div>
        <div>
            <label>
                <span>비밀번호</span>
                <input type="password" placeholder="비밀번호" name="userPW">
            </label>
        </div>
        <div>
            <label>
                <span>이름</span>
                <input type="text" placeholder="이름" name="userName">
            </label>
        </div>
        <div>
            <label>
                <span>이름</span>
                <input type="date" placeholder="생일" name="birth">
            </label>
        </div>

        <button>회원가입</button>
        <button type="reset">취소</button>
    </form>
<%@ include file="include/footer.jsp"%>
