<%@ page import="com.jjang051.jsp05.utils.CookieManager" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String loggedID = CookieManager.readCookie(request,"loggedID");
    String isChecked ="";
    if(!loggedID.equals("")) {
        isChecked="checked";
    }
%>
<%@ include file="../include/header.jsp" %>
<main class="form-signin w-100 m-auto">
    <form action="login-member-process.jsp" method="post">
        <%-- <img class="mb-4" src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">--%>
        <h1 class="h3 mb-3 fw-normal">Please log in</h1>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="userID">
            <label for="floatingInput">User ID</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="userPW">
            <label for="floatingPassword">Password</label>
        </div>

        <div class="form-check text-start my-3">
            <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault" name="saveID"
                   value="yes" <%=isChecked%> >
            <label class="form-check-label" for="flexCheckDefault">
                Remember me
            </label>
        </div>
        <button class="btn btn-primary w-100 py-2" type="submit">Log in</button>
    </form>
</main>
<%@ include file="../include/footer.jsp"%>
