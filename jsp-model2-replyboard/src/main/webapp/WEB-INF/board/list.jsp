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
  <h2 class="mt-5 mb-5">글 목록111</h2>
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
                  <a href="../board/view?no=${boardDto.no}&num=${boardDto.num}"
                     class="step step${boardDto.restep}">
                    <i class="bi bi-arrow-return-right"></i>${boardDto.subject}
                  </a>
                </c:when>
                <c:otherwise>
                  <a href="../board/view?no=${boardDto.no}&num=${boardDto.num}">
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
  <%--pagination--%>
  <c:choose>
    <c:when test="${empty search}">
      <c:set var="link" value=""></c:set>
    </c:when>
    <c:otherwise>
      <c:set var="link" value="&search=${search}&searchWord=${searchWord}"></c:set>
    </c:otherwise>
  </c:choose>
  <nav aria-label="Page navigation example" class="mt-5 mb-5">
    <div class="d-flex justify-content-center mb-5">
      <span>paginationStart==${paginationStart} / </span>
      <span>paginationEnd==${paginationEnd} / </span>
      <span>paginationPerPage==${paginationPerPage} / </span>
      <span>totalPagination==${totalPagination}</span>
    </div>
    <ul class="pagination d-flex justify-content-center">
      <c:if test="${paginationStart!=1}">
        <li class="page-item">
          <a class="page-link"
             href="../board/list?page=1${link}" aria-label="Next">
            <i class="bi bi-chevron-double-left"></i>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="../board/list?page=${paginationStart-1}${link}" aria-label="Previous">
            <i class="bi bi-chevron-left"></i>
          </a>
        </li>
      </c:if>
      <c:forEach begin="${paginationStart}" end="${paginationEnd}" step="1" var="page">
        <c:choose>
          <c:when test="${empty param.page && page == 1}">
            <li class="page-item active">
                  <span class="page-link" href="../board/list?page=${page}${link}">
                      ${page}
                  </span>
            </li>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${param.page ne page}">
                <li class="page-item">
                  <a class="page-link" href="../board/list?page=${page}${link}">
                      ${page}
                  </a>
                </li>
              </c:when>
              <c:otherwise>

                <li class="page-item active">
                  <span class="page-link" href="../board/list?page=${page}${link}">
                      ${page}
                  </span>
                </li>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>

      </c:forEach>
      <c:if test="${totalPagination != paginationEnd}">
      <li class="page-item">
        <a class="page-link"
           href="../board/list?page=${paginationStart+paginationPerPage}${link}" aria-label="Next">
          <i class="bi bi-chevron-right"></i>
        </a>
      </li>
      <li class="page-item">
        <a class="page-link"
           href="../board/list?page=${totalPagination}${link}" aria-label="Next">
          <i class="bi bi-chevron-double-right"></i>
        </a>
      </li>
      </c:if>
    </ul>
  </nav>
  <form action="../board/list">
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
  <div class="mt-5">
    <a href="../board/write" class="btn btn-primary">WRITE</a>
  </div>
</div>
<%@ include file="../include/footer.jsp" %>
