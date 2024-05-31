<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<main class="form-signin w-100 m-auto">
    <form action="../member/login" method="post">
        <%-- <img class="mb-4" src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">--%>
        <h2 class="h3 mb-3 fw-normal">LOGIN</h2>
        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="userID"
                   value="${cookie.loggedID.value}">
            <label for="floatingInput">User ID</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="userPW">
            <label for="floatingPassword">Password</label>
        </div>

        <div class="form-check text-start my-3">
            <input class="form-check-input" type="checkbox" id="flexCheckDefault" name="saveID"
                   value="yes"
                   <c:if test="${not empty cookie.loggedID}">checked</c:if>
            >
            <label class="form-check-label" for="flexCheckDefault">
                Remember me
            </label>
        </div>
        <button class="btn btn-primary w-100 py-2" type="submit">LOGIN</button>
        <a href="../member/password-search" class="btn btn-primary w-100 py-2 mt-2">CHANGE PASWORD</a>
    </form>
</main>
<%@ include file="../include/footer.jsp" %>
