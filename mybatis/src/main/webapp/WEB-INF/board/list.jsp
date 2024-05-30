<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-30
  Time: 오전 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
    <div class="container">
        <h2 class="mt-5 mb-5">LIST</h2>
        <form action="../board/delete-all" method="post">
            <table class="table table-striped">
                <colgroup>
                    <col style="width:80px">
                    <col>
                    <col style="width:150px">
                    <col style="width:80px">
                    <col style="width:250px">
                </colgroup>
                <thead>
                <tr>
                    <th>NO</th>
                    <th>SUBJECT</th>
                    <th>WRITER</th>
                    <th>HIT</th>
                    <th>DATE</th>
                    <td><input type="checkbox" id="check-all"></td>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${boardList}" var="boardDto" varStatus="loop">
                    <tr>
                        <%--<td>${total - (param.page - 1)*10 - loop.index}</td>--%>
                        <td>${total - boardDto.num + 1}</td>
                            <td><a href="../board/view?no=${boardDto.no}">${boardDto.subject}</a></td>
                        <td>${boardDto.userName}</td>
                        <td>${boardDto.hit}</td>
                        <td>${boardDto.regDate}</td>
                        <td><input type="checkbox" name="check" value="${boardDto.no}"></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="mt-5 mb-5 d-flex justify-content-end">
                <button class="btn btn-danger">DELETE-ALL</button>
            </div>
        </form>
        <form action="../board/search" class="mt-5 mb-5">
            <div class="row g-3 align-items-center">
                <div class="col-2">
                    <select class="form-select" aria-label="Default select example" name="search">
                        <option value="subject"  ${search eq "subject"?"selected":""}>제목</option>
                        <option value="username" ${search eq "username"?"selected":""}>글쓴이</option>
                        <option value="content"  ${search eq "content"?"selected":""}>내용</option>
                        <option value="all"      ${search eq "all"?"selected":""}>제목 + 내용</option>
                    </select>
                </div>
                <div class="col-7">
                    <input type="text" name="searchWord" class="form-control" value="${searchWord}">
                </div>
                <div class="col-3">
                    <button class="btn btn-primary">SEARCH</button>
                </div>
            </div>
        </form>
        <div class="mt-5 mb-5">
            <a href="../board/write" class="btn btn-primary">WRITE</a>
        </div>
    </div>

<%@ include file="../include/footer.jsp" %>


