<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-10
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    String userName = request.getParameter("userName");
    String birth = request.getParameter("birth");
    //String 던져도 알아서 들어감...

    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn =
    DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jhta051","1234");
    //sqlinjection
    String sql = "insert into member values(member_seq.nextval,?,?,?,?)";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    pstmt.setString(2,userPW);
    pstmt.setString(3,userName);
    pstmt.setString(4,birth);
    int result = pstmt.executeUpdate();
    if(result > 0) {
        out.println("<script>alert(\"회원가입 되었습니다.\");</script>");
    } else {
        out.println("<script>alert(\"회원가입 안되었습니다.\");</script>");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
