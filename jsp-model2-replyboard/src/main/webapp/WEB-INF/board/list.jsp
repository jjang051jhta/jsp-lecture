<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-27
  Time: 오전 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
  <h2 class="mt-5 mb-5">글 목록</h2>
  <table class="table table-striped">
    <colgroup>
      <col style="width:80px">
      <col>
      <col style="width:150px">
      <col style="width:80px">
      <col style="width:80px">
      <col style="width:80px">
      <col style="width:80px">
      <col style="width:150px">
    </colgroup>
    <thead>
    <tr>
      <th>NO</th>
      <th>SUBJECT</th>
      <th>WRITER</th>
      <th>REGROUP</th>
      <th>RELEVEL</th>
      <th>RESTEP</th>
      <th>HIT</th>
      <th>DATE</th>
    </tr>
    </thead>
    <tbody>
      <c:forEach items="${boardList}" var="boardDto" varStatus="loop">
      <tr class="align-middle">
        <td>${loop.count}</td>
        <td>
         <%-- available = ${boardDto.available}--%>
          <c:choose>
            <c:when test="${boardDto.available > 0}">
              <c:choose>
                <c:when test="${boardDto.restep > 1}">
                  <a href="../board/view?no=${boardDto.no}"
                     class="step step${boardDto.restep}">
                    <i class="bi bi-arrow-return-right"></i>${boardDto.subject}
                  </a>
                </c:when>
                <c:otherwise>
                  <a href="../board/view?no=${boardDto.no}">
                    ${boardDto.subject}
                  </a>
                </c:otherwise>
              </c:choose>
            </c:when>
            <c:otherwise>
              <c:choose>
                <c:when test="${boardDto.restep > 1}">
                  <span class="step step${boardDto.restep}">
                    <i class="bi bi-arrow-return-right"></i>삭제된 글입니다.
                  </span>
                </c:when>
                <c:otherwise>
                  <span>삭제된 글입니다.</span>
                </c:otherwise>
              </c:choose>
            </c:otherwise>
          </c:choose>
        </td>
        <td>${boardDto.userName}</td>
        <td>${boardDto.regroup}</td>
        <td>${boardDto.relevel}</td>
        <td>${boardDto.restep}</td>
        <td>${boardDto.hit}</td>
        <td>${boardDto.regDate}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <nav aria-label="Page navigation example" class="mt-5 mb-5">
    <ul class="pagination d-flex justify-content-center">
      <li class="page-item">
        <a class="page-link" href="" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
      <c:forEach begin="1" end="${totalPage}" step="1" var="page">
        <c:choose>
          <c:when test="${param.page ne page}">
            <li class="page-item">
              <a class="page-link" href="../board/list?page=${page}">
                  ${page}
              </a>
            </li>
          </c:when>
          <c:otherwise>
            <li class="page-item active">
              <span class="page-link">
                  ${page}
              </span>
            </li>
          </c:otherwise>
        </c:choose>
      </c:forEach>

      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
  <div class="mt-5">
    <a href="../board/write" class="btn btn-primary">WRITE</a>
  </div>
</div>
<%@ include file="../include/footer.jsp" %>
