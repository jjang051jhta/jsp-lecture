<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
    <div class="container">
        <form action="delete-member-process.jsp" method="post">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Password</label>
                <input type="password" class="form-control" id="exampleFormControlInput1" placeholder="password" name="userPW">
            </div>
            <input type="hidden" name="userID" value="<%=session.getAttribute("userId")%>">
            <button class="btn btn-danger">회원탈퇴</button>
        </form>
    </div>
<%@ include file="../include/footer.jsp" %>
