<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-20
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>
<div class="container">
<h2>JSTL</h2>
<c:set var="pageVar" value="page에 설정된 변수"></c:set>
<c:set var="requestVar" value="request에 설정된 변수" scope="request"></c:set>
<c:set var="sessionVar" value="session에 설정된 변수" scope="session"></c:set>
<c:set var="applicationVar" value="application에 설정된 변수" scope="application"></c:set>
<c:set var="betweenVar">사이에 설정된 변수</c:set>
<c:set var="number" value="10"></c:set>
<c:set var="string" value="JAVA"></c:set>

<ul>
    <li>page에 변수 설정 : ${pageScope.pageVar} </li>
    <li>request에 변수 설정 : ${requestScope.requestVar} </li>
    <li>session에 변수 설정 : ${sessionScope.sessionVar} </li>
    <li>application에 변수 설정 : ${applicationScope.applicationVar} </li>
    <li>사이에 변수 설정 : ${betweenVar} </li>
    <c:if test="${number % 2 != 0}">
        <li>${number}는 짝수니까 출력</li>
    </c:if>
    <c:if test="${string eq 'JAVA'}">
        <li>${string}은 출력</li>
    </c:if>
    <c:if test="true">
        <li>test에 true가 들어가면 출력</li>
    </c:if>
    <c:if test="TRUE">
        <li>test에 TRUE가 들어가면 출력</li>
    </c:if>
    <c:if test="${true}">
        <li>test에 ${true}가 들어가면 출력</li>
    </c:if>
    <c:if test="${true}">
        <li>test에 ${true}가 들어가면 출력</li>
    </c:if>
    <%--<if else문></if>--%>
    <c:choose>
        <c:when test="${number mod 2 eq 0}">
            <li>${number}는 짝수입니다.</li>
        </c:when>
        <c:otherwise>
            <li>${number}는 홀수입니다.</li>
        </c:otherwise>
    </c:choose>
</ul>
<ul>
    <%--<for int i="0";i<20;i++></for>--%>
    <c:forEach begin="1" end="20" step="1" var="i">
        <li>${i}</li>
    </c:forEach>
</ul>


<ul>
    <%--<for int i="0";i<20;i++></for>--%>

    <c:forEach begin="1" end="10" step="1" var="idx" varStatus="loop">
        <li>
            <p>i : ${idx}</p>
            <p>count : ${loop.count}</p>
            <p>index : ${loop.index}</p>
            <p>current : ${loop.current}</p>
            <p>first : ${loop.first}</p>
            <p>last : ${loop.last}</p>
        </li>
    </c:forEach>
</ul>
<c:set var="total" value="0"></c:set>
<c:choose>
    <c:when test="${total eq 0}">
        <p>게시글이 없습니다.</p>
    </c:when>
    <c:otherwise>
        <table class="table-striped table">
                <%--<for int i="0";i<20;i++></for>--%>
            <c:forEach begin="1" end="10" step="1" var="idx" varStatus="loop">
                <tr>
                    <td>${total - idx}</td>
                    <td>제목을 씁니다. ${idx}</td>
                    <td>글쓴 사람 ${idx}</td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>
    </div>
    <%@ include file="../include/footer.jsp" %>
