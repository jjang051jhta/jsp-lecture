<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.jjang051.jsp05.utils.ScriptWriter" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-16
  Time: 오전 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // history.back()을 하면 refresh가 같이 발생을 함,,,, 크롬도 막힌거 같음...
    String userID = request.getParameter("userID");
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql =  "delete from member where userId = ?";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    int result = pstmt.executeUpdate();
    response.setContentType("application/json; charset=utf-8");
    Map <String,String> resultMap = new HashMap<>();
    if(result>0) {
        resultMap.put("isDelete","yes");
    } else {
        resultMap.put("isDelete","no");
    }
    Gson gson = new Gson();
    String returnJson = gson.toJson(resultMap); //json으로 변환해줌...
    out.println(returnJson);
%>




