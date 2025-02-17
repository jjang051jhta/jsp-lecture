<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.jjang051.jsp05.utils.CookieManager" %>
<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="com.jjang051.jsp05.utils.ScriptWriter" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-10
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    String saveID = request.getParameter("saveID");
    /*Class.forName("oracle.jdbc.OracleDriver");
    Connection conn =
    DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jhta051","1234");*/
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "select * from member where userId = ? and userPw = ?";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setString(1,userID);
    jdbcConnectionPool.pstmt.setString(2,userPW);
    jdbcConnectionPool.rs = jdbcConnectionPool.pstmt.executeQuery();
    //결과 돌려주기
    if(jdbcConnectionPool.rs.next()) {
        //로그인 됐음
        String userId = jdbcConnectionPool.rs.getString("userid");
        String userName = jdbcConnectionPool.rs.getString("username");
        //System.out.println(userId+"=="+userName);
        if(saveID!=null && saveID.equals("yes")) {
            //쿠키설정
            CookieManager.createCookie(response,"loggedID",userId,60*60*24*365);
        } else {
            CookieManager.deleteCookie(response,"loggedID");
        }
        session.setAttribute("userId",userId);
        session.setAttribute("userName",userName);
        response.sendRedirect("../index/index.jsp");

    } else {
        ScriptWriter.alertAndBack(response,"아이디 패스워드 확인해 주세요.");
    }
    jdbcConnectionPool.close();

%>
