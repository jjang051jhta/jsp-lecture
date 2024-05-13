<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="include/header.jsp" %>
    <div class="container">
        <h2>회원가입</h2>

        <form action="insert-member-process.jsp" method="post">
            <div class="mb-3">
                <label for="userID" class="form-label">USER ID</label>
                <input type="text" class="form-control" id="userID" placeholder="user id" name="userID">
            </div>
            <div class="mb-3">
                <label for="userPW" class="form-label">PASSWORD</label>
                <input type="password" class="form-control" id="userPW" placeholder="password" name="userPW">
            </div>
            <div class="mb-3">
                <label for="userName" class="form-label">USER NAME</label>
                <input type="text" class="form-control" id="userName" placeholder="user name" name="userName">
            </div>
            <div class="mb-3">
                <label for="birth" class="form-label">BIRTH</label>
                <input type="date" class="form-control" id="birth" placeholder="select birth day" name="birth">
            </div>
            <div>
                <button class="btn btn-primary">SIGN IN</button>
                <button class="btn btn-outline-primary" type="reset">RESET</button>
            </div>

        </form>
    </div>
<%@ include file="include/footer.jsp"%>
