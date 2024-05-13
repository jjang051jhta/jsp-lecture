<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    System.out.println(userID);
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "select count(*) as count from member where userID = ?";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    ResultSet rs = pstmt.executeQuery();
    int result = 0; // 중복이 아니면 0, 중복이면 1
    if(rs.next()) {
        result = rs.getInt("count");
    }
    response.setContentType("application/json; charset=utf-8");
    Map<String , Integer> countMap = new HashMap<>();
    countMap.put("count",result);
    Gson gson = new Gson();
    String returnJson = gson.toJson(countMap);
    out.println(returnJson);
    //response.setContentType("application/json; charset=utf-8");
    //out.println("{\"count\":\""+result+"\"}");
    //만약 userID 가 db에 있으면 알려주면 된다.
    //System.out.println("ajax === "+userID);
%>