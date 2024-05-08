<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-08
  Time: 오전 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! String msg01 = "hello jsp !!!!!"; %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
    <h1>hello jsp</h1>

      <!-- jsp안에는 내장 객체들이 있음  request, response, out -->
      <% out.println(msg01);%>
      <%
        String name = request.getParameter("name");
        int age =  Integer.parseInt(request.getParameter("age"));

        out.println("나의 이름은 "+name+"입니다. <br>");
        out.println("나이는 "+age+"입니다.");
      %>
  </body>
</html>
