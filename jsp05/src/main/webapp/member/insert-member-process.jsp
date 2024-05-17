<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.jjang051.jsp05.connect.JDBCConnect" %>
<%@ page import="com.jjang051.jsp05.utils.ScriptWriter" %>
<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %><%--
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
    String userEmail = request.getParameter("userEmail");
    String address = request.getParameter("address");
    int postCode = Integer.parseInt(request.getParameter("postCode"));
    String detailAddress = request.getParameter("detailAddress");



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
    //JDBCConnect jdbcConnect = new JDBCConnect(application);
    // Pool을 만들어서 사용
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    //회원가입 되는지 확인...

    String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?)";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);

    jdbcConnectionPool.pstmt.setString(1,userID);
    jdbcConnectionPool.pstmt.setString(2,userPW);
    jdbcConnectionPool.pstmt.setString(3,userName);
    jdbcConnectionPool.pstmt.setString(4,userEmail);
    jdbcConnectionPool.pstmt.setInt(5,postCode);
    jdbcConnectionPool.pstmt.setString(6,address);
    jdbcConnectionPool.pstmt.setString(7,detailAddress);
    jdbcConnectionPool.pstmt.setString(8,birth);
    int result = jdbcConnectionPool.pstmt.executeUpdate();
    System.out.println("result==="+result);
    if(result > 0) {
        //out.println("<script>alert(\"회원가입 되었습니다.\");</script>");
        ScriptWriter
                .alertAndNext(response,"회원가입 되었습니다.","../index/index.jsp");
    } else {
        //out.println("<script>alert(\"회원가입 안되었습니다.\");</script>");
        ScriptWriter
            .alertAndBack(response,"회원가입이 되지 않았습니다. 잠시 후 다시 시도해 주세요.");
    }
    jdbcConnectionPool.close();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
