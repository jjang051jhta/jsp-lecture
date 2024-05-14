<%@ page import="com.jjang051.jsp05.dto.MemberDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("scope","페이지");
    request.setAttribute("scope","리퀘스트");
    session.setAttribute("scope","세션");
    application.setAttribute("scope","어플리케이션");

    request.setAttribute("memberDto",new MemberDto(30,"홍길동","gildong","1234"));
    int num03 = 10;
    int num04 = 20;
    pageContext.setAttribute("num01",10);
    pageContext.setAttribute("num02",20);
    List<MemberDto> memberDtoList = new ArrayList<>();
    memberDtoList.add(new MemberDto(40,"정형돈","jung","1234"));
    memberDtoList.add(new MemberDto(50,"유재석","you","5678"));
    request.setAttribute("memberList",memberDtoList);

    Map<String,MemberDto> memberDtoMap = new HashMap<>();
    memberDtoMap.put("person",new MemberDto(40,"정형돈","jung","1234"));
    memberDtoMap.put("사람",new MemberDto(50,"유재석","you","5678"));
    request.setAttribute("memberDtoMap",memberDtoMap);








%>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>${pageScope.scope}</p>
    <p>${requestScope.scope}</p>
    <p>${sessionScope.scope}</p>
    <p>${applicationScope.scope}</p>
    <hr>
    <p>${scope}</p>
    <hr>
    <h2>param 값 받기</h2>
    <p>${param.name}</p>
    <p>${param.userId}</p>
    <p>${paramValues.inter[0]}</p>
    <p>${paramValues.inter[1]}</p>
    <hr>
    <h2>initparam 값 받기</h2>
    <p>${initParam.OracleDriver}</p>
    <p>${initParam.OracleURL}</p>
    <hr>
    <h2>cookie 값 받기</h2>
    <p>${cookie.loggedID.value}</p>
    <hr>
    <h2>객체 값 받기</h2>
    <p>${requestScope.memberDto["age"]}</p>
    <p>${requestScope.memberDto.name}</p>
    <p>${requestScope.memberDto.userID}</p>
    <p>${requestScope.memberDto.userPW}</p>
    <p>${requestScope.memberDto.userPW}</p>
    <hr>
    <h2>cotext 값 받기</h2>
    <p><a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a></p>
    <hr>
    <h2>연산 </h2>
    <p>${num01 + num02}</p>
    <p>${num01 * num02}</p>
    <p>${num01 / num02}</p>
    <p>${num01 % num02}</p>

    <p>${num01 > num02}</p>
    <p>${num01 < num02}</p>
    <p>${num01 >= num02}</p>
    <p>${num01 <= num02}</p>
    <p>${num01 == num02}</p>
    <p>${num01 != num02}</p>



    <p>${num01 gt num02}</p>
    <p>${num01 lt num02}</p>
    <p>${num01 ge num02}</p>
    <p>${num01 le num02}</p>
    <p>${num01 eq num02}</p>
    <p>${num01 ne num02}</p>

    <hr>
    <p>num03=<%=num03%></p>
    <hr>
    <h2>리스트 출력</h2>
    <p>${memberList[0].age}</p>
    <p>${memberList[0].name}</p>
    <p>${memberList[0].userID}</p>
    <p>${memberList[0].userPW}</p>

    <hr>
    <h2>맵 출력</h2>
    <p>${memberDtoMap.person.age}</p>
    <p>${memberDtoMap.person.name}</p>
    <p>${memberDtoMap.person.userID}</p>
    <p>${memberDtoMap.person.userPW}</p>
    <hr>
    <h2>맵 출력</h2>
    <p>${memberDtoMap["사람"].age}</p>
    <p>${memberDtoMap["사람"].name}</p>
    <p>${memberDtoMap["사람"].userID}</p>
    <p>${memberDtoMap["사람"].userPW}</p>

    <hr>
    <h2>삼항연산자</h2>
    <p>${ num01 > num02 ? "num01이 크다" : "num02가 크다"}</p>

    <%
        request.setAttribute("objNull",null);
        request.setAttribute("emptyString","");

    %>
    <hr>
    <h2>null 연산자</h2>
    <p>objNull===>${empty objNull}</p>
    <p>emptyString===>${empty emptyString}</p>
    <p>${objNull+10}</p>
    <p>${objNull - 10}</p>
    <p>${objNull * 10}</p>
    <p>${objNull / 10}</p>
    <p>${10 / objNull}</p>



















    <%--<jsp:forward page="forward.jsp"></jsp:forward>--%>

</body>
</html>
