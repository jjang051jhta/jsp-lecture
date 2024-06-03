<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-30
  Time: 오후 5:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <h1 class="modal-title fs-5" id="staticBackdropLabel">${messageDto.title}</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
    ${messageDto.content}
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CLOSE</button>
</div>
