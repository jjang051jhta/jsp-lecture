<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-17
  Time: 오후 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String no = request.getParameter("no");
%>
<%@ include file="../include/header.jsp" %>
    <div class="container">
        <form action="../board/delete-password-process.jsp" method="post">
            <label for="userPW">PASSWORD</label>
            <input type="password" id="userPW" class="form-control" name="userPW">
            <input type="hidden" name="no" value="${param.no}">
            <%--<input type="hidden" name="no" value="<%=no%>">--%>
            <button class="btn btn-primary mt-2">DELETE</button>
        </form>
    </div>

<%@ include file="../include/footer.jsp" %>