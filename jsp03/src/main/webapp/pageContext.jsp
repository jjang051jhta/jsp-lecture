<%@ page import="com.jjang051.jsp03.dto.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-09
  Time: 오전 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //setAttribute에는 뭐든 담을 수 있음 값을 끄집어 낼때는 반드시 형변환 필요
    pageContext.setAttribute("pageContextInt",100);
    pageContext.setAttribute("pageContextString","jjang051");
    pageContext.setAttribute("pageContextPerson",new Person("장성호",30));
    request.setAttribute("requestString","jjang052");
    session.setAttribute("sessionString","jjang053");
    session.setAttribute("sessionPerson",new Person("장성호qqq",50));

    //getAttribute()의 리턴값을 Object이므로 형변환해서 써야 한다.
    //로그인 했을때 많이 사용한다.
    //  application > session > request > pageContext

    int pageContextInt = (int)pageContext.getAttribute("pageContextInt");
    String pageContextString = (String)pageContext.getAttribute("pageContextString");
    Person pageContextPerson = (Person)pageContext.getAttribute("pageContextPerson");
%>
<h1><%= pageContextInt %></h1>
<h1><%= pageContextString %></h1>
<h1><%= pageContextPerson.getAge() %></h1>
<h1><%= pageContextPerson.getName() %></h1>
<%
    //jsp를 view로 사용할때 쓰는 방법
    //request에 실린 값은 forward로 페이지 바뀔때만 한번 넘길 수 있다.
    //request.getRequestDispatcher("second.jsp").forward(request,response);
    response.sendRedirect("second.jsp");
%>

</body>
</html>
