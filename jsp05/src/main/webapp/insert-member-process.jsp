<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.jjang051.jsp05.connect.JDBCConnect" %>
<%@ page import="com.jjang051.jsp05.utils.ScriptWriter" %><%--
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

    //JDBCConnect jdbcConnect = new JDBCConnect();

    /*String driver = application.getInitParameter("OracleDriver");
    String url = application.getInitParameter("OracleURL");
    String id = application.getInitParameter("OracleId");
    String password = application.getInitParameter("OraclePassword");
    JDBCConnect jdbcConnect = new JDBCConnect(driver, url, id, password);*/
    //설정파일 web.xml 바꾼거니까 서버 재가동 하는게 좋다.
    // web.xml에 아이디 비밀번호 저장해두고 쓰기...
    JDBCConnect jdbcConnect = new JDBCConnect(application);

    //sqlinjection
    String sql = "insert into member values(member_seq.nextval,?,?,?,?)";
    PreparedStatement pstmt = jdbcConnect.conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    pstmt.setString(2,userPW);
    pstmt.setString(3,userName);
    pstmt.setString(4,birth);
    int result = pstmt.executeUpdate();
    if(result > 0) {
        //out.println("<script>alert(\"회원가입 되었습니다.\");</script>");
        ScriptWriter
                .alertAndNext(response,"회원가입 되었습니다.","index.jsp");
    } else {
        //out.println("<script>alert(\"회원가입 안되었습니다.\");</script>");
        ScriptWriter
            .alertAndBack(response,"회원가입이 되지 않았습니다. 잠시 후 다시 시도해 주세요.");
    }
    jdbcConnect.close();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
