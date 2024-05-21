<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">회원정보</h2>
    <table class="table table-bordered">
        <tr>
            <th>USERID</th>
            <td>${sessionMemberDto.userID}</td>
        </tr>
        <tr>
            <th>USERNAME</th>
            <td>${infoMemberDto.userName}</td>
        </tr>
        <tr>
            <th>EMAIL</th>
            <td>${infoMemberDto.email}</td>
        </tr>
        <tr>
            <th>POSTCODE</th>
            <td>${infoMemberDto.postCode}</td>
        </tr>
        <tr>
            <th>ADDRESS</th>
            <td>${infoMemberDto.address} <br>${infoMemberDto.addressDetail}</td>
        </tr>
        <tr>
            <th>BIRTH</th>
            <td>${infoMemberDto.birth}</td>
        </tr>
    </table>
</div>
<%@ include file="../include/footer.jsp"%>
